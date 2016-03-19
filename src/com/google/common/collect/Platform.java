package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Predicate;
import java.lang.reflect.Array;
import java.util.Collections;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;

@GwtCompatible(emulated=true)
final class Platform
{
  static <K, V> SortedMap<K, V> mapsAsMapSortedSet(SortedSet<K> paramSortedSet, Function<? super K, V> paramFunction)
  {
    if ((paramSortedSet instanceof NavigableSet)) {
      return Maps.asMap((NavigableSet)paramSortedSet, paramFunction);
    }
    return Maps.asMapSortedIgnoreNavigable(paramSortedSet, paramFunction);
  }
  
  static <K, V> SortedMap<K, V> mapsFilterSortedMap(SortedMap<K, V> paramSortedMap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    if ((paramSortedMap instanceof NavigableMap)) {
      return Maps.filterEntries((NavigableMap)paramSortedMap, paramPredicate);
    }
    return Maps.filterSortedIgnoreNavigable(paramSortedMap, paramPredicate);
  }
  
  static <K, V1, V2> SortedMap<K, V2> mapsTransformEntriesSortedMap(SortedMap<K, V1> paramSortedMap, Maps.EntryTransformer<? super K, ? super V1, V2> paramEntryTransformer)
  {
    if ((paramSortedMap instanceof NavigableMap)) {
      return Maps.transformEntries((NavigableMap)paramSortedMap, paramEntryTransformer);
    }
    return Maps.transformEntriesIgnoreNavigable(paramSortedMap, paramEntryTransformer);
  }
  
  static <T> T[] newArray(T[] paramArrayOfT, int paramInt)
  {
    return (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), paramInt);
  }
  
  static <E> Set<E> newSetFromMap(Map<E, Boolean> paramMap)
  {
    return Collections.newSetFromMap(paramMap);
  }
  
  static <E> SortedSet<E> setsFilterSortedSet(SortedSet<E> paramSortedSet, Predicate<? super E> paramPredicate)
  {
    if ((paramSortedSet instanceof NavigableSet)) {
      return Sets.filter((NavigableSet)paramSortedSet, paramPredicate);
    }
    return Sets.filterSortedIgnoreNavigable(paramSortedSet, paramPredicate);
  }
  
  static MapMaker tryWeakKeys(MapMaker paramMapMaker)
  {
    return paramMapMaker.weakKeys();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Platform
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */