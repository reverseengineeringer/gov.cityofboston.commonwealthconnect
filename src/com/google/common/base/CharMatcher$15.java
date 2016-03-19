package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

final class CharMatcher$15
  extends CharMatcher.FastMatcher
{
  CharMatcher$15(String paramString)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return " 　\r   　 \013　   　 \t     \f 　 　　 \n 　".charAt(1682554634 * paramChar >>> WHITESPACE_SHIFT) == paramChar;
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    int i = 0;
    while (i < " 　\r   　 \013　   　 \t     \f 　 　　 \n 　".length())
    {
      paramBitSet.set(" 　\r   　 \013　   　 \t     \f 　 　　 \n 　".charAt(i));
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */