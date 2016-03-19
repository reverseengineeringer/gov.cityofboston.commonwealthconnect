package com.google.common.base;

final class Splitter$1
  implements Splitter.Strategy
{
  Splitter$1(CharMatcher paramCharMatcher) {}
  
  public Splitter.SplittingIterator iterator(Splitter paramSplitter, CharSequence paramCharSequence)
  {
    new Splitter.SplittingIterator(paramSplitter, paramCharSequence)
    {
      int separatorEnd(int paramAnonymousInt)
      {
        return paramAnonymousInt + 1;
      }
      
      int separatorStart(int paramAnonymousInt)
      {
        return val$separatorMatcher.indexIn(toSplit, paramAnonymousInt);
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */