package com.seeclickfix.ma.android.net;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;

public class CustomMultipartEntity
  extends MultipartEntity
{
  private final ProgressListener listener;
  
  public CustomMultipartEntity(ProgressListener paramProgressListener)
  {
    listener = paramProgressListener;
  }
  
  public CustomMultipartEntity(HttpMultipartMode paramHttpMultipartMode, ProgressListener paramProgressListener)
  {
    super(paramHttpMultipartMode);
    listener = paramProgressListener;
  }
  
  public CustomMultipartEntity(HttpMultipartMode paramHttpMultipartMode, String paramString, Charset paramCharset, ProgressListener paramProgressListener)
  {
    super(paramHttpMultipartMode, paramString, paramCharset);
    listener = paramProgressListener;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    super.writeTo(new CountingOutputStream(paramOutputStream, listener));
  }
  
  public static class CountingOutputStream
    extends FilterOutputStream
  {
    private final CustomMultipartEntity.ProgressListener listener;
    private long transferred;
    
    public CountingOutputStream(OutputStream paramOutputStream, CustomMultipartEntity.ProgressListener paramProgressListener)
    {
      super();
      listener = paramProgressListener;
      transferred = 0L;
    }
    
    public void write(int paramInt)
      throws IOException
    {
      out.write(paramInt);
      transferred += 1L;
      listener.transferred(transferred);
    }
    
    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      out.write(paramArrayOfByte, paramInt1, paramInt2);
      transferred += paramInt2;
      listener.transferred(transferred);
    }
  }
  
  public static abstract interface ProgressListener
  {
    public abstract void transferred(long paramLong);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.CustomMultipartEntity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */