package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
final class ImmutableMapKeySet<K, V>
  extends ImmutableSet<K>
{
  private final ImmutableMap<K, V> map;
  
  ImmutableMapKeySet(ImmutableMap<K, V> paramImmutableMap)
  {
    map = paramImmutableMap;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return map.containsKey(paramObject);
  }
  
  ImmutableList<K> createAsList()
  {
    new ImmutableAsList()
    {
      ImmutableCollection<K> delegateCollection()
      {
        return ImmutableMapKeySet.this;
      }
      
      public K get(int paramAnonymousInt)
      {
        return (K)((Map.Entry)val$entryList.get(paramAnonymousInt)).getKey();
      }
    };
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public UnmodifiableIterator<K> iterator()
  {
    return asList().iterator();
  }
  
  public int size()
  {
    return map.size();
  }
  
  @GwtIncompatible("serialization")
  Object writeReplace()
  {
    return new KeySetSerializedForm(map);
  }
  
  @GwtIncompatible("serialization")
  private static class KeySetSerializedForm<K>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final ImmutableMap<K, ?> map;
    
    KeySetSerializedForm(ImmutableMap<K, ?> paramImmutableMap)
    {
      map = paramImmutableMap;
    }
    
    Object readResolve()
    {
      return map.keySet();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */