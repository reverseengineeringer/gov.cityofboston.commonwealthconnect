package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.regex.Pattern;

@GwtIncompatible("Only used by other GWT-incompatible code.")
class Predicates$ContainsPatternFromStringPredicate
  extends Predicates.ContainsPatternPredicate
{
  private static final long serialVersionUID = 0L;
  
  Predicates$ContainsPatternFromStringPredicate(String paramString)
  {
    super(Pattern.compile(paramString));
  }
  
  public String toString()
  {
    return "Predicates.containsPattern(" + pattern.pattern() + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.ContainsPatternFromStringPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */