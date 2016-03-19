package com.google.common.base;

final class CharMatcher$3
  extends CharMatcher
{
  CharMatcher$3(String paramString)
  {
    super(paramString);
  }
  
  public boolean matches(char paramChar)
  {
    return Character.isLetter(paramChar);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */