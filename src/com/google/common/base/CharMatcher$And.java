package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

class CharMatcher$And
  extends CharMatcher
{
  final CharMatcher first;
  final CharMatcher second;
  
  CharMatcher$And(CharMatcher paramCharMatcher1, CharMatcher paramCharMatcher2)
  {
    this(paramCharMatcher1, paramCharMatcher2, "CharMatcher.and(" + paramCharMatcher1 + ", " + paramCharMatcher2 + ")");
  }
  
  CharMatcher$And(CharMatcher paramCharMatcher1, CharMatcher paramCharMatcher2, String paramString)
  {
    super(paramString);
    first = ((CharMatcher)Preconditions.checkNotNull(paramCharMatcher1));
    second = ((CharMatcher)Preconditions.checkNotNull(paramCharMatcher2));
  }
  
  public boolean matches(char paramChar)
  {
    return (first.matches(paramChar)) && (second.matches(paramChar));
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    BitSet localBitSet1 = new BitSet();
    first.setBits(localBitSet1);
    BitSet localBitSet2 = new BitSet();
    second.setBits(localBitSet2);
    localBitSet1.and(localBitSet2);
    paramBitSet.or(localBitSet1);
  }
  
  CharMatcher withToString(String paramString)
  {
    return new And(first, second, paramString);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.And
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */