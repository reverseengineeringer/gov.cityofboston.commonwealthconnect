package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

class Maps$FilteredEntryMap$EntrySet
  extends ForwardingSet<Map.Entry<K, V>>
{
  private Maps$FilteredEntryMap$EntrySet(Maps.FilteredEntryMap paramFilteredEntryMap) {}
  
  protected Set<Map.Entry<K, V>> delegate()
  {
    return this$0.filteredEntrySet;
  }
  
  public Iterator<Map.Entry<K, V>> iterator()
  {
    new TransformedIterator(this$0.filteredEntrySet.iterator())
    {
      Map.Entry<K, V> transform(final Map.Entry<K, V> paramAnonymousEntry)
      {
        new ForwardingMapEntry()
        {
          protected Map.Entry<K, V> delegate()
          {
            return paramAnonymousEntry;
          }
          
          public V setValue(V paramAnonymous2V)
          {
            Preconditions.checkArgument(this$0.apply(getKey(), paramAnonymous2V));
            return (V)super.setValue(paramAnonymous2V);
          }
        };
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryMap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */