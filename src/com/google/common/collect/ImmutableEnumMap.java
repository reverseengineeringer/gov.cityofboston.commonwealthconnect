package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class ImmutableEnumMap<K extends Enum<K>, V>
  extends ImmutableMap<K, V>
{
  private final transient EnumMap<K, V> delegate;
  
  private ImmutableEnumMap(EnumMap<K, V> paramEnumMap)
  {
    delegate = paramEnumMap;
    if (!paramEnumMap.isEmpty()) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      return;
    }
  }
  
  static <K extends Enum<K>, V> ImmutableMap<K, V> asImmutable(EnumMap<K, V> paramEnumMap)
  {
    switch (paramEnumMap.size())
    {
    default: 
      return new ImmutableEnumMap(paramEnumMap);
    case 0: 
      return ImmutableMap.of();
    }
    paramEnumMap = (Map.Entry)Iterables.getOnlyElement(paramEnumMap.entrySet());
    return ImmutableMap.of(paramEnumMap.getKey(), paramEnumMap.getValue());
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return delegate.containsKey(paramObject);
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    new ImmutableMapEntrySet()
    {
      public UnmodifiableIterator<Map.Entry<K, V>> iterator()
      {
        new UnmodifiableIterator()
        {
          private final Iterator<Map.Entry<K, V>> backingIterator = delegate.entrySet().iterator();
          
          public boolean hasNext()
          {
            return backingIterator.hasNext();
          }
          
          public Map.Entry<K, V> next()
          {
            Map.Entry localEntry = (Map.Entry)backingIterator.next();
            return Maps.immutableEntry(localEntry.getKey(), localEntry.getValue());
          }
        };
      }
      
      ImmutableMap<K, V> map()
      {
        return ImmutableEnumMap.this;
      }
    };
  }
  
  ImmutableSet<K> createKeySet()
  {
    new ImmutableSet()
    {
      public boolean contains(Object paramAnonymousObject)
      {
        return delegate.containsKey(paramAnonymousObject);
      }
      
      boolean isPartialView()
      {
        return true;
      }
      
      public UnmodifiableIterator<K> iterator()
      {
        return Iterators.unmodifiableIterator(delegate.keySet().iterator());
      }
      
      public int size()
      {
        return ImmutableEnumMap.this.size();
      }
    };
  }
  
  public V get(Object paramObject)
  {
    return (V)delegate.get(paramObject);
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int size()
  {
    return delegate.size();
  }
  
  Object writeReplace()
  {
    return new EnumSerializedForm(delegate);
  }
  
  private static class EnumSerializedForm<K extends Enum<K>, V>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final EnumMap<K, V> delegate;
    
    EnumSerializedForm(EnumMap<K, V> paramEnumMap)
    {
      delegate = paramEnumMap;
    }
    
    Object readResolve()
    {
      return new ImmutableEnumMap(delegate, null);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableEnumMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */