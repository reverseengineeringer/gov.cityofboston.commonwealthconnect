package com.google.common.collect;

class RegularContiguousSet$2
  extends AbstractSequentialIterator<C>
{
  final C first = this$0.first();
  
  RegularContiguousSet$2(RegularContiguousSet paramRegularContiguousSet, Comparable paramComparable)
  {
    super(paramComparable);
  }
  
  protected C computeNext(C paramC)
  {
    if (RegularContiguousSet.access$000(paramC, first)) {
      return null;
    }
    return this$0.domain.previous(paramC);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularContiguousSet.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */