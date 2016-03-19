package com.google.common.collect;

class RegularContiguousSet$1
  extends AbstractSequentialIterator<C>
{
  final C last = this$0.last();
  
  RegularContiguousSet$1(RegularContiguousSet paramRegularContiguousSet, Comparable paramComparable)
  {
    super(paramComparable);
  }
  
  protected C computeNext(C paramC)
  {
    if (RegularContiguousSet.access$000(paramC, last)) {
      return null;
    }
    return this$0.domain.next(paramC);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularContiguousSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */