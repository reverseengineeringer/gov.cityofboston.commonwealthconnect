package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

final class CharMatcher$13
  extends CharMatcher.FastMatcher
{
  CharMatcher$13(String paramString, char paramChar1, char paramChar2)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return (val$startInclusive <= paramChar) && (paramChar <= val$endInclusive);
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    paramBitSet.set(val$startInclusive, val$endInclusive + '\001');
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */