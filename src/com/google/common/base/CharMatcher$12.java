package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

final class CharMatcher$12
  extends CharMatcher.FastMatcher
{
  CharMatcher$12(String paramString, char paramChar1, char paramChar2)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return (paramChar == val$match1) || (paramChar == val$match2);
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    paramBitSet.set(val$match1);
    paramBitSet.set(val$match2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */