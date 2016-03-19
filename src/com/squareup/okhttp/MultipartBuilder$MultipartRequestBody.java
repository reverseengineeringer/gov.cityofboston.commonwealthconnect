package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.util.List;
import okio.BufferedSink;

final class MultipartBuilder$MultipartRequestBody
  extends RequestBody
{
  private final String boundary;
  private final MediaType contentType;
  private final List<RequestBody> partBodies;
  private final List<Headers> partHeaders;
  
  public MultipartBuilder$MultipartRequestBody(MediaType paramMediaType, String paramString, List<Headers> paramList, List<RequestBody> paramList1)
  {
    if (paramMediaType == null) {
      throw new NullPointerException("type == null");
    }
    boundary = paramString;
    contentType = MediaType.parse(paramMediaType + "; boundary=" + paramString);
    partHeaders = Util.immutableList(paramList);
    partBodies = Util.immutableList(paramList1);
  }
  
  private static void writeBoundary(BufferedSink paramBufferedSink, byte[] paramArrayOfByte, boolean paramBoolean1, boolean paramBoolean2)
    throws IOException
  {
    if (!paramBoolean1) {
      paramBufferedSink.writeUtf8("\r\n");
    }
    paramBufferedSink.writeUtf8("--");
    paramBufferedSink.write(paramArrayOfByte);
    if (paramBoolean2)
    {
      paramBufferedSink.writeUtf8("--");
      return;
    }
    paramBufferedSink.writeUtf8("\r\n");
  }
  
  private void writePart(BufferedSink paramBufferedSink, Headers paramHeaders, RequestBody paramRequestBody)
    throws IOException
  {
    if (paramHeaders != null)
    {
      int i = 0;
      while (i < paramHeaders.size())
      {
        paramBufferedSink.writeUtf8(paramHeaders.name(i)).writeUtf8(": ").writeUtf8(paramHeaders.value(i)).writeUtf8("\r\n");
        i += 1;
      }
    }
    paramHeaders = paramRequestBody.contentType();
    if (paramHeaders != null) {
      paramBufferedSink.writeUtf8("Content-Type: ").writeUtf8(paramHeaders.toString()).writeUtf8("\r\n");
    }
    long l = paramRequestBody.contentLength();
    if (l != -1L) {
      paramBufferedSink.writeUtf8("Content-Length: ").writeUtf8(Long.toString(l)).writeUtf8("\r\n");
    }
    paramBufferedSink.writeUtf8("\r\n");
    paramRequestBody.writeTo(paramBufferedSink);
  }
  
  public MediaType contentType()
  {
    return contentType;
  }
  
  public void writeTo(BufferedSink paramBufferedSink)
    throws IOException
  {
    byte[] arrayOfByte = boundary.getBytes("UTF-8");
    boolean bool = true;
    int i = 0;
    while (i < partHeaders.size())
    {
      Headers localHeaders = (Headers)partHeaders.get(i);
      RequestBody localRequestBody = (RequestBody)partBodies.get(i);
      writeBoundary(paramBufferedSink, arrayOfByte, bool, false);
      writePart(paramBufferedSink, localHeaders, localRequestBody);
      bool = false;
      i += 1;
    }
    writeBoundary(paramBufferedSink, arrayOfByte, false, true);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.MultipartBuilder.MultipartRequestBody
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */