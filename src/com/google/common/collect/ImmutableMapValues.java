package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
final class ImmutableMapValues<K, V>
  extends ImmutableCollection<V>
{
  private final ImmutableMap<K, V> map;
  
  ImmutableMapValues(ImmutableMap<K, V> paramImmutableMap)
  {
    map = paramImmutableMap;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return (paramObject != null) && (Iterators.contains(iterator(), paramObject));
  }
  
  ImmutableList<V> createAsList()
  {
    new ImmutableAsList()
    {
      ImmutableCollection<V> delegateCollection()
      {
        return ImmutableMapValues.this;
      }
      
      public V get(int paramAnonymousInt)
      {
        return (V)((Map.Entry)val$entryList.get(paramAnonymousInt)).getValue();
      }
    };
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public UnmodifiableIterator<V> iterator()
  {
    return Maps.valueIterator(map.entrySet().iterator());
  }
  
  public int size()
  {
    return map.size();
  }
  
  @GwtIncompatible("serialization")
  Object writeReplace()
  {
    return new SerializedForm(map);
  }
  
  @GwtIncompatible("serialization")
  private static class SerializedForm<V>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final ImmutableMap<?, V> map;
    
    SerializedForm(ImmutableMap<?, V> paramImmutableMap)
    {
      map = paramImmutableMap;
    }
    
    Object readResolve()
    {
      return map.values();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapValues
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */