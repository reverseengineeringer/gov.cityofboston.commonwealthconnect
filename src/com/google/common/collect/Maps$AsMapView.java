package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Maps$AsMapView<K, V>
  extends Maps.ImprovedAbstractMap<K, V>
{
  final Function<? super K, V> function;
  private final Set<K> set;
  
  Maps$AsMapView(Set<K> paramSet, Function<? super K, V> paramFunction)
  {
    set = ((Set)Preconditions.checkNotNull(paramSet));
    function = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  Set<K> backingSet()
  {
    return set;
  }
  
  public void clear()
  {
    backingSet().clear();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return backingSet().contains(paramObject);
  }
  
  protected Set<Map.Entry<K, V>> createEntrySet()
  {
    new Maps.EntrySet()
    {
      public Iterator<Map.Entry<K, V>> iterator()
      {
        return Maps.asMapEntryIterator(backingSet(), function);
      }
      
      Map<K, V> map()
      {
        return Maps.AsMapView.this;
      }
    };
  }
  
  public Set<K> createKeySet()
  {
    return Maps.access$200(backingSet());
  }
  
  Collection<V> createValues()
  {
    return Collections2.transform(set, function);
  }
  
  public V get(@Nullable Object paramObject)
  {
    if (Collections2.safeContains(backingSet(), paramObject)) {
      return (V)function.apply(paramObject);
    }
    return null;
  }
  
  public V remove(@Nullable Object paramObject)
  {
    if (backingSet().remove(paramObject)) {
      return (V)function.apply(paramObject);
    }
    return null;
  }
  
  public int size()
  {
    return backingSet().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.AsMapView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */