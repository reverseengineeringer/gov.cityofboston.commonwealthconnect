package com.google.common.io;

import java.io.IOException;
import java.io.OutputStream;

final class GwtWorkarounds$4
  extends OutputStream
{
  GwtWorkarounds$4(GwtWorkarounds.ByteOutput paramByteOutput) {}
  
  public void close()
    throws IOException
  {
    val$output.close();
  }
  
  public void flush()
    throws IOException
  {
    val$output.flush();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    val$output.write((byte)paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */