package com.google.common.io;

import java.io.IOException;
import java.io.Writer;

final class GwtWorkarounds$5
  implements GwtWorkarounds.CharOutput
{
  GwtWorkarounds$5(Writer paramWriter) {}
  
  public void close()
    throws IOException
  {
    val$writer.close();
  }
  
  public void flush()
    throws IOException
  {
    val$writer.flush();
  }
  
  public void write(char paramChar)
    throws IOException
  {
    val$writer.append(paramChar);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */