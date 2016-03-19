package com.google.common.base;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class Splitter$3
  implements Splitter.Strategy
{
  Splitter$3(Pattern paramPattern) {}
  
  public Splitter.SplittingIterator iterator(Splitter paramSplitter, CharSequence paramCharSequence)
  {
    new Splitter.SplittingIterator(paramSplitter, paramCharSequence)
    {
      public int separatorEnd(int paramAnonymousInt)
      {
        return val$matcher.end();
      }
      
      public int separatorStart(int paramAnonymousInt)
      {
        if (val$matcher.find(paramAnonymousInt)) {
          return val$matcher.start();
        }
        return -1;
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */