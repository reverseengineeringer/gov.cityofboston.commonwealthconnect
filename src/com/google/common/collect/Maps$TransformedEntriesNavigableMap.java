package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableMap")
class Maps$TransformedEntriesNavigableMap<K, V1, V2>
  extends Maps.TransformedEntriesSortedMap<K, V1, V2>
  implements NavigableMap<K, V2>
{
  Maps$TransformedEntriesNavigableMap(NavigableMap<K, V1> paramNavigableMap, Maps.EntryTransformer<? super K, ? super V1, V2> paramEntryTransformer)
  {
    super(paramNavigableMap, paramEntryTransformer);
  }
  
  @Nullable
  private Map.Entry<K, V2> transformEntry(@Nullable Map.Entry<K, V1> paramEntry)
  {
    if (paramEntry == null) {
      return null;
    }
    return Maps.transformEntry(transformer, paramEntry);
  }
  
  public Map.Entry<K, V2> ceilingEntry(K paramK)
  {
    return transformEntry(fromMap().ceilingEntry(paramK));
  }
  
  public K ceilingKey(K paramK)
  {
    return (K)fromMap().ceilingKey(paramK);
  }
  
  public NavigableSet<K> descendingKeySet()
  {
    return fromMap().descendingKeySet();
  }
  
  public NavigableMap<K, V2> descendingMap()
  {
    return Maps.transformEntries(fromMap().descendingMap(), transformer);
  }
  
  public Map.Entry<K, V2> firstEntry()
  {
    return transformEntry(fromMap().firstEntry());
  }
  
  public Map.Entry<K, V2> floorEntry(K paramK)
  {
    return transformEntry(fromMap().floorEntry(paramK));
  }
  
  public K floorKey(K paramK)
  {
    return (K)fromMap().floorKey(paramK);
  }
  
  protected NavigableMap<K, V1> fromMap()
  {
    return (NavigableMap)super.fromMap();
  }
  
  public NavigableMap<K, V2> headMap(K paramK)
  {
    return headMap(paramK, false);
  }
  
  public NavigableMap<K, V2> headMap(K paramK, boolean paramBoolean)
  {
    return Maps.transformEntries(fromMap().headMap(paramK, paramBoolean), transformer);
  }
  
  public Map.Entry<K, V2> higherEntry(K paramK)
  {
    return transformEntry(fromMap().higherEntry(paramK));
  }
  
  public K higherKey(K paramK)
  {
    return (K)fromMap().higherKey(paramK);
  }
  
  public Map.Entry<K, V2> lastEntry()
  {
    return transformEntry(fromMap().lastEntry());
  }
  
  public Map.Entry<K, V2> lowerEntry(K paramK)
  {
    return transformEntry(fromMap().lowerEntry(paramK));
  }
  
  public K lowerKey(K paramK)
  {
    return (K)fromMap().lowerKey(paramK);
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    return fromMap().navigableKeySet();
  }
  
  public Map.Entry<K, V2> pollFirstEntry()
  {
    return transformEntry(fromMap().pollFirstEntry());
  }
  
  public Map.Entry<K, V2> pollLastEntry()
  {
    return transformEntry(fromMap().pollLastEntry());
  }
  
  public NavigableMap<K, V2> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }
  
  public NavigableMap<K, V2> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return Maps.transformEntries(fromMap().subMap(paramK1, paramBoolean1, paramK2, paramBoolean2), transformer);
  }
  
  public NavigableMap<K, V2> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }
  
  public NavigableMap<K, V2> tailMap(K paramK, boolean paramBoolean)
  {
    return Maps.transformEntries(fromMap().tailMap(paramK, paramBoolean), transformer);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.TransformedEntriesNavigableMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */