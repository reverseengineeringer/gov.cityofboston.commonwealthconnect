package com.google.common.collect;

import java.util.Map.Entry;

class TreeRangeSet$ComplementRangesByLowerBound$1
  extends AbstractIterator<Map.Entry<Cut<C>, Range<C>>>
{
  Cut<C> nextComplementRangeLowerBound = val$firstComplementRangeLowerBound;
  
  TreeRangeSet$ComplementRangesByLowerBound$1(TreeRangeSet.ComplementRangesByLowerBound paramComplementRangesByLowerBound, Cut paramCut, PeekingIterator paramPeekingIterator) {}
  
  protected Map.Entry<Cut<C>, Range<C>> computeNext()
  {
    if ((access$100this$0).upperBound.isLessThan(nextComplementRangeLowerBound)) || (nextComplementRangeLowerBound == Cut.aboveAll())) {
      return (Map.Entry)endOfData();
    }
    Range localRange2;
    Range localRange1;
    if (val$positiveItr.hasNext())
    {
      localRange2 = (Range)val$positiveItr.next();
      localRange1 = Range.create(nextComplementRangeLowerBound, lowerBound);
    }
    for (nextComplementRangeLowerBound = upperBound;; nextComplementRangeLowerBound = Cut.aboveAll())
    {
      return Maps.immutableEntry(lowerBound, localRange1);
      localRange1 = Range.create(nextComplementRangeLowerBound, Cut.aboveAll());
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet.ComplementRangesByLowerBound.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */