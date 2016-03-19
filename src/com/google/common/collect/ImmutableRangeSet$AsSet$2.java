package com.google.common.collect;

import java.util.Iterator;

class ImmutableRangeSet$AsSet$2
  extends AbstractIterator<C>
{
  Iterator<C> elemItr = Iterators.emptyIterator();
  final Iterator<Range<C>> rangeItr = ImmutableRangeSet.access$000(this$1.this$0).reverse().iterator();
  
  ImmutableRangeSet$AsSet$2(ImmutableRangeSet.AsSet paramAsSet) {}
  
  protected C computeNext()
  {
    while (!elemItr.hasNext()) {
      if (rangeItr.hasNext()) {
        elemItr = ContiguousSet.create((Range)rangeItr.next(), ImmutableRangeSet.AsSet.access$100(this$1)).descendingIterator();
      } else {
        return (Comparable)endOfData();
      }
    }
    return (Comparable)elemItr.next();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeSet.AsSet.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */