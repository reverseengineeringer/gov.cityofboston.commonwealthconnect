package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;

class TreeRangeMap$SubRangeMap$SubRangeMapAsMap$2$1
  extends AbstractIterator<Map.Entry<Range<K>, V>>
{
  TreeRangeMap$SubRangeMap$SubRangeMapAsMap$2$1(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.2 param2, Iterator paramIterator) {}
  
  protected Map.Entry<Range<K>, V> computeNext()
  {
    TreeRangeMap.RangeMapEntry localRangeMapEntry;
    do
    {
      if (val$backingItr.hasNext())
      {
        localRangeMapEntry = (TreeRangeMap.RangeMapEntry)val$backingItr.next();
        if (localRangeMapEntry.getLowerBound().compareTo(access$300this$3.this$2.this$1).upperBound) < 0) {}
      }
      else
      {
        return (Map.Entry)endOfData();
      }
    } while (localRangeMapEntry.getUpperBound().compareTo(access$300this$3.this$2.this$1).lowerBound) <= 0);
    return Maps.immutableEntry(localRangeMapEntry.getKey().intersection(TreeRangeMap.SubRangeMap.access$300(this$3.this$2.this$1)), localRangeMapEntry.getValue());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.SubRangeMap.SubRangeMapAsMap.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */