package com.google.common.base;

final class CharMatcher$4
  extends CharMatcher
{
  CharMatcher$4(String paramString)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return Character.isLetterOrDigit(paramChar);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */