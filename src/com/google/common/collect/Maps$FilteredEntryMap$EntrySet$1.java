package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map.Entry;

class Maps$FilteredEntryMap$EntrySet$1
  extends TransformedIterator<Map.Entry<K, V>, Map.Entry<K, V>>
{
  Maps$FilteredEntryMap$EntrySet$1(Maps.FilteredEntryMap.EntrySet paramEntrySet, Iterator paramIterator)
  {
    super(paramIterator);
  }
  
  Map.Entry<K, V> transform(final Map.Entry<K, V> paramEntry)
  {
    new ForwardingMapEntry()
    {
      protected Map.Entry<K, V> delegate()
      {
        return paramEntry;
      }
      
      public V setValue(V paramAnonymousV)
      {
        Preconditions.checkArgument(this$1.this$0.apply(getKey(), paramAnonymousV));
        return (V)super.setValue(paramAnonymousV);
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryMap.EntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */