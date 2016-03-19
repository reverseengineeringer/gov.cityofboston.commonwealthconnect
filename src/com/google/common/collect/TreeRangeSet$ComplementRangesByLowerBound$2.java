package com.google.common.collect;

import java.util.Map.Entry;

class TreeRangeSet$ComplementRangesByLowerBound$2
  extends AbstractIterator<Map.Entry<Cut<C>, Range<C>>>
{
  Cut<C> nextComplementRangeUpperBound = val$firstComplementRangeUpperBound;
  
  TreeRangeSet$ComplementRangesByLowerBound$2(TreeRangeSet.ComplementRangesByLowerBound paramComplementRangesByLowerBound, Cut paramCut, PeekingIterator paramPeekingIterator) {}
  
  protected Map.Entry<Cut<C>, Range<C>> computeNext()
  {
    if (nextComplementRangeUpperBound == Cut.belowAll()) {
      return (Map.Entry)endOfData();
    }
    Range localRange1;
    if (val$positiveItr.hasNext())
    {
      localRange1 = (Range)val$positiveItr.next();
      Range localRange2 = Range.create(upperBound, nextComplementRangeUpperBound);
      nextComplementRangeUpperBound = lowerBound;
      if (access$100this$0).lowerBound.isLessThan(lowerBound)) {
        return Maps.immutableEntry(lowerBound, localRange2);
      }
    }
    else if (access$100this$0).lowerBound.isLessThan(Cut.belowAll()))
    {
      localRange1 = Range.create(Cut.belowAll(), nextComplementRangeUpperBound);
      nextComplementRangeUpperBound = Cut.belowAll();
      return Maps.immutableEntry(Cut.belowAll(), localRange1);
    }
    return (Map.Entry)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet.ComplementRangesByLowerBound.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */