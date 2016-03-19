package com.google.common.io;

import com.google.common.base.CharMatcher;
import java.io.IOException;

final class BaseEncoding$3
  implements GwtWorkarounds.CharInput
{
  BaseEncoding$3(GwtWorkarounds.CharInput paramCharInput, CharMatcher paramCharMatcher) {}
  
  public void close()
    throws IOException
  {
    val$delegate.close();
  }
  
  public int read()
    throws IOException
  {
    int i;
    do
    {
      i = val$delegate.read();
    } while ((i != -1) && (val$toIgnore.matches((char)i)));
    return i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */