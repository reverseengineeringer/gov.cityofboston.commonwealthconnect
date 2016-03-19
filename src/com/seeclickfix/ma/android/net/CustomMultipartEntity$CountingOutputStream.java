package com.seeclickfix.ma.android.net;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class CustomMultipartEntity$CountingOutputStream
  extends FilterOutputStream
{
  private final CustomMultipartEntity.ProgressListener listener;
  private long transferred;
  
  public CustomMultipartEntity$CountingOutputStream(OutputStream paramOutputStream, CustomMultipartEntity.ProgressListener paramProgressListener)
  {
    super(paramOutputStream);
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

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.CustomMultipartEntity.CountingOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */