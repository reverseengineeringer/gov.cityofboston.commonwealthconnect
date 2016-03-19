package com.google.common.io;

import java.io.IOException;

abstract interface GwtWorkarounds$CharInput
{
  public abstract void close()
    throws IOException;
  
  public abstract int read()
    throws IOException;
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.CharInput
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */