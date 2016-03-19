package com.google.common.base;

class Splitter$1$1
  extends Splitter.SplittingIterator
{
  Splitter$1$1(Splitter.1 param1, Splitter paramSplitter, CharSequence paramCharSequence)
  {
    super(paramSplitter, paramCharSequence);
  }
  
  int separatorEnd(int paramInt)
  {
    return paramInt + 1;
  }
  
  int separatorStart(int paramInt)
  {
    return this$0.val$separatorMatcher.indexIn(toSplit, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */