package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

final class CharMatcher$9
  extends CharMatcher.FastMatcher
{
  CharMatcher$9(String paramString, char paramChar)
  {
    super(paramString);
  }
  
  public CharMatcher and(CharMatcher paramCharMatcher)
  {
    if (paramCharMatcher.matches(val$match)) {
      return this;
    }
    return NONE;
  }
  
  public boolean matches(char paramChar)
  {
    return paramChar == val$match;
  }
  
  public CharMatcher negate()
  {
    return isNot(val$match);
  }
  
  public CharMatcher or(CharMatcher paramCharMatcher)
  {
    if (paramCharMatcher.matches(val$match)) {
      return paramCharMatcher;
    }
    return super.or(paramCharMatcher);
  }
  
  public String replaceFrom(CharSequence paramCharSequence, char paramChar)
  {
    return paramCharSequence.toString().replace(val$match, paramChar);
  }
  
  @GwtIncompatible("java.util.BitSet")
  void setBits(BitSet paramBitSet)
  {
    paramBitSet.set(val$match);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */