package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;

class TreeRangeMap$SubRangeMap$SubRangeMapAsMap$2
  extends Maps.EntrySet<Range<K>, V>
{
  TreeRangeMap$SubRangeMap$SubRangeMapAsMap$2(TreeRangeMap.SubRangeMap.SubRangeMapAsMap paramSubRangeMapAsMap) {}
  
  public boolean isEmpty()
  {
    return !iterator().hasNext();
  }
  
  public Iterator<Map.Entry<Range<K>, V>> iterator()
  {
    if (TreeRangeMap.SubRangeMap.access$300(this$2.this$1).isEmpty()) {
      return Iterators.emptyIterator();
    }
    Cut localCut = (Cut)Objects.firstNonNull(TreeRangeMap.access$100(this$2.this$1.this$0).floorKey(access$300this$2.this$1).lowerBound), access$300this$2.this$1).lowerBound);
    new AbstractIterator()
    {
      protected Map.Entry<Range<K>, V> computeNext()
      {
        TreeRangeMap.RangeMapEntry localRangeMapEntry;
        do
        {
          if (val$backingItr.hasNext())
          {
            localRangeMapEntry = (TreeRangeMap.RangeMapEntry)val$backingItr.next();
            if (localRangeMapEntry.getLowerBound().compareTo(access$300this$2.this$1).upperBound) < 0) {}
          }
          else
          {
            return (Map.Entry)endOfData();
          }
        } while (localRangeMapEntry.getUpperBound().compareTo(access$300this$2.this$1).lowerBound) <= 0);
        return Maps.immutableEntry(localRangeMapEntry.getKey().intersection(TreeRangeMap.SubRangeMap.access$300(this$2.this$1)), localRangeMapEntry.getValue());
      }
    };
  }
  
  Map<Range<K>, V> map()
  {
    return this$2;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.access$400(this$2, Predicates.not(Predicates.in(paramCollection)));
  }
  
  public int size()
  {
    return Iterators.size(iterator());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.SubRangeMap.SubRangeMapAsMap.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */