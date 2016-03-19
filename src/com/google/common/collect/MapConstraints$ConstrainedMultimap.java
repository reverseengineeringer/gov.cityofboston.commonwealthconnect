package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class MapConstraints$ConstrainedMultimap<K, V>
  extends ForwardingMultimap<K, V>
  implements Serializable
{
  transient Map<K, Collection<V>> asMap;
  final MapConstraint<? super K, ? super V> constraint;
  final Multimap<K, V> delegate;
  transient Collection<Map.Entry<K, V>> entries;
  
  public MapConstraints$ConstrainedMultimap(Multimap<K, V> paramMultimap, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    delegate = ((Multimap)Preconditions.checkNotNull(paramMultimap));
    constraint = ((MapConstraint)Preconditions.checkNotNull(paramMapConstraint));
  }
  
  public Map<K, Collection<V>> asMap()
  {
    Map localMap = asMap;
    Object localObject = localMap;
    if (localMap == null)
    {
      localObject = new ForwardingMap()
      {
        Set<Map.Entry<K, Collection<V>>> entrySet;
        Collection<Collection<V>> values;
        
        public boolean containsValue(Object paramAnonymousObject)
        {
          return values().contains(paramAnonymousObject);
        }
        
        protected Map<K, Collection<V>> delegate()
        {
          return val$asMapDelegate;
        }
        
        public Set<Map.Entry<K, Collection<V>>> entrySet()
        {
          Set localSet2 = entrySet;
          Set localSet1 = localSet2;
          if (localSet2 == null)
          {
            localSet1 = MapConstraints.access$200(val$asMapDelegate.entrySet(), constraint);
            entrySet = localSet1;
          }
          return localSet1;
        }
        
        public Collection<V> get(Object paramAnonymousObject)
        {
          try
          {
            paramAnonymousObject = MapConstraints.ConstrainedMultimap.this.get(paramAnonymousObject);
            boolean bool = ((Collection)paramAnonymousObject).isEmpty();
            if (bool) {
              paramAnonymousObject = null;
            }
            return (Collection<V>)paramAnonymousObject;
          }
          catch (ClassCastException paramAnonymousObject) {}
          return null;
        }
        
        public Collection<Collection<V>> values()
        {
          Collection localCollection = values;
          Object localObject = localCollection;
          if (localCollection == null)
          {
            localObject = new MapConstraints.ConstrainedAsMapValues(delegate().values(), entrySet());
            values = ((Collection)localObject);
          }
          return (Collection<Collection<V>>)localObject;
        }
      };
      asMap = ((Map)localObject);
    }
    return (Map<K, Collection<V>>)localObject;
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
      localCollection1 = MapConstraints.access$300(delegate.entries(), constraint);
      entries = localCollection1;
    }
    return localCollection1;
  }
  
  public Collection<V> get(final K paramK)
  {
    Constraints.constrainedTypePreservingCollection(delegate.get(paramK), new Constraint()
    {
      public V checkElement(V paramAnonymousV)
      {
        constraint.checkKeyValue(paramK, paramAnonymousV);
        return paramAnonymousV;
      }
    });
  }
  
  public boolean put(K paramK, V paramV)
  {
    constraint.checkKeyValue(paramK, paramV);
    return delegate.put(paramK, paramV);
  }
  
  public boolean putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    boolean bool = false;
    paramMultimap = paramMultimap.entries().iterator();
    while (paramMultimap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMultimap.next();
      bool |= put(localEntry.getKey(), localEntry.getValue());
    }
    return bool;
  }
  
  public boolean putAll(K paramK, Iterable<? extends V> paramIterable)
  {
    return delegate.putAll(paramK, MapConstraints.access$400(paramK, paramIterable, constraint));
  }
  
  public Collection<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    return delegate.replaceValues(paramK, MapConstraints.access$400(paramK, paramIterable, constraint));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */