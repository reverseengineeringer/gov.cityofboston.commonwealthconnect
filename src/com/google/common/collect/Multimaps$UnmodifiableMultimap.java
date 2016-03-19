package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class Multimaps$UnmodifiableMultimap<K, V>
  extends ForwardingMultimap<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Multimap<K, V> delegate;
  transient Collection<Map.Entry<K, V>> entries;
  transient Set<K> keySet;
  transient Multiset<K> keys;
  transient Map<K, Collection<V>> map;
  transient Collection<V> values;
  
  Multimaps$UnmodifiableMultimap(Multimap<K, V> paramMultimap)
  {
    delegate = ((Multimap)Preconditions.checkNotNull(paramMultimap));
  }
  
  public Map<K, Collection<V>> asMap()
  {
    Map localMap2 = map;
    Map localMap1 = localMap2;
    if (localMap2 == null)
    {
      localMap1 = Collections.unmodifiableMap(Maps.transformValues(delegate.asMap(), new Function()
      {
        public Collection<V> apply(Collection<V> paramAnonymousCollection)
        {
          return Multimaps.access$000(paramAnonymousCollection);
        }
      }));
      map = localMap1;
    }
    return localMap1;
  }
  
  public void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  protected Multimap<K, V> delegate()
  {
    return delegate;
  }
  
  public Collection<Map.Entry<K, V>> entries()
  {
    Collection localCollection2 = entries;
    Collection localCollection1 = localCollection2;
    if (localCollection2 == null)
    {
      localCollection1 = Multimaps.access$100(delegate.entries());
      entries = localCollection1;
    }
    return localCollection1;
  }
  
  public Collection<V> get(K paramK)
  {
    return Multimaps.access$000(delegate.get(paramK));
  }
  
  public Set<K> keySet()
  {
    Set localSet2 = keySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = Collections.unmodifiableSet(delegate.keySet());
      keySet = localSet1;
    }
    return localSet1;
  }
  
  public Multiset<K> keys()
  {
    Multiset localMultiset2 = keys;
    Multiset localMultiset1 = localMultiset2;
    if (localMultiset2 == null)
    {
      localMultiset1 = Multisets.unmodifiableMultiset(delegate.keys());
      keys = localMultiset1;
    }
    return localMultiset1;
  }
  
  public boolean put(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean putAll(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean remove(Object paramObject1, Object paramObject2)
  {
    throw new UnsupportedOperationException();
  }
  
  public Collection<V> removeAll(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public Collection<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public Collection<V> values()
  {
    Collection localCollection2 = values;
    Collection localCollection1 = localCollection2;
    if (localCollection2 == null)
    {
      localCollection1 = Collections.unmodifiableCollection(delegate.values());
      values = localCollection1;
    }
    return localCollection1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.UnmodifiableMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */