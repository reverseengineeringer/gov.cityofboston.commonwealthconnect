package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$Column
  extends Maps.ImprovedAbstractMap<R, V>
{
  final C columnKey;
  
  StandardTable$Column(C paramC)
  {
    Object localObject;
    columnKey = Preconditions.checkNotNull(localObject);
  }
  
  public boolean containsKey(Object paramObject)
  {
    return this$0.contains(paramObject, columnKey);
  }
  
  Set<Map.Entry<R, V>> createEntrySet()
  {
    return new EntrySet(null);
  }
  
  Set<R> createKeySet()
  {
    return new KeySet();
  }
  
  Collection<V> createValues()
  {
    return new Values();
  }
  
  public V get(Object paramObject)
  {
    return (V)this$0.get(paramObject, columnKey);
  }
  
  public V put(R paramR, V paramV)
  {
    return (V)this$0.put(paramR, columnKey, paramV);
  }
  
  public V remove(Object paramObject)
  {
    return (V)this$0.remove(paramObject, columnKey);
  }
  
  boolean removeFromColumnIf(Predicate<? super Map.Entry<R, V>> paramPredicate)
  {
    boolean bool1 = false;
    Iterator localIterator = this$0.backingMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Map localMap = (Map)localEntry.getValue();
      Object localObject = localMap.get(columnKey);
      if ((localObject != null) && (paramPredicate.apply(Maps.immutableEntry(localEntry.getKey(), localObject))))
      {
        localMap.remove(columnKey);
        boolean bool2 = true;
        bool1 = bool2;
        if (localMap.isEmpty())
        {
          localIterator.remove();
          bool1 = bool2;
        }
      }
    }
    return bool1;
  }
  
  private class EntrySet
    extends Sets.ImprovedAbstractSet<Map.Entry<R, V>>
  {
    private EntrySet() {}
    
    public void clear()
    {
      removeFromColumnIf(Predicates.alwaysTrue());
    }
    
    public boolean contains(Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        paramObject = (Map.Entry)paramObject;
        return StandardTable.access$400(this$0, ((Map.Entry)paramObject).getKey(), columnKey, ((Map.Entry)paramObject).getValue());
      }
      return false;
    }
    
    public boolean isEmpty()
    {
      return !this$0.containsColumn(columnKey);
    }
    
    public Iterator<Map.Entry<R, V>> iterator()
    {
      return new StandardTable.Column.EntrySetIterator(StandardTable.Column.this, null);
    }
    
    public boolean remove(Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        paramObject = (Map.Entry)paramObject;
        return StandardTable.access$500(this$0, ((Map.Entry)paramObject).getKey(), columnKey, ((Map.Entry)paramObject).getValue());
      }
      return false;
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return removeFromColumnIf(Predicates.not(Predicates.in(paramCollection)));
    }
    
    public int size()
    {
      int i = 0;
      Iterator localIterator = this$0.backingMap.values().iterator();
      while (localIterator.hasNext()) {
        if (((Map)localIterator.next()).containsKey(columnKey)) {
          i += 1;
        }
      }
      return i;
    }
  }
  
  private class EntrySetIterator
    extends AbstractIterator<Map.Entry<R, V>>
  {
    final Iterator<Map.Entry<R, Map<C, V>>> iterator = this$0.backingMap.entrySet().iterator();
    
    private EntrySetIterator() {}
    
    protected Map.Entry<R, V> computeNext()
    {
      while (iterator.hasNext())
      {
        final Map.Entry localEntry = (Map.Entry)iterator.next();
        if (((Map)localEntry.getValue()).containsKey(columnKey)) {
          new AbstractMapEntry()
          {
            public R getKey()
            {
              return (R)localEntry.getKey();
            }
            
            public V getValue()
            {
              return (V)((Map)localEntry.getValue()).get(columnKey);
            }
            
            public V setValue(V paramAnonymousV)
            {
              return (V)((Map)localEntry.getValue()).put(columnKey, Preconditions.checkNotNull(paramAnonymousV));
            }
          };
        }
      }
      return (Map.Entry)endOfData();
    }
  }
  
  private class KeySet
    extends Maps.KeySet<R, V>
  {
    KeySet()
    {
      super();
    }
    
    public boolean contains(Object paramObject)
    {
      return this$0.contains(paramObject, columnKey);
    }
    
    public boolean remove(Object paramObject)
    {
      return this$0.remove(paramObject, columnKey) != null;
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return removeFromColumnIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
    }
  }
  
  private class Values
    extends Maps.Values<R, V>
  {
    Values()
    {
      super();
    }
    
    public boolean remove(Object paramObject)
    {
      return (paramObject != null) && (removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.equalTo(paramObject))));
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      return removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.in(paramCollection)));
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Column
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */