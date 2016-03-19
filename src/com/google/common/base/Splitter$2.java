package com.google.common.base;

final class Splitter$2
  implements Splitter.Strategy
{
  Splitter$2(String paramString) {}
  
  public Splitter.SplittingIterator iterator(Splitter paramSplitter, CharSequence paramCharSequence)
  {
    new Splitter.SplittingIterator(paramSplitter, paramCharSequence)
    {
      public int separatorEnd(int paramAnonymousInt)
      {
        return val$separator.length() + paramAnonymousInt;
      }
      
      public int separatorStart(int paramAnonymousInt)
      {
        int k = val$separator.length();
        int m = toSplit.length();
        if (paramAnonymousInt <= m - k)
        {
          int i = 0;
          for (;;)
          {
            j = paramAnonymousInt;
            if (i >= k) {
              return j;
            }
            if (toSplit.charAt(i + paramAnonymousInt) != val$separator.charAt(i))
            {
              paramAnonymousInt += 1;
              break;
            }
            i += 1;
          }
        }
        int j = -1;
        return j;
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */