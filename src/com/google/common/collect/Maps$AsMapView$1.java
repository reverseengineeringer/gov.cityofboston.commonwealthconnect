package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class Maps$AsMapView$1
  extends Maps.EntrySet<K, V>
{
  Maps$AsMapView$1(Maps.AsMapView paramAsMapView) {}
  
  public Iterator<Map.Entry<K, V>> iterator()
  {
    return Maps.asMapEntryIterator(this$0.backingSet(), this$0.function);
  }
  
  Map<K, V> map()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.AsMapView.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */