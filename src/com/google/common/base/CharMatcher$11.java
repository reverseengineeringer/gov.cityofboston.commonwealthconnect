package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.Arrays;
import java.util.BitSet;

final class CharMatcher$11
  extends CharMatcher
{
  CharMatcher$11(String paramString, char[] paramArrayOfChar)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return Arrays.binarySearch(val$chars, paramChar) >= 0;
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    char[] arrayOfChar = val$chars;
    int j = arrayOfChar.length;
    int i = 0;
    while (i < j)
    {
      paramBitSet.set(arrayOfChar[i]);
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */