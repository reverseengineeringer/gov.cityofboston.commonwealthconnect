package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedMap;
import javax.annotation.Nullable;

@Beta
@GwtIncompatible("NavigableMap")
public final class TreeRangeMap<K extends Comparable, V>
  implements RangeMap<K, V>
{
  private static final RangeMap EMPTY_SUB_RANGE_MAP = new RangeMap()
  {
    public Map<Range, Object> asMapOfRanges()
    {
      return Collections.emptyMap();
    }
    
    public void clear() {}
    
    @Nullable
    public Object get(Comparable paramAnonymousComparable)
    {
      return null;
    }
    
    @Nullable
    public Map.Entry<Range, Object> getEntry(Comparable paramAnonymousComparable)
    {
      return null;
    }
    
    public void put(Range paramAnonymousRange, Object paramAnonymousObject)
    {
      Preconditions.checkNotNull(paramAnonymousRange);
      throw new IllegalArgumentException("Cannot insert range " + paramAnonymousRange + " into an empty subRangeMap");
    }
    
    public void putAll(RangeMap paramAnonymousRangeMap)
    {
      if (!paramAnonymousRangeMap.asMapOfRanges().isEmpty()) {
        throw new IllegalArgumentException("Cannot putAll(nonEmptyRangeMap) into an empty subRangeMap");
      }
    }
    
    public void remove(Range paramAnonymousRange)
    {
      Preconditions.checkNotNull(paramAnonymousRange);
    }
    
    public Range span()
    {
      throw new NoSuchElementException();
    }
    
    public RangeMap subRangeMap(Range paramAnonymousRange)
    {
      Preconditions.checkNotNull(paramAnonymousRange);
      return this;
    }
  };
  private final NavigableMap<Cut<K>, RangeMapEntry<K, V>> entriesByLowerBound = Maps.newTreeMap();
  
  public static <K extends Comparable, V> TreeRangeMap<K, V> create()
  {
    return new TreeRangeMap();
  }
  
  private RangeMap<K, V> emptySubRangeMap()
  {
    return EMPTY_SUB_RANGE_MAP;
  }
  
  private void putRangeMapEntry(Cut<K> paramCut1, Cut<K> paramCut2, V paramV)
  {
    entriesByLowerBound.put(paramCut1, new RangeMapEntry(paramCut1, paramCut2, paramV));
  }
  
  public Map<Range<K>, V> asMapOfRanges()
  {
    return new AsMapOfRanges(null);
  }
  
  public void clear()
  {
    entriesByLowerBound.clear();
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
    paramK = getEntry(paramK);
    if (paramK == null) {
      return null;
    }
    return (V)paramK.getValue();
  }
  
  @Nullable
  public Map.Entry<Range<K>, V> getEntry(K paramK)
  {
    Map.Entry localEntry = entriesByLowerBound.floorEntry(Cut.belowValue(paramK));
    if ((localEntry != null) && (((RangeMapEntry)localEntry.getValue()).contains(paramK))) {
      return (Map.Entry)localEntry.getValue();
    }
    return null;
  }
  
  public int hashCode()
  {
    return asMapOfRanges().hashCode();
  }
  
  public void put(Range<K> paramRange, V paramV)
  {
    if (!paramRange.isEmpty())
    {
      Preconditions.checkNotNull(paramV);
      remove(paramRange);
      entriesByLowerBound.put(lowerBound, new RangeMapEntry(paramRange, paramV));
    }
  }
  
  public void putAll(RangeMap<K, V> paramRangeMap)
  {
    paramRangeMap = paramRangeMap.asMapOfRanges().entrySet().iterator();
    while (paramRangeMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramRangeMap.next();
      put((Range)localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public void remove(Range<K> paramRange)
  {
    if (paramRange.isEmpty()) {
      return;
    }
    Map.Entry localEntry = entriesByLowerBound.lowerEntry(lowerBound);
    RangeMapEntry localRangeMapEntry;
    if (localEntry != null)
    {
      localRangeMapEntry = (RangeMapEntry)localEntry.getValue();
      if (localRangeMapEntry.getUpperBound().compareTo(lowerBound) > 0)
      {
        if (localRangeMapEntry.getUpperBound().compareTo(upperBound) > 0) {
          putRangeMapEntry(upperBound, localRangeMapEntry.getUpperBound(), ((RangeMapEntry)localEntry.getValue()).getValue());
        }
        putRangeMapEntry(localRangeMapEntry.getLowerBound(), lowerBound, ((RangeMapEntry)localEntry.getValue()).getValue());
      }
    }
    localEntry = entriesByLowerBound.lowerEntry(upperBound);
    if (localEntry != null)
    {
      localRangeMapEntry = (RangeMapEntry)localEntry.getValue();
      if (localRangeMapEntry.getUpperBound().compareTo(upperBound) > 0)
      {
        putRangeMapEntry(upperBound, localRangeMapEntry.getUpperBound(), ((RangeMapEntry)localEntry.getValue()).getValue());
        entriesByLowerBound.remove(lowerBound);
      }
    }
    entriesByLowerBound.subMap(lowerBound, upperBound).clear();
  }
  
  public Range<K> span()
  {
    Map.Entry localEntry1 = entriesByLowerBound.firstEntry();
    Map.Entry localEntry2 = entriesByLowerBound.lastEntry();
    if (localEntry1 == null) {
      throw new NoSuchElementException();
    }
    return Range.create(getValuegetKeylowerBound, getValuegetKeyupperBound);
  }
  
  public RangeMap<K, V> subRangeMap(Range<K> paramRange)
  {
    if (paramRange.equals(Range.all())) {
      return this;
    }
    return new SubRangeMap(paramRange);
  }
  
  public String toString()
  {
    return entriesByLowerBound.values().toString();
  }
  
  private final class AsMapOfRanges
    extends AbstractMap<Range<K>, V>
  {
    private AsMapOfRanges() {}
    
    public boolean containsKey(@Nullable Object paramObject)
    {
      return get(paramObject) != null;
    }
    
    public Set<Map.Entry<Range<K>, V>> entrySet()
    {
      new AbstractSet()
      {
        public Iterator<Map.Entry<Range<K>, V>> iterator()
        {
          return entriesByLowerBound.values().iterator();
        }
        
        public int size()
        {
          return entriesByLowerBound.size();
        }
      };
    }
    
    public V get(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Range))
      {
        paramObject = (Range)paramObject;
        TreeRangeMap.RangeMapEntry localRangeMapEntry = (TreeRangeMap.RangeMapEntry)entriesByLowerBound.get(lowerBound);
        if ((localRangeMapEntry != null) && (localRangeMapEntry.getKey().equals(paramObject))) {
          return (V)localRangeMapEntry.getValue();
        }
      }
      return null;
    }
  }
  
  private static final class RangeMapEntry<K extends Comparable, V>
    extends AbstractMapEntry<Range<K>, V>
  {
    private final Range<K> range;
    private final V value;
    
    RangeMapEntry(Cut<K> paramCut1, Cut<K> paramCut2, V paramV)
    {
      this(Range.create(paramCut1, paramCut2), paramV);
    }
    
    RangeMapEntry(Range<K> paramRange, V paramV)
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
  
  private class SubRangeMap
    implements RangeMap<K, V>
  {
    private final Range<K> subRange;
    
    SubRangeMap()
    {
      Range localRange;
      subRange = localRange;
    }
    
    public Map<Range<K>, V> asMapOfRanges()
    {
      return new SubRangeMapAsMap();
    }
    
    public void clear()
    {
      TreeRangeMap.this.remove(subRange);
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
      if (subRange.contains(paramK)) {
        return (V)TreeRangeMap.this.get(paramK);
      }
      return null;
    }
    
    @Nullable
    public Map.Entry<Range<K>, V> getEntry(K paramK)
    {
      if (subRange.contains(paramK))
      {
        paramK = TreeRangeMap.this.getEntry(paramK);
        if (paramK != null) {
          return Maps.immutableEntry(((Range)paramK.getKey()).intersection(subRange), paramK.getValue());
        }
      }
      return null;
    }
    
    public int hashCode()
    {
      return asMapOfRanges().hashCode();
    }
    
    public void put(Range<K> paramRange, V paramV)
    {
      Preconditions.checkArgument(subRange.encloses(paramRange), "Cannot put range %s into a subRangeMap(%s)", new Object[] { paramRange, subRange });
      TreeRangeMap.this.put(paramRange, paramV);
    }
    
    public void putAll(RangeMap<K, V> paramRangeMap)
    {
      if (paramRangeMap.asMapOfRanges().isEmpty()) {
        return;
      }
      Range localRange = paramRangeMap.span();
      Preconditions.checkArgument(subRange.encloses(localRange), "Cannot putAll rangeMap with span %s into a subRangeMap(%s)", new Object[] { localRange, subRange });
      TreeRangeMap.this.putAll(paramRangeMap);
    }
    
    public void remove(Range<K> paramRange)
    {
      if (paramRange.isConnected(subRange)) {
        TreeRangeMap.this.remove(paramRange.intersection(subRange));
      }
    }
    
    public Range<K> span()
    {
      Object localObject1 = entriesByLowerBound.floorEntry(subRange.lowerBound);
      if ((localObject1 != null) && (((TreeRangeMap.RangeMapEntry)((Map.Entry)localObject1).getValue()).getUpperBound().compareTo(subRange.lowerBound) > 0)) {
        localObject1 = subRange.lowerBound;
      }
      do
      {
        localObject2 = entriesByLowerBound.lowerEntry(subRange.upperBound);
        if (localObject2 != null) {
          break label140;
        }
        throw new NoSuchElementException();
        localObject2 = (Cut)entriesByLowerBound.ceilingKey(subRange.lowerBound);
        if (localObject2 == null) {
          break;
        }
        localObject1 = localObject2;
      } while (((Cut)localObject2).compareTo(subRange.upperBound) < 0);
      throw new NoSuchElementException();
      label140:
      if (((TreeRangeMap.RangeMapEntry)((Map.Entry)localObject2).getValue()).getUpperBound().compareTo(subRange.upperBound) >= 0) {}
      for (Object localObject2 = subRange.upperBound;; localObject2 = ((TreeRangeMap.RangeMapEntry)((Map.Entry)localObject2).getValue()).getUpperBound()) {
        return Range.create((Cut)localObject1, (Cut)localObject2);
      }
    }
    
    public RangeMap<K, V> subRangeMap(Range<K> paramRange)
    {
      if (!paramRange.isConnected(subRange)) {
        return TreeRangeMap.this.emptySubRangeMap();
      }
      return TreeRangeMap.this.subRangeMap(paramRange.intersection(subRange));
    }
    
    public String toString()
    {
      return asMapOfRanges().toString();
    }
    
    class SubRangeMapAsMap
      extends AbstractMap<Range<K>, V>
    {
      SubRangeMapAsMap() {}
      
      private boolean removeEntryIf(Predicate<? super Map.Entry<Range<K>, V>> paramPredicate)
      {
        ArrayList localArrayList = Lists.newArrayList();
        Object localObject = entrySet().iterator();
        while (((Iterator)localObject).hasNext())
        {
          Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
          if (paramPredicate.apply(localEntry)) {
            localArrayList.add(localEntry.getKey());
          }
        }
        paramPredicate = localArrayList.iterator();
        while (paramPredicate.hasNext())
        {
          localObject = (Range)paramPredicate.next();
          TreeRangeMap.this.remove((Range)localObject);
        }
        return !localArrayList.isEmpty();
      }
      
      public void clear()
      {
        TreeRangeMap.SubRangeMap.this.clear();
      }
      
      public boolean containsKey(Object paramObject)
      {
        return get(paramObject) != null;
      }
      
      public Set<Map.Entry<Range<K>, V>> entrySet()
      {
        new Maps.EntrySet()
        {
          public boolean isEmpty()
          {
            return !iterator().hasNext();
          }
          
          public Iterator<Map.Entry<Range<K>, V>> iterator()
          {
            if (subRange.isEmpty()) {
              return Iterators.emptyIterator();
            }
            Cut localCut = (Cut)Objects.firstNonNull(entriesByLowerBound.floorKey(subRange.lowerBound), subRange.lowerBound);
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
                    if (localRangeMapEntry.getLowerBound().compareTo(subRange.upperBound) < 0) {}
                  }
                  else
                  {
                    return (Map.Entry)endOfData();
                  }
                } while (localRangeMapEntry.getUpperBound().compareTo(subRange.lowerBound) <= 0);
                return Maps.immutableEntry(localRangeMapEntry.getKey().intersection(subRange), localRangeMapEntry.getValue());
              }
            };
          }
          
          Map<Range<K>, V> map()
          {
            return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this;
          }
          
          public boolean retainAll(Collection<?> paramAnonymousCollection)
          {
            return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
          }
          
          public int size()
          {
            return Iterators.size(iterator());
          }
        };
      }
      
      public V get(Object paramObject)
      {
        try
        {
          if ((paramObject instanceof Range))
          {
            Range localRange = (Range)paramObject;
            if (subRange.encloses(localRange))
            {
              if (localRange.isEmpty()) {
                return null;
              }
              paramObject = null;
              Map.Entry localEntry;
              if (lowerBound.compareTo(subRange.lowerBound) == 0)
              {
                localEntry = entriesByLowerBound.floorEntry(lowerBound);
                if (localEntry == null) {}
              }
              for (paramObject = (TreeRangeMap.RangeMapEntry)localEntry.getValue(); (paramObject != null) && (((TreeRangeMap.RangeMapEntry)paramObject).getKey().isConnected(subRange)) && (((TreeRangeMap.RangeMapEntry)paramObject).getKey().intersection(subRange).equals(localRange)); paramObject = (TreeRangeMap.RangeMapEntry)entriesByLowerBound.get(lowerBound)) {
                return (V)((TreeRangeMap.RangeMapEntry)paramObject).getValue();
              }
            }
          }
          return null;
        }
        catch (ClassCastException paramObject) {}
      }
      
      public Set<Range<K>> keySet()
      {
        new Maps.KeySet(this)
        {
          public boolean remove(@Nullable Object paramAnonymousObject)
          {
            return remove(paramAnonymousObject) != null;
          }
          
          public boolean retainAll(Collection<?> paramAnonymousCollection)
          {
            return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.compose(Predicates.not(Predicates.in(paramAnonymousCollection)), Maps.keyFunction()));
          }
        };
      }
      
      public V remove(Object paramObject)
      {
        Object localObject = get(paramObject);
        if (localObject != null)
        {
          paramObject = (Range)paramObject;
          TreeRangeMap.this.remove((Range)paramObject);
          return (V)localObject;
        }
        return null;
      }
      
      public Collection<V> values()
      {
        new Maps.Values(this)
        {
          public boolean removeAll(Collection<?> paramAnonymousCollection)
          {
            return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.compose(Predicates.in(paramAnonymousCollection), Maps.valueFunction()));
          }
          
          public boolean retainAll(Collection<?> paramAnonymousCollection)
          {
            return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.compose(Predicates.not(Predicates.in(paramAnonymousCollection)), Maps.valueFunction()));
          }
        };
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */