package com.android.volley.toolbox;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

class DiskBasedCache$CountingInputStream
  extends FilterInputStream
{
  private int bytesRead = 0;
  
  private DiskBasedCache$CountingInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public int read()
    throws IOException
  {
    int i = super.read();
    if (i != -1) {
      bytesRead += 1;
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt1 = super.read(paramArrayOfByte, paramInt1, paramInt2);
    if (paramInt1 != -1) {
      bytesRead += paramInt1;
    }
    return paramInt1;
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.DiskBasedCache.CountingInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */