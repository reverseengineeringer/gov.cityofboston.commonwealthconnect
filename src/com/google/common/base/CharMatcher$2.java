package com.google.common.base;

final class CharMatcher$2
  extends CharMatcher
{
  CharMatcher$2(String paramString)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return Character.isDigit(paramChar);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */