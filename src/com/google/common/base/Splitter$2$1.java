package com.google.common.base;

class Splitter$2$1
  extends Splitter.SplittingIterator
{
  Splitter$2$1(Splitter.2 param2, Splitter paramSplitter, CharSequence paramCharSequence)
  {
    super(paramSplitter, paramCharSequence);
  }
  
  public int separatorEnd(int paramInt)
  {
    return this$0.val$separator.length() + paramInt;
  }
  
  public int separatorStart(int paramInt)
  {
    int k = this$0.val$separator.length();
    int m = toSplit.length();
    if (paramInt <= m - k)
    {
      int i = 0;
      for (;;)
      {
        j = paramInt;
        if (i >= k) {
          return j;
        }
        if (toSplit.charAt(i + paramInt) != this$0.val$separator.charAt(i))
        {
          paramInt += 1;
          break;
        }
        i += 1;
      }
    }
    int j = -1;
    return j;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */