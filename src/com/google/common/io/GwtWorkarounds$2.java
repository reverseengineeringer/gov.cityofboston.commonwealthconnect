package com.google.common.io;

final class GwtWorkarounds$2
  implements GwtWorkarounds.CharInput
{
  int index = 0;
  
  GwtWorkarounds$2(CharSequence paramCharSequence) {}
  
  public void close()
  {
    index = val$chars.length();
  }
  
  public int read()
  {
    if (index < val$chars.length())
    {
      CharSequence localCharSequence = val$chars;
      int i = index;
      index = (i + 1);
      return localCharSequence.charAt(i);
    }
    return -1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */