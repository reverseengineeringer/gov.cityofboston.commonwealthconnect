package com.google.common.base;

import java.util.Arrays;

final class CharMatcher$7
  extends CharMatcher.FastMatcher
{
  CharMatcher$7(String paramString)
  {
    super(paramString);
  }
  
  public CharMatcher and(CharMatcher paramCharMatcher)
  {
    return (CharMatcher)Preconditions.checkNotNull(paramCharMatcher);
  }
  
  public String collapseFrom(CharSequence paramCharSequence, char paramChar)
  {
    if (paramCharSequence.length() == 0) {
      return "";
    }
    return String.valueOf(paramChar);
  }
  
  public int countIn(CharSequence paramCharSequence)
  {
    return paramCharSequence.length();
  }
  
  public int indexIn(CharSequence paramCharSequence)
  {
    if (paramCharSequence.length() == 0) {
      return -1;
    }
    return 0;
  }
  
  public int indexIn(CharSequence paramCharSequence, int paramInt)
  {
    int j = paramCharSequence.length();
    Preconditions.checkPositionIndex(paramInt, j);
    int i = paramInt;
    if (paramInt == j) {
      i = -1;
    }
    return i;
  }
  
  public int lastIndexIn(CharSequence paramCharSequence)
  {
    return paramCharSequence.length() - 1;
  }
  
  public boolean matches(char paramChar)
  {
    return true;
  }
  
  public boolean matchesAllOf(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return true;
  }
  
  public boolean matchesNoneOf(CharSequence paramCharSequence)
  {
    return paramCharSequence.length() == 0;
  }
  
  public CharMatcher negate()
  {
    return NONE;
  }
  
  public CharMatcher or(CharMatcher paramCharMatcher)
  {
    Preconditions.checkNotNull(paramCharMatcher);
    return this;
  }
  
  public String removeFrom(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return "";
  }
  
  public String replaceFrom(CharSequence paramCharSequence, char paramChar)
  {
    paramCharSequence = new char[paramCharSequence.length()];
    Arrays.fill(paramCharSequence, paramChar);
    return new String(paramCharSequence);
  }
  
  public String replaceFrom(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramCharSequence1.length() * paramCharSequence2.length());
    int i = 0;
    while (i < paramCharSequence1.length())
    {
      localStringBuilder.append(paramCharSequence2);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public String trimFrom(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return "";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */