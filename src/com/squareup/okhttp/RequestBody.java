package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import okio.BufferedSink;
import okio.Okio;
import okio.Source;

public abstract class RequestBody
{
  public static RequestBody create(MediaType paramMediaType, final File paramFile)
  {
    if (paramFile == null) {
      throw new NullPointerException("content == null");
    }
    new RequestBody()
    {
      public long contentLength()
      {
        return paramFile.length();
      }
      
      public MediaType contentType()
      {
        return val$contentType;
      }
      
      public void writeTo(BufferedSink paramAnonymousBufferedSink)
        throws IOException
      {
        Object localObject = null;
        try
        {
          Source localSource = Okio.source(paramFile);
          localObject = localSource;
          paramAnonymousBufferedSink.writeAll(localSource);
          Util.closeQuietly(localSource);
          return;
        }
        finally
        {
          Util.closeQuietly((Closeable)localObject);
        }
      }
    };
  }
  
  public static RequestBody create(MediaType paramMediaType, String paramString)
  {
    Object localObject = Util.UTF_8;
    MediaType localMediaType = paramMediaType;
    if (paramMediaType != null)
    {
      Charset localCharset = paramMediaType.charset();
      localObject = localCharset;
      localMediaType = paramMediaType;
      if (localCharset == null)
      {
        localObject = Util.UTF_8;
        localMediaType = MediaType.parse(paramMediaType + "; charset=utf-8");
      }
    }
    return create(localMediaType, paramString.getBytes((Charset)localObject));
  }
  
  public static RequestBody create(MediaType paramMediaType, final byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException("content == null");
    }
    new RequestBody()
    {
      public long contentLength()
      {
        return paramArrayOfByte.length;
      }
      
      public MediaType contentType()
      {
        return val$contentType;
      }
      
      public void writeTo(BufferedSink paramAnonymousBufferedSink)
        throws IOException
      {
        paramAnonymousBufferedSink.write(paramArrayOfByte);
      }
    };
  }
  
  public long contentLength()
  {
    return -1L;
  }
  
  public abstract MediaType contentType();
  
  public abstract void writeTo(BufferedSink paramBufferedSink)
    throws IOException;
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.RequestBody
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */