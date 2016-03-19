package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class SingletonImmutableBiMap<K, V>
  extends ImmutableBiMap<K, V>
{
  transient ImmutableBiMap<V, K> inverse;
  final transient K singleKey;
  final transient V singleValue;
  
  SingletonImmutableBiMap(K paramK, V paramV)
  {
    CollectPreconditions.checkEntryNotNull(paramK, paramV);
    singleKey = paramK;
    singleValue = paramV;
  }
  
  private SingletonImmutableBiMap(K paramK, V paramV, ImmutableBiMap<V, K> paramImmutableBiMap)
  {
    singleKey = paramK;
    singleValue = paramV;
    inverse = paramImmutableBiMap;
  }
  
  SingletonImmutableBiMap(Map.Entry<? extends K, ? extends V> paramEntry)
  {
    this(paramEntry.getKey(), paramEntry.getValue());
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return singleKey.equals(paramObject);
  }
  
  public boolean containsValue(@Nullable Object paramObject)
  {
    return singleValue.equals(paramObject);
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    return ImmutableSet.of(Maps.immutableEntry(singleKey, singleValue));
  }
  
  ImmutableSet<K> createKeySet()
  {
    return ImmutableSet.of(singleKey);
  }
  
  public V get(@Nullable Object paramObject)
  {
    if (singleKey.equals(paramObject)) {
      return (V)singleValue;
    }
    return null;
  }
  
  public ImmutableBiMap<V, K> inverse()
  {
    ImmutableBiMap localImmutableBiMap = inverse;
    Object localObject = localImmutableBiMap;
    if (localImmutableBiMap == null)
    {
      localObject = new SingletonImmutableBiMap(singleValue, singleKey, this);
      inverse = ((ImmutableBiMap)localObject);
    }
    return (ImmutableBiMap<V, K>)localObject;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int size()
  {
    return 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SingletonImmutableBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */