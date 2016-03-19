package com.google.common.base;

final class CharMatcher$8
  extends CharMatcher.FastMatcher
{
  CharMatcher$8(String paramString)
  {
    super(paramString);
  }
  
  public CharMatcher and(CharMatcher paramCharMatcher)
  {
    Preconditions.checkNotNull(paramCharMatcher);
    return this;
  }
  
  public String collapseFrom(CharSequence paramCharSequence, char paramChar)
  {
    return paramCharSequence.toString();
  }
  
  public int countIn(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return 0;
  }
  
  public int indexIn(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return -1;
  }
  
  public int indexIn(CharSequence paramCharSequence, int paramInt)
  {
    Preconditions.checkPositionIndex(paramInt, paramCharSequence.length());
    return -1;
  }
  
  public int lastIndexIn(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return -1;
  }
  
  public boolean matches(char paramChar)
  {
    return false;
  }
  
  public boolean matchesAllOf(CharSequence paramCharSequence)
  {
    return paramCharSequence.length() == 0;
  }
  
  public boolean matchesNoneOf(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return true;
  }
  
  public CharMatcher negate()
  {
    return ANY;
  }
  
  public CharMatcher or(CharMatcher paramCharMatcher)
  {
    return (CharMatcher)Preconditions.checkNotNull(paramCharMatcher);
  }
  
  public String removeFrom(CharSequence paramCharSequence)
  {
    return paramCharSequence.toString();
  }
  
  public String replaceFrom(CharSequence paramCharSequence, char paramChar)
  {
    return paramCharSequence.toString();
  }
  
  public String replaceFrom(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    Preconditions.checkNotNull(paramCharSequence2);
    return paramCharSequence1.toString();
  }
  
  public String trimFrom(CharSequence paramCharSequence)
  {
    return paramCharSequence.toString();
  }
  
  public String trimLeadingFrom(CharSequence paramCharSequence)
  {
    return paramCharSequence.toString();
  }
  
  public String trimTrailingFrom(CharSequence paramCharSequence)
  {
    return paramCharSequence.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */