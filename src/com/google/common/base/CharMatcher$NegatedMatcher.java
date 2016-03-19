package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

class CharMatcher$NegatedMatcher
  extends CharMatcher
{
  final CharMatcher original;
  
  CharMatcher$NegatedMatcher(CharMatcher paramCharMatcher)
  {
    this(paramCharMatcher + ".negate()", paramCharMatcher);
  }
  
  CharMatcher$NegatedMatcher(String paramString, CharMatcher paramCharMatcher)
  {
    super(paramString);
    original = paramCharMatcher;
  }
  
  public int countIn(CharSequence paramCharSequence)
  {
    return paramCharSequence.length() - original.countIn(paramCharSequence);
  }
  
  public boolean matches(char paramChar)
  {
    return !original.matches(paramChar);
  }
  
  public boolean matchesAllOf(CharSequence paramCharSequence)
  {
    return original.matchesNoneOf(paramCharSequence);
  }
  
  public boolean matchesNoneOf(CharSequence paramCharSequence)
  {
    return original.matchesAllOf(paramCharSequence);
  }
  
  public CharMatcher negate()
  {
    return original;
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    BitSet localBitSet = new BitSet();
    original.setBits(localBitSet);
    localBitSet.flip(0, 65536);
    paramBitSet.or(localBitSet);
  }
  
  CharMatcher withToString(String paramString)
  {
    return new NegatedMatcher(paramString, original);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.NegatedMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */