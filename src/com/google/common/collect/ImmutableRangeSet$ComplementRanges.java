package com.google.common.collect;

import com.google.common.base.Preconditions;

final class ImmutableRangeSet$ComplementRanges
  extends ImmutableList<Range<C>>
{
  private final boolean positiveBoundedAbove;
  private final boolean positiveBoundedBelow;
  private final int size;
  
  ImmutableRangeSet$ComplementRanges(ImmutableRangeSet paramImmutableRangeSet)
  {
    positiveBoundedBelow = ((Range)ImmutableRangeSet.access$000(paramImmutableRangeSet).get(0)).hasLowerBound();
    positiveBoundedAbove = ((Range)Iterables.getLast(ImmutableRangeSet.access$000(paramImmutableRangeSet))).hasUpperBound();
    int j = ImmutableRangeSet.access$000(paramImmutableRangeSet).size() - 1;
    int i = j;
    if (positiveBoundedBelow) {
      i = j + 1;
    }
    j = i;
    if (positiveBoundedAbove) {
      j = i + 1;
    }
    size = j;
  }
  
  public Range<C> get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size);
    Cut localCut;
    if (positiveBoundedBelow) {
      if (paramInt == 0) {
        localCut = Cut.belowAll();
      }
    }
    while ((positiveBoundedAbove) && (paramInt == size - 1))
    {
      localObject = Cut.aboveAll();
      return Range.create(localCut, (Cut)localObject);
      localCut = access$000this$0).get(paramInt - 1)).upperBound;
      continue;
      localCut = access$000this$0).get(paramInt)).upperBound;
    }
    Object localObject = ImmutableRangeSet.access$000(this$0);
    if (positiveBoundedBelow) {}
    for (int i = 0;; i = 1)
    {
      localObject = getlowerBound;
      break;
    }
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return size;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeSet.ComplementRanges
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */