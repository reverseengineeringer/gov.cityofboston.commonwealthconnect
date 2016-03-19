package com.google.common.collect;

import com.google.common.base.Objects;
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
import java.util.Set;
import javax.annotation.Nullable;

class TreeRangeMap$SubRangeMap$SubRangeMapAsMap
  extends AbstractMap<Range<K>, V>
{
  TreeRangeMap$SubRangeMap$SubRangeMapAsMap(TreeRangeMap.SubRangeMap paramSubRangeMap) {}
  
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
      this$1.this$0.remove((Range)localObject);
    }
    return !localArrayList.isEmpty();
  }
  
  public void clear()
  {
    this$1.clear();
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
        if (TreeRangeMap.SubRangeMap.access$300(this$1).isEmpty()) {
          return Iterators.emptyIterator();
        }
        Cut localCut = (Cut)Objects.firstNonNull(TreeRangeMap.access$100(this$1.this$0).floorKey(access$300this$1).lowerBound), access$300this$1).lowerBound);
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
                if (localRangeMapEntry.getLowerBound().compareTo(access$300this$1).upperBound) < 0) {}
              }
              else
              {
                return (Map.Entry)endOfData();
              }
            } while (localRangeMapEntry.getUpperBound().compareTo(access$300this$1).lowerBound) <= 0);
            return Maps.immutableEntry(localRangeMapEntry.getKey().intersection(TreeRangeMap.SubRangeMap.access$300(this$1)), localRangeMapEntry.getValue());
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
        if (TreeRangeMap.SubRangeMap.access$300(this$1).encloses(localRange))
        {
          if (localRange.isEmpty()) {
            return null;
          }
          paramObject = null;
          Map.Entry localEntry;
          if (lowerBound.compareTo(access$300this$1).lowerBound) == 0)
          {
            localEntry = TreeRangeMap.access$100(this$1.this$0).floorEntry(lowerBound);
            if (localEntry == null) {}
          }
          for (paramObject = (TreeRangeMap.RangeMapEntry)localEntry.getValue(); (paramObject != null) && (((TreeRangeMap.RangeMapEntry)paramObject).getKey().isConnected(TreeRangeMap.SubRangeMap.access$300(this$1))) && (((TreeRangeMap.RangeMapEntry)paramObject).getKey().intersection(TreeRangeMap.SubRangeMap.access$300(this$1)).equals(localRange)); paramObject = (TreeRangeMap.RangeMapEntry)TreeRangeMap.access$100(this$1.this$0).get(lowerBound)) {
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
      this$1.this$0.remove((Range)paramObject);
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

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.SubRangeMap.SubRangeMapAsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */