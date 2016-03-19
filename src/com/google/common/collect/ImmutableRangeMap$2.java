package com.google.common.collect;

class ImmutableRangeMap$2
  extends ImmutableRangeMap<K, V>
{
  ImmutableRangeMap$2(ImmutableRangeMap paramImmutableRangeMap1, ImmutableList paramImmutableList1, ImmutableList paramImmutableList2, Range paramRange, ImmutableRangeMap paramImmutableRangeMap2)
  {
    super(paramImmutableList1, paramImmutableList2);
  }
  
  public ImmutableRangeMap<K, V> subRangeMap(Range<K> paramRange)
  {
    if (val$range.isConnected(paramRange)) {
      return val$outer.subRangeMap(paramRange.intersection(val$range));
    }
    return ImmutableRangeMap.of();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeMap.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */