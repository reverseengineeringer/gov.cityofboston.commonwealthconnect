package com.google.common.io;

import java.io.IOException;
import java.io.Reader;

final class GwtWorkarounds$1
  implements GwtWorkarounds.CharInput
{
  GwtWorkarounds$1(Reader paramReader) {}
  
  public void close()
    throws IOException
  {
    val$reader.close();
  }
  
  public int read()
    throws IOException
  {
    return val$reader.read();
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */