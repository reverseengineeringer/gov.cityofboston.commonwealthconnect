package com.google.common.base;

import java.util.regex.Matcher;

class Splitter$3$1
  extends Splitter.SplittingIterator
{
  Splitter$3$1(Splitter.3 param3, Splitter paramSplitter, CharSequence paramCharSequence, Matcher paramMatcher)
  {
    super(paramSplitter, paramCharSequence);
  }
  
  public int separatorEnd(int paramInt)
  {
    return val$matcher.end();
  }
  
  public int separatorStart(int paramInt)
  {
    if (val$matcher.find(paramInt)) {
      return val$matcher.start();
    }
    return -1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.3.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */