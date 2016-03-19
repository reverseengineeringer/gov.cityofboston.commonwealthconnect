package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Multimaps$Keys<K, V>
  extends AbstractMultiset<K>
{
  final Multimap<K, V> multimap;
  
  Multimaps$Keys(Multimap<K, V> paramMultimap)
  {
    multimap = paramMultimap;
  }
  
  public void clear()
  {
    multimap.clear();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return multimap.containsKey(paramObject);
  }
  
  public int count(@Nullable Object paramObject)
  {
    paramObject = (Collection)Maps.safeGet(multimap.asMap(), paramObject);
    if (paramObject == null) {
      return 0;
    }
    return ((Collection)paramObject).size();
  }
  
  Set<Multiset.Entry<K>> createEntrySet()
  {
    return new KeysEntrySet();
  }
  
  int distinctElements()
  {
    return multimap.asMap().size();
  }
  
  public Set<K> elementSet()
  {
    return multimap.keySet();
  }
  
  Iterator<Multiset.Entry<K>> entryIterator()
  {
    new TransformedIterator(multimap.asMap().entrySet().iterator())
    {
      Multiset.Entry<K> transform(final Map.Entry<K, Collection<V>> paramAnonymousEntry)
      {
        new Multisets.AbstractEntry()
        {
          public int getCount()
          {
            return ((Collection)paramAnonymousEntry.getValue()).size();
          }
          
          public K getElement()
          {
            return (K)paramAnonymousEntry.getKey();
          }
        };
      }
    };
  }
  
  public Iterator<K> iterator()
  {
    return Maps.keyIterator(multimap.entries().iterator());
  }
  
  public int remove(@Nullable Object paramObject, int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "occurrences");
    int i;
    if (paramInt == 0)
    {
      i = count(paramObject);
      return i;
    }
    paramObject = (Collection)Maps.safeGet(multimap.asMap(), paramObject);
    if (paramObject == null) {
      return 0;
    }
    int k = ((Collection)paramObject).size();
    if (paramInt >= k)
    {
      ((Collection)paramObject).clear();
      return k;
    }
    paramObject = ((Collection)paramObject).iterator();
    int j = 0;
    for (;;)
    {
      i = k;
      if (j >= paramInt) {
        break;
      }
      ((Iterator)paramObject).next();
      ((Iterator)paramObject).remove();
      j += 1;
    }
  }
  
  class KeysEntrySet
    extends Multisets.EntrySet<K>
  {
    KeysEntrySet() {}
    
    public boolean contains(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof Multiset.Entry))
      {
        paramObject = (Multiset.Entry)paramObject;
        Collection localCollection = (Collection)multimap.asMap().get(((Multiset.Entry)paramObject).getElement());
        bool1 = bool2;
        if (localCollection != null)
        {
          bool1 = bool2;
          if (localCollection.size() == ((Multiset.Entry)paramObject).getCount()) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public boolean isEmpty()
    {
      return multimap.isEmpty();
    }
    
    public Iterator<Multiset.Entry<K>> iterator()
    {
      return entryIterator();
    }
    
    Multiset<K> multiset()
    {
      return Multimaps.Keys.this;
    }
    
    public boolean remove(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Multiset.Entry))
      {
        paramObject = (Multiset.Entry)paramObject;
        Collection localCollection = (Collection)multimap.asMap().get(((Multiset.Entry)paramObject).getElement());
        if ((localCollection != null) && (localCollection.size() == ((Multiset.Entry)paramObject).getCount()))
        {
          localCollection.clear();
          return true;
        }
      }
      return false;
    }
    
    public int size()
    {
      return distinctElements();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.Keys
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */