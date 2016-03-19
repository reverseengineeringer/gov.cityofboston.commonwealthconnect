package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class ImmutableRangeMap$Builder<K extends Comparable<?>, V>
{
  private final RangeSet<K> keyRanges = TreeRangeSet.create();
  private final RangeMap<K, V> rangeMap = TreeRangeMap.create();
  
  public ImmutableRangeMap<K, V> build()
  {
    Object localObject = rangeMap.asMapOfRanges();
    ImmutableList.Builder localBuilder1 = new ImmutableList.Builder(((Map)localObject).size());
    ImmutableList.Builder localBuilder2 = new ImmutableList.Builder(((Map)localObject).size());
    localObject = ((Map)localObject).entrySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
      localBuilder1.add(localEntry.getKey());
      localBuilder2.add(localEntry.getValue());
    }
    return new ImmutableRangeMap(localBuilder1.build(), localBuilder2.build());
  }
  
  public Builder<K, V> put(Range<K> paramRange, V paramV)
  {
    Preconditions.checkNotNull(paramRange);
    Preconditions.checkNotNull(paramV);
    if (!paramRange.isEmpty()) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Range must not be empty, but was %s", new Object[] { paramRange });
      if (keyRanges.complement().encloses(paramRange)) {
        break;
      }
      Iterator localIterator = rangeMap.asMapOfRanges().entrySet().iterator();
      Map.Entry localEntry;
      Range localRange;
      do
      {
        if (!localIterator.hasNext()) {
          break;
        }
        localEntry = (Map.Entry)localIterator.next();
        localRange = (Range)localEntry.getKey();
      } while ((!localRange.isConnected(paramRange)) || (localRange.intersection(paramRange).isEmpty()));
      throw new IllegalArgumentException("Overlapping ranges: range " + paramRange + " overlaps with entry " + localEntry);
    }
    keyRanges.add(paramRange);
    rangeMap.put(paramRange, paramV);
    return this;
  }
  
  public Builder<K, V> putAll(RangeMap<K, ? extends V> paramRangeMap)
  {
    paramRangeMap = paramRangeMap.asMapOfRanges().entrySet().iterator();
    while (paramRangeMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramRangeMap.next();
      put((Range)localEntry.getKey(), localEntry.getValue());
    }
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeMap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */