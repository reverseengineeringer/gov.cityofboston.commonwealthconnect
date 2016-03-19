package com.google.common.escape;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible(emulated=true)
final class Platform
{
  private static final ThreadLocal<char[]> DEST_TL = new ThreadLocal()
  {
    protected char[] initialValue()
    {
      return new char['Ѐ'];
    }
  };
  
  static char[] charBufferFromThreadLocal()
  {
    return (char[])DEST_TL.get();
  }
}

/* Location:
 * Qualified Name:     com.google.common.escape.Platform
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */