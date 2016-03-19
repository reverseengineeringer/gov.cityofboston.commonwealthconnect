package com.google.common.escape;

import java.util.Map;

class Escapers$Builder$1
  extends ArrayBasedCharEscaper
{
  private final char[] replacementChars;
  
  Escapers$Builder$1(Escapers.Builder paramBuilder, Map paramMap, char paramChar1, char paramChar2)
  {
    super(paramMap, paramChar1, paramChar2);
    if (Escapers.Builder.access$100(this$0) != null) {}
    for (paramBuilder = Escapers.Builder.access$100(this$0).toCharArray();; paramBuilder = null)
    {
      replacementChars = paramBuilder;
      return;
    }
  }
  
  protected char[] escapeUnsafe(char paramChar)
  {
    return replacementChars;
  }
}

/* Location:
 * Qualified Name:     com.google.common.escape.Escapers.Builder.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */