package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map.Entry;
import javax.annotation.Nullable;

final class ImmutableMap$MapViewOfValuesAsSingletonSets<K, V>
  extends ImmutableMap<K, ImmutableSet<V>>
{
  private final ImmutableMap<K, V> delegate;
  
  ImmutableMap$MapViewOfValuesAsSingletonSets(ImmutableMap<K, V> paramImmutableMap)
  {
    delegate = ((ImmutableMap)Preconditions.checkNotNull(paramImmutableMap));
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return delegate.containsKey(paramObject);
  }
  
  ImmutableSet<Map.Entry<K, ImmutableSet<V>>> createEntrySet()
  {
    new ImmutableMapEntrySet()
    {
      public UnmodifiableIterator<Map.Entry<K, ImmutableSet<V>>> iterator()
      {
        new UnmodifiableIterator()
        {
          public boolean hasNext()
          {
            return val$backingIterator.hasNext();
          }
          
          public Map.Entry<K, ImmutableSet<V>> next()
          {
            new AbstractMapEntry()
            {
              public K getKey()
              {
                return (K)val$backingEntry.getKey();
              }
              
              public ImmutableSet<V> getValue()
              {
                return ImmutableSet.of(val$backingEntry.getValue());
              }
            };
          }
        };
      }
      
      ImmutableMap<K, ImmutableSet<V>> map()
      {
        return ImmutableMap.MapViewOfValuesAsSingletonSets.this;
      }
    };
  }
  
  public ImmutableSet<V> get(@Nullable Object paramObject)
  {
    paramObject = delegate.get(paramObject);
    if (paramObject == null) {
      return null;
    }
    return ImmutableSet.of(paramObject);
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int size()
  {
    return delegate.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMap.MapViewOfValuesAsSingletonSets
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */