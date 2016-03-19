package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.Nullable;

class TreeRangeMap$SubRangeMap
  implements RangeMap<K, V>
{
  private final Range<K> subRange;
  
  TreeRangeMap$SubRangeMap(Range<K> paramRange)
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
    this$0.remove(subRange);
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
      return (V)this$0.get(paramK);
    }
    return null;
  }
  
  @Nullable
  public Map.Entry<Range<K>, V> getEntry(K paramK)
  {
    if (subRange.contains(paramK))
    {
      paramK = this$0.getEntry(paramK);
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
    this$0.put(paramRange, paramV);
  }
  
  public void putAll(RangeMap<K, V> paramRangeMap)
  {
    if (paramRangeMap.asMapOfRanges().isEmpty()) {
      return;
    }
    Range localRange = paramRangeMap.span();
    Preconditions.checkArgument(subRange.encloses(localRange), "Cannot putAll rangeMap with span %s into a subRangeMap(%s)", new Object[] { localRange, subRange });
    this$0.putAll(paramRangeMap);
  }
  
  public void remove(Range<K> paramRange)
  {
    if (paramRange.isConnected(subRange)) {
      this$0.remove(paramRange.intersection(subRange));
    }
  }
  
  public Range<K> span()
  {
    Object localObject1 = TreeRangeMap.access$100(this$0).floorEntry(subRange.lowerBound);
    if ((localObject1 != null) && (((TreeRangeMap.RangeMapEntry)((Map.Entry)localObject1).getValue()).getUpperBound().compareTo(subRange.lowerBound) > 0)) {
      localObject1 = subRange.lowerBound;
    }
    do
    {
      localObject2 = TreeRangeMap.access$100(this$0).lowerEntry(subRange.upperBound);
      if (localObject2 != null) {
        break label140;
      }
      throw new NoSuchElementException();
      localObject2 = (Cut)TreeRangeMap.access$100(this$0).ceilingKey(subRange.lowerBound);
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
      return TreeRangeMap.access$200(this$0);
    }
    return this$0.subRangeMap(paramRange.intersection(subRange));
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
        this$0.remove((Range)localObject);
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
          Cut localCut = (Cut)Objects.firstNonNull(TreeRangeMap.access$100(this$0).floorKey(subRange.lowerBound), subRange.lowerBound);
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
              localEntry = TreeRangeMap.access$100(this$0).floorEntry(lowerBound);
              if (localEntry == null) {}
            }
            for (paramObject = (TreeRangeMap.RangeMapEntry)localEntry.getValue(); (paramObject != null) && (((TreeRangeMap.RangeMapEntry)paramObject).getKey().isConnected(subRange)) && (((TreeRangeMap.RangeMapEntry)paramObject).getKey().intersection(subRange).equals(localRange)); paramObject = (TreeRangeMap.RangeMapEntry)TreeRangeMap.access$100(this$0).get(lowerBound)) {
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
        this$0.remove((Range)paramObject);
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

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.SubRangeMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */