package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Map.Entry;

class Maps$FilteredEntryMap$EntrySet$1$1
  extends ForwardingMapEntry<K, V>
{
  Maps$FilteredEntryMap$EntrySet$1$1(Maps.FilteredEntryMap.EntrySet.1 param1, Map.Entry paramEntry) {}
  
  protected Map.Entry<K, V> delegate()
  {
    return val$entry;
  }
  
  public V setValue(V paramV)
  {
    Preconditions.checkArgument(this$2.this$1.this$0.apply(getKey(), paramV));
    return (V)super.setValue(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryMap.EntrySet.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */