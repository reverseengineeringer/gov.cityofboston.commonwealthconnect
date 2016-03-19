package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.AbstractMap;
import java.util.Collection;
import java.util.Map.Entry;
import java.util.Set;

@GwtCompatible
abstract class Maps$ImprovedAbstractMap<K, V>
  extends AbstractMap<K, V>
{
  private transient Set<Map.Entry<K, V>> entrySet;
  private transient Set<K> keySet;
  private transient Collection<V> values;
  
  abstract Set<Map.Entry<K, V>> createEntrySet();
  
  Set<K> createKeySet()
  {
    return new Maps.KeySet(this);
  }
  
  Collection<V> createValues()
  {
    return new Maps.Values(this);
  }
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    Set localSet2 = entrySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = createEntrySet();
      entrySet = localSet1;
    }
    return localSet1;
  }
  
  public Set<K> keySet()
  {
    Set localSet2 = keySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = createKeySet();
      keySet = localSet1;
    }
    return localSet1;
  }
  
  public Collection<V> values()
  {
    Collection localCollection2 = values;
    Collection localCollection1 = localCollection2;
    if (localCollection2 == null)
    {
      localCollection1 = createValues();
      values = localCollection1;
    }
    return localCollection1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.ImprovedAbstractMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */