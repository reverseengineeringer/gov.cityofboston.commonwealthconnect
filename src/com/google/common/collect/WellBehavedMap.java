package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@GwtCompatible
final class WellBehavedMap<K, V>
  extends ForwardingMap<K, V>
{
  private final Map<K, V> delegate;
  private Set<Map.Entry<K, V>> entrySet;
  
  private WellBehavedMap(Map<K, V> paramMap)
  {
    delegate = paramMap;
  }
  
  static <K, V> WellBehavedMap<K, V> wrap(Map<K, V> paramMap)
  {
    return new WellBehavedMap(paramMap);
  }
  
  protected Map<K, V> delegate()
  {
    return delegate;
  }
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    Object localObject = entrySet;
    if (localObject != null) {
      return (Set<Map.Entry<K, V>>)localObject;
    }
    localObject = new EntrySet(null);
    entrySet = ((Set)localObject);
    return (Set<Map.Entry<K, V>>)localObject;
  }
  
  private final class EntrySet
    extends Maps.EntrySet<K, V>
  {
    private EntrySet() {}
    
    public Iterator<Map.Entry<K, V>> iterator()
    {
      new TransformedIterator(keySet().iterator())
      {
        Map.Entry<K, V> transform(final K paramAnonymousK)
        {
          new AbstractMapEntry()
          {
            public K getKey()
            {
              return (K)paramAnonymousK;
            }
            
            public V getValue()
            {
              return (V)get(paramAnonymousK);
            }
            
            public V setValue(V paramAnonymous2V)
            {
              return (V)put(paramAnonymousK, paramAnonymous2V);
            }
          };
        }
      };
    }
    
    Map<K, V> map()
    {
      return WellBehavedMap.this;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.WellBehavedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */