package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.Nullable;

@Beta
@GwtIncompatible("NavigableMap")
public class ImmutableRangeMap<K extends Comparable<?>, V>
  implements RangeMap<K, V>
{
  private static final ImmutableRangeMap<Comparable<?>, Object> EMPTY = new ImmutableRangeMap(ImmutableList.of(), ImmutableList.of());
  private final ImmutableList<Range<K>> ranges;
  private final ImmutableList<V> values;
  
  ImmutableRangeMap(ImmutableList<Range<K>> paramImmutableList, ImmutableList<V> paramImmutableList1)
  {
    ranges = paramImmutableList;
    values = paramImmutableList1;
  }
  
  public static <K extends Comparable<?>, V> Builder<K, V> builder()
  {
    return new Builder();
  }
  
  public static <K extends Comparable<?>, V> ImmutableRangeMap<K, V> copyOf(RangeMap<K, ? extends V> paramRangeMap)
  {
    if ((paramRangeMap instanceof ImmutableRangeMap)) {
      return (ImmutableRangeMap)paramRangeMap;
    }
    Object localObject = paramRangeMap.asMapOfRanges();
    paramRangeMap = new ImmutableList.Builder(((Map)localObject).size());
    ImmutableList.Builder localBuilder = new ImmutableList.Builder(((Map)localObject).size());
    localObject = ((Map)localObject).entrySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
      paramRangeMap.add(localEntry.getKey());
      localBuilder.add(localEntry.getValue());
    }
    return new ImmutableRangeMap(paramRangeMap.build(), localBuilder.build());
  }
  
  public static <K extends Comparable<?>, V> ImmutableRangeMap<K, V> of()
  {
    return EMPTY;
  }
  
  public static <K extends Comparable<?>, V> ImmutableRangeMap<K, V> of(Range<K> paramRange, V paramV)
  {
    return new ImmutableRangeMap(ImmutableList.of(paramRange), ImmutableList.of(paramV));
  }
  
  public ImmutableMap<Range<K>, V> asMapOfRanges()
  {
    if (ranges.isEmpty()) {
      return ImmutableMap.of();
    }
    return new RegularImmutableSortedMap(new RegularImmutableSortedSet(ranges, Range.RANGE_LEX_ORDERING), values);
  }
  
  public void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof RangeMap))
    {
      paramObject = (RangeMap)paramObject;
      return asMapOfRanges().equals(((RangeMap)paramObject).asMapOfRanges());
    }
    return false;
  }
  
  @Nullable
  public V get(K paramK)
  {
    int i = SortedLists.binarySearch(ranges, Range.lowerBoundFn(), Cut.belowValue(paramK), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_LOWER);
    if (i == -1) {}
    while (!((Range)ranges.get(i)).contains(paramK)) {
      return null;
    }
    return (V)values.get(i);
  }
  
  @Nullable
  public Map.Entry<Range<K>, V> getEntry(K paramK)
  {
    int i = SortedLists.binarySearch(ranges, Range.lowerBoundFn(), Cut.belowValue(paramK), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_LOWER);
    if (i == -1) {}
    Range localRange;
    do
    {
      return null;
      localRange = (Range)ranges.get(i);
    } while (!localRange.contains(paramK));
    return Maps.immutableEntry(localRange, values.get(i));
  }
  
  public int hashCode()
  {
    return asMapOfRanges().hashCode();
  }
  
  public void put(Range<K> paramRange, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public void putAll(RangeMap<K, V> paramRangeMap)
  {
    throw new UnsupportedOperationException();
  }
  
  public void remove(Range<K> paramRange)
  {
    throw new UnsupportedOperationException();
  }
  
  public Range<K> span()
  {
    if (ranges.isEmpty()) {
      throw new NoSuchElementException();
    }
    Range localRange1 = (Range)ranges.get(0);
    Range localRange2 = (Range)ranges.get(ranges.size() - 1);
    return Range.create(lowerBound, upperBound);
  }
  
  public ImmutableRangeMap<K, V> subRangeMap(final Range<K> paramRange)
  {
    if (((Range)Preconditions.checkNotNull(paramRange)).isEmpty()) {
      return of();
    }
    if ((ranges.isEmpty()) || (paramRange.encloses(span()))) {
      return this;
    }
    final int i = SortedLists.binarySearch(ranges, Range.upperBoundFn(), lowerBound, SortedLists.KeyPresentBehavior.FIRST_AFTER, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
    int j = SortedLists.binarySearch(ranges, Range.lowerBoundFn(), upperBound, SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
    if (i >= j) {
      return of();
    }
    new ImmutableRangeMap(new ImmutableList()
    {
      public Range<K> get(int paramAnonymousInt)
      {
        Preconditions.checkElementIndex(paramAnonymousInt, val$len);
        if ((paramAnonymousInt == 0) || (paramAnonymousInt == val$len - 1)) {
          return ((Range)ranges.get(i + paramAnonymousInt)).intersection(paramRange);
        }
        return (Range)ranges.get(i + paramAnonymousInt);
      }
      
      boolean isPartialView()
      {
        return true;
      }
      
      public int size()
      {
        return val$len;
      }
    }, values.subList(i, j))
    {
      public ImmutableRangeMap<K, V> subRangeMap(Range<K> paramAnonymousRange)
      {
        if (paramRange.isConnected(paramAnonymousRange)) {
          return jdField_this.subRangeMap(paramAnonymousRange.intersection(paramRange));
        }
        return ImmutableRangeMap.of();
      }
    };
  }
  
  public String toString()
  {
    return asMapOfRanges().toString();
  }
  
  public static final class Builder<K extends Comparable<?>, V>
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
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */