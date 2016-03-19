package com.google.common.io;

import java.io.IOException;

abstract interface GwtWorkarounds$ByteOutput
{
  public abstract void close()
    throws IOException;
  
  public abstract void flush()
    throws IOException;
  
  public abstract void write(byte paramByte)
    throws IOException;
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.ByteOutput
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */