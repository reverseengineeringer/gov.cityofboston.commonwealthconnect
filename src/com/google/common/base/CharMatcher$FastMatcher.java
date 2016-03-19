package com.google.common.base;

abstract class CharMatcher$FastMatcher
  extends CharMatcher
{
  CharMatcher$FastMatcher() {}
  
  CharMatcher$FastMatcher(String paramString)
  {
    super(paramString);
  }
  
  public CharMatcher negate()
  {
    return new CharMatcher.NegatedFastMatcher(this);
  }
  
  public final CharMatcher precomputed()
  {
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.FastMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */