package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$Row
  extends Maps.ImprovedAbstractMap<C, V>
{
  Map<C, V> backingRowMap;
  final R rowKey;
  
  StandardTable$Row(R paramR)
  {
    Object localObject;
    rowKey = Preconditions.checkNotNull(localObject);
  }
  
  Map<C, V> backingRowMap()
  {
    if ((backingRowMap == null) || ((backingRowMap.isEmpty()) && (this$0.backingMap.containsKey(rowKey))))
    {
      Map localMap = computeBackingRowMap();
      backingRowMap = localMap;
      return localMap;
    }
    return backingRowMap;
  }
  
  public void clear()
  {
    Map localMap = backingRowMap();
    if (localMap != null) {
      localMap.clear();
    }
    maintainEmptyInvariant();
  }
  
  Map<C, V> computeBackingRowMap()
  {
    return (Map)this$0.backingMap.get(rowKey);
  }
  
  public boolean containsKey(Object paramObject)
  {
    Map localMap = backingRowMap();
    return (paramObject != null) && (localMap != null) && (Maps.safeContainsKey(localMap, paramObject));
  }
  
  protected Set<Map.Entry<C, V>> createEntrySet()
  {
    return new RowEntrySet(null);
  }
  
  public V get(Object paramObject)
  {
    Map localMap = backingRowMap();
    if ((paramObject != null) && (localMap != null)) {
      return (V)Maps.safeGet(localMap, paramObject);
    }
    return null;
  }
  
  void maintainEmptyInvariant()
  {
    if ((backingRowMap() != null) && (backingRowMap.isEmpty()))
    {
      this$0.backingMap.remove(rowKey);
      backingRowMap = null;
    }
  }
  
  public V put(C paramC, V paramV)
  {
    Preconditions.checkNotNull(paramC);
    Preconditions.checkNotNull(paramV);
    if ((backingRowMap != null) && (!backingRowMap.isEmpty())) {
      return (V)backingRowMap.put(paramC, paramV);
    }
    return (V)this$0.put(rowKey, paramC, paramV);
  }
  
  public V remove(Object paramObject)
  {
    Map localMap = backingRowMap();
    if (localMap == null) {
      return null;
    }
    paramObject = Maps.safeRemove(localMap, paramObject);
    maintainEmptyInvariant();
    return (V)paramObject;
  }
  
  private final class RowEntrySet
    extends Maps.EntrySet<C, V>
  {
    private RowEntrySet() {}
    
    public Iterator<Map.Entry<C, V>> iterator()
    {
      Map localMap = backingRowMap();
      if (localMap == null) {
        return Iterators.emptyModifiableIterator();
      }
      new Iterator()
      {
        public boolean hasNext()
        {
          return val$iterator.hasNext();
        }
        
        public Map.Entry<C, V> next()
        {
          new ForwardingMapEntry()
          {
            protected Map.Entry<C, V> delegate()
            {
              return val$entry;
            }
            
            public boolean equals(Object paramAnonymous2Object)
            {
              return standardEquals(paramAnonymous2Object);
            }
            
            public V setValue(V paramAnonymous2V)
            {
              return (V)super.setValue(Preconditions.checkNotNull(paramAnonymous2V));
            }
          };
        }
        
        public void remove()
        {
          val$iterator.remove();
          maintainEmptyInvariant();
        }
      };
    }
    
    Map<C, V> map()
    {
      return StandardTable.Row.this;
    }
    
    public int size()
    {
      Map localMap = backingRowMap();
      if (localMap == null) {
        return 0;
      }
      return localMap.size();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Row
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */