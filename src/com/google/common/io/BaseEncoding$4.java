package com.google.common.io;

import java.io.IOException;

final class BaseEncoding$4
  implements GwtWorkarounds.CharOutput
{
  int charsUntilSeparator = val$afterEveryChars;
  
  BaseEncoding$4(int paramInt, String paramString, GwtWorkarounds.CharOutput paramCharOutput) {}
  
  public void close()
    throws IOException
  {
    val$delegate.close();
  }
  
  public void flush()
    throws IOException
  {
    val$delegate.flush();
  }
  
  public void write(char paramChar)
    throws IOException
  {
    if (charsUntilSeparator == 0)
    {
      int i = 0;
      while (i < val$separator.length())
      {
        val$delegate.write(val$separator.charAt(i));
        i += 1;
      }
      charsUntilSeparator = val$afterEveryChars;
    }
    val$delegate.write(paramChar);
    charsUntilSeparator -= 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */