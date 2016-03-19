package com.google.common.collect;

final class TreeRangeMap$RangeMapEntry<K extends Comparable, V>
  extends AbstractMapEntry<Range<K>, V>
{
  private final Range<K> range;
  private final V value;
  
  TreeRangeMap$RangeMapEntry(Cut<K> paramCut1, Cut<K> paramCut2, V paramV)
  {
    this(Range.create(paramCut1, paramCut2), paramV);
  }
  
  TreeRangeMap$RangeMapEntry(Range<K> paramRange, V paramV)
  {
    range = paramRange;
    value = paramV;
  }
  
  public boolean contains(K paramK)
  {
    return range.contains(paramK);
  }
  
  public Range<K> getKey()
  {
    return range;
  }
  
  Cut<K> getLowerBound()
  {
    return range.lowerBound;
  }
  
  Cut<K> getUpperBound()
  {
    return range.upperBound;
  }
  
  public V getValue()
  {
    return (V)value;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.RangeMapEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */