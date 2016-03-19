package com.google.common.collect;

import com.google.common.base.Preconditions;

class ImmutableRangeSet$1
  extends ImmutableList<Range<C>>
{
  ImmutableRangeSet$1(ImmutableRangeSet paramImmutableRangeSet, int paramInt1, int paramInt2, Range paramRange) {}
  
  public Range<C> get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, val$length);
    if ((paramInt == 0) || (paramInt == val$length - 1)) {
      return ((Range)ImmutableRangeSet.access$000(this$0).get(val$fromIndex + paramInt)).intersection(val$range);
    }
    return (Range)ImmutableRangeSet.access$000(this$0).get(val$fromIndex + paramInt);
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return val$length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */