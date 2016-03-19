package com.google.common.base;

final class CharMatcher$14
  extends CharMatcher
{
  CharMatcher$14(String paramString, Predicate paramPredicate)
  {
    super(paramString);
  }
  
  public boolean apply(Character paramCharacter)
  {
    return val$predicate.apply(Preconditions.checkNotNull(paramCharacter));
  }
  
  public boolean matches(char paramChar)
  {
    return val$predicate.apply(Character.valueOf(paramChar));
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */