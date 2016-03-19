package com.google.common.collect;

import com.google.common.base.Preconditions;

class ImmutableRangeMap$1
  extends ImmutableList<Range<K>>
{
  ImmutableRangeMap$1(ImmutableRangeMap paramImmutableRangeMap, int paramInt1, int paramInt2, Range paramRange) {}
  
  public Range<K> get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, val$len);
    if ((paramInt == 0) || (paramInt == val$len - 1)) {
      return ((Range)ImmutableRangeMap.access$000(this$0).get(val$off + paramInt)).intersection(val$range);
    }
    return (Range)ImmutableRangeMap.access$000(this$0).get(val$off + paramInt);
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return val$len;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */