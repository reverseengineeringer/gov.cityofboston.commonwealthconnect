package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import okio.BufferedSink;

public final class MultipartBuilder
{
  public static final MediaType ALTERNATIVE;
  public static final MediaType DIGEST;
  public static final MediaType FORM = MediaType.parse("multipart/form-data");
  public static final MediaType MIXED = MediaType.parse("multipart/mixed");
  public static final MediaType PARALLEL;
  private final String boundary;
  private final List<RequestBody> partBodies = new ArrayList();
  private final List<Headers> partHeaders = new ArrayList();
  private MediaType type = MIXED;
  
  static
  {
    ALTERNATIVE = MediaType.parse("multipart/alternative");
    DIGEST = MediaType.parse("multipart/digest");
    PARALLEL = MediaType.parse("multipart/parallel");
  }
  
  public MultipartBuilder()
  {
    this(UUID.randomUUID().toString());
  }
  
  public MultipartBuilder(String paramString)
  {
    boundary = paramString;
  }
  
  public MultipartBuilder addPart(Headers paramHeaders, RequestBody paramRequestBody)
  {
    if (paramRequestBody == null) {
      throw new NullPointerException("body == null");
    }
    if ((paramHeaders != null) && (paramHeaders.get("Content-Type") != null)) {
      throw new IllegalArgumentException("Unexpected header: Content-Type");
    }
    if ((paramHeaders != null) && (paramHeaders.get("Content-Length") != null)) {
      throw new IllegalArgumentException("Unexpected header: Content-Length");
    }
    partHeaders.add(paramHeaders);
    partBodies.add(paramRequestBody);
    return this;
  }
  
  public MultipartBuilder addPart(RequestBody paramRequestBody)
  {
    return addPart(null, paramRequestBody);
  }
  
  public RequestBody build()
  {
    if (partHeaders.isEmpty()) {
      throw new IllegalStateException("Multipart body must have at least one part.");
    }
    return new MultipartRequestBody(type, boundary, partHeaders, partBodies);
  }
  
  public MultipartBuilder type(MediaType paramMediaType)
  {
    if (paramMediaType == null) {
      throw new NullPointerException("type == null");
    }
    if (!paramMediaType.type().equals("multipart")) {
      throw new IllegalArgumentException("multipart != " + paramMediaType);
    }
    type = paramMediaType;
    return this;
  }
  
  private static final class MultipartRequestBody
    extends RequestBody
  {
    private final String boundary;
    private final MediaType contentType;
    private final List<RequestBody> partBodies;
    private final List<Headers> partHeaders;
    
    public MultipartRequestBody(MediaType paramMediaType, String paramString, List<Headers> paramList, List<RequestBody> paramList1)
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
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.MultipartBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */