package com.google.common.base;

final class CharMatcher$NegatedFastMatcher
  extends CharMatcher.NegatedMatcher
{
  CharMatcher$NegatedFastMatcher(CharMatcher paramCharMatcher)
  {
    super(paramCharMatcher);
  }
  
  CharMatcher$NegatedFastMatcher(String paramString, CharMatcher paramCharMatcher)
  {
    super(paramString, paramCharMatcher);
  }
  
  public final CharMatcher precomputed()
  {
    return this;
  }
  
  CharMatcher withToString(String paramString)
  {
    return new NegatedFastMatcher(paramString, original);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.NegatedFastMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */