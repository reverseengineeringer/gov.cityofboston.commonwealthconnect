package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

final class CharMatcher$10
  extends CharMatcher.FastMatcher
{
  CharMatcher$10(String paramString, char paramChar)
  {
    super(paramString);
  }
  
  public CharMatcher and(CharMatcher paramCharMatcher)
  {
    CharMatcher localCharMatcher = paramCharMatcher;
    if (paramCharMatcher.matches(val$match)) {
      localCharMatcher = super.and(paramCharMatcher);
    }
    return localCharMatcher;
  }
  
  public boolean matches(char paramChar)
  {
    return paramChar != val$match;
  }
  
  public CharMatcher negate()
  {
    return is(val$match);
  }
  
  public CharMatcher or(CharMatcher paramCharMatcher)
  {
    Object localObject = this;
    if (paramCharMatcher.matches(val$match)) {
      localObject = ANY;
    }
    return (CharMatcher)localObject;
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    paramBitSet.set(0, val$match);
    paramBitSet.set(val$match + '\001', 65536);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */