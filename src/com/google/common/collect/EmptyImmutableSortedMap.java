package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
final class EmptyImmutableSortedMap<K, V>
  extends ImmutableSortedMap<K, V>
{
  private final transient ImmutableSortedSet<K> keySet;
  
  EmptyImmutableSortedMap(Comparator<? super K> paramComparator)
  {
    keySet = ImmutableSortedSet.emptySet(paramComparator);
  }
  
  EmptyImmutableSortedMap(Comparator<? super K> paramComparator, ImmutableSortedMap<K, V> paramImmutableSortedMap)
  {
    super(paramImmutableSortedMap);
    keySet = ImmutableSortedSet.emptySet(paramComparator);
  }
  
  public ImmutableSetMultimap<K, V> asMultimap()
  {
    return ImmutableSetMultimap.of();
  }
  
  ImmutableSortedMap<K, V> createDescendingMap()
  {
    return new EmptyImmutableSortedMap(Ordering.from(comparator()).reverse(), this);
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    throw new AssertionError("should never be called");
  }
  
  public ImmutableSet<Map.Entry<K, V>> entrySet()
  {
    return ImmutableSet.of();
  }
  
  public V get(@Nullable Object paramObject)
  {
    return null;
  }
  
  public ImmutableSortedMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    Preconditions.checkNotNull(paramK);
    return this;
  }
  
  public boolean isEmpty()
  {
    return true;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public ImmutableSortedSet<K> keySet()
  {
    return keySet;
  }
  
  public int size()
  {
    return 0;
  }
  
  public ImmutableSortedMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    Preconditions.checkNotNull(paramK);
    return this;
  }
  
  public String toString()
  {
    return "{}";
  }
  
  public ImmutableCollection<V> values()
  {
    return ImmutableList.of();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EmptyImmutableSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */