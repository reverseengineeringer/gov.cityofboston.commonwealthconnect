package com.google.common.base;

class Splitter$4$1
  extends Splitter.SplittingIterator
{
  Splitter$4$1(Splitter.4 param4, Splitter paramSplitter, CharSequence paramCharSequence)
  {
    super(paramSplitter, paramCharSequence);
  }
  
  public int separatorEnd(int paramInt)
  {
    return paramInt;
  }
  
  public int separatorStart(int paramInt)
  {
    paramInt += this$0.val$length;
    if (paramInt < toSplit.length()) {
      return paramInt;
    }
    return -1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.4.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */