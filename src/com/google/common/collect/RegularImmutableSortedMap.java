package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
final class RegularImmutableSortedMap<K, V>
  extends ImmutableSortedMap<K, V>
{
  private final transient RegularImmutableSortedSet<K> keySet;
  private final transient ImmutableList<V> valueList;
  
  RegularImmutableSortedMap(RegularImmutableSortedSet<K> paramRegularImmutableSortedSet, ImmutableList<V> paramImmutableList)
  {
    keySet = paramRegularImmutableSortedSet;
    valueList = paramImmutableList;
  }
  
  RegularImmutableSortedMap(RegularImmutableSortedSet<K> paramRegularImmutableSortedSet, ImmutableList<V> paramImmutableList, ImmutableSortedMap<K, V> paramImmutableSortedMap)
  {
    super(paramImmutableSortedMap);
    keySet = paramRegularImmutableSortedSet;
    valueList = paramImmutableList;
  }
  
  private ImmutableSortedMap<K, V> getSubMap(int paramInt1, int paramInt2)
  {
    if ((paramInt1 == 0) && (paramInt2 == size())) {
      return this;
    }
    if (paramInt1 == paramInt2) {
      return emptyMap(comparator());
    }
    return from(keySet.getSubSet(paramInt1, paramInt2), valueList.subList(paramInt1, paramInt2));
  }
  
  ImmutableSortedMap<K, V> createDescendingMap()
  {
    return new RegularImmutableSortedMap((RegularImmutableSortedSet)keySet.descendingSet(), valueList.reverse(), this);
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    return new EntrySet(null);
  }
  
  public V get(@Nullable Object paramObject)
  {
    int i = keySet.indexOf(paramObject);
    if (i == -1) {
      return null;
    }
    return (V)valueList.get(i);
  }
  
  public ImmutableSortedMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    return getSubMap(0, keySet.headIndex(Preconditions.checkNotNull(paramK), paramBoolean));
  }
  
  public ImmutableSortedSet<K> keySet()
  {
    return keySet;
  }
  
  public ImmutableSortedMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    return getSubMap(keySet.tailIndex(Preconditions.checkNotNull(paramK), paramBoolean), size());
  }
  
  public ImmutableCollection<V> values()
  {
    return valueList;
  }
  
  private class EntrySet
    extends ImmutableMapEntrySet<K, V>
  {
    private EntrySet() {}
    
    ImmutableList<Map.Entry<K, V>> createAsList()
    {
      new ImmutableAsList()
      {
        private final ImmutableList<K> keyList = keySet().asList();
        
        ImmutableCollection<Map.Entry<K, V>> delegateCollection()
        {
          return RegularImmutableSortedMap.EntrySet.this;
        }
        
        public Map.Entry<K, V> get(int paramAnonymousInt)
        {
          return Maps.immutableEntry(keyList.get(paramAnonymousInt), valueList.get(paramAnonymousInt));
        }
      };
    }
    
    public UnmodifiableIterator<Map.Entry<K, V>> iterator()
    {
      return asList().iterator();
    }
    
    ImmutableMap<K, V> map()
    {
      return RegularImmutableSortedMap.this;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */