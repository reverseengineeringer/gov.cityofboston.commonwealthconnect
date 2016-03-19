package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

class CharMatcher$Or
  extends CharMatcher
{
  final CharMatcher first;
  final CharMatcher second;
  
  CharMatcher$Or(CharMatcher paramCharMatcher1, CharMatcher paramCharMatcher2)
  {
    this(paramCharMatcher1, paramCharMatcher2, "CharMatcher.or(" + paramCharMatcher1 + ", " + paramCharMatcher2 + ")");
  }
  
  CharMatcher$Or(CharMatcher paramCharMatcher1, CharMatcher paramCharMatcher2, String paramString)
  {
    super(paramString);
    first = ((CharMatcher)Preconditions.checkNotNull(paramCharMatcher1));
    second = ((CharMatcher)Preconditions.checkNotNull(paramCharMatcher2));
  }
  
  public boolean matches(char paramChar)
  {
    return (first.matches(paramChar)) || (second.matches(paramChar));
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    first.setBits(paramBitSet);
    second.setBits(paramBitSet);
  }
  
  CharMatcher withToString(String paramString)
  {
    return new Or(first, second, paramString);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.Or
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */