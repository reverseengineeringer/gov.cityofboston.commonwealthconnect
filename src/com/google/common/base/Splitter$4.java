package com.google.common.base;

final class Splitter$4
  implements Splitter.Strategy
{
  Splitter$4(int paramInt) {}
  
  public Splitter.SplittingIterator iterator(Splitter paramSplitter, CharSequence paramCharSequence)
  {
    new Splitter.SplittingIterator(paramSplitter, paramCharSequence)
    {
      public int separatorEnd(int paramAnonymousInt)
      {
        return paramAnonymousInt;
      }
      
      public int separatorStart(int paramAnonymousInt)
      {
        paramAnonymousInt += val$length;
        if (paramAnonymousInt < toSplit.length()) {
          return paramAnonymousInt;
        }
        return -1;
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */