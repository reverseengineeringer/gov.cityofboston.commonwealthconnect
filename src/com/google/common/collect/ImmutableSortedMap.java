package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.Set;
import java.util.SortedMap;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableSortedMap<K, V>
  extends ImmutableSortedMapFauxverideShim<K, V>
  implements NavigableMap<K, V>
{
  private static final ImmutableSortedMap<Comparable, Object> NATURAL_EMPTY_MAP = new EmptyImmutableSortedMap(NATURAL_ORDER);
  private static final Comparator<Comparable> NATURAL_ORDER = ;
  private static final long serialVersionUID = 0L;
  private transient ImmutableSortedMap<K, V> descendingMap;
  
  ImmutableSortedMap() {}
  
  ImmutableSortedMap(ImmutableSortedMap<K, V> paramImmutableSortedMap)
  {
    descendingMap = paramImmutableSortedMap;
  }
  
  public static <K, V> ImmutableSortedMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap)
  {
    return copyOfInternal(paramMap, Ordering.natural());
  }
  
  public static <K, V> ImmutableSortedMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap, Comparator<? super K> paramComparator)
  {
    return copyOfInternal(paramMap, (Comparator)Preconditions.checkNotNull(paramComparator));
  }
  
  private static <K, V> ImmutableSortedMap<K, V> copyOfInternal(Map<? extends K, ? extends V> paramMap, Comparator<? super K> paramComparator)
  {
    boolean bool = false;
    Object localObject;
    if ((paramMap instanceof SortedMap))
    {
      localObject = ((SortedMap)paramMap).comparator();
      if (localObject != null) {
        break label62;
      }
      if (paramComparator != NATURAL_ORDER) {
        break label57;
      }
      bool = true;
    }
    while ((bool) && ((paramMap instanceof ImmutableSortedMap)))
    {
      localObject = (ImmutableSortedMap)paramMap;
      if (((ImmutableSortedMap)localObject).isPartialView()) {
        break;
      }
      return (ImmutableSortedMap<K, V>)localObject;
      label57:
      bool = false;
      continue;
      label62:
      bool = paramComparator.equals(localObject);
    }
    paramMap = (Map.Entry[])paramMap.entrySet().toArray(new Map.Entry[0]);
    return fromEntries(paramComparator, bool, paramMap.length, paramMap);
  }
  
  public static <K, V> ImmutableSortedMap<K, V> copyOfSorted(SortedMap<K, ? extends V> paramSortedMap)
  {
    Comparator localComparator2 = paramSortedMap.comparator();
    Comparator localComparator1 = localComparator2;
    if (localComparator2 == null) {
      localComparator1 = NATURAL_ORDER;
    }
    return copyOfInternal(paramSortedMap, localComparator1);
  }
  
  static <K, V> ImmutableSortedMap<K, V> emptyMap(Comparator<? super K> paramComparator)
  {
    if (Ordering.natural().equals(paramComparator)) {
      return of();
    }
    return new EmptyImmutableSortedMap(paramComparator);
  }
  
  static <K, V> ImmutableSortedMap<K, V> from(ImmutableSortedSet<K> paramImmutableSortedSet, ImmutableList<V> paramImmutableList)
  {
    if (paramImmutableSortedSet.isEmpty()) {
      return emptyMap(paramImmutableSortedSet.comparator());
    }
    return new RegularImmutableSortedMap((RegularImmutableSortedSet)paramImmutableSortedSet, paramImmutableList);
  }
  
  static <K, V> ImmutableSortedMap<K, V> fromEntries(Comparator<? super K> paramComparator, boolean paramBoolean, int paramInt, Map.Entry<K, V>... paramVarArgs)
  {
    int i = 0;
    while (i < paramInt)
    {
      Map.Entry<K, V> localEntry = paramVarArgs[i];
      paramVarArgs[i] = entryOf(localEntry.getKey(), localEntry.getValue());
      i += 1;
    }
    if (!paramBoolean)
    {
      sortEntries(paramComparator, paramInt, paramVarArgs);
      validateEntries(paramInt, paramVarArgs, paramComparator);
    }
    return fromSortedEntries(paramComparator, paramInt, paramVarArgs);
  }
  
  static <K, V> ImmutableSortedMap<K, V> fromSortedEntries(Comparator<? super K> paramComparator, int paramInt, Map.Entry<K, V>[] paramArrayOfEntry)
  {
    if (paramInt == 0) {
      return emptyMap(paramComparator);
    }
    ImmutableList.Builder localBuilder1 = ImmutableList.builder();
    ImmutableList.Builder localBuilder2 = ImmutableList.builder();
    int i = 0;
    while (i < paramInt)
    {
      Map.Entry<K, V> localEntry = paramArrayOfEntry[i];
      localBuilder1.add(localEntry.getKey());
      localBuilder2.add(localEntry.getValue());
      i += 1;
    }
    return new RegularImmutableSortedMap(new RegularImmutableSortedSet(localBuilder1.build(), paramComparator), localBuilder2.build());
  }
  
  public static <K extends Comparable<?>, V> Builder<K, V> naturalOrder()
  {
    return new Builder(Ordering.natural());
  }
  
  public static <K, V> ImmutableSortedMap<K, V> of()
  {
    return NATURAL_EMPTY_MAP;
  }
  
  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK, V paramV)
  {
    return from(ImmutableSortedSet.of(paramK), ImmutableList.of(paramV));
  }
  
  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    return fromEntries(Ordering.natural(), false, 2, new Map.Entry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2) });
  }
  
  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    return fromEntries(Ordering.natural(), false, 3, new Map.Entry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3) });
  }
  
  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    return fromEntries(Ordering.natural(), false, 4, new Map.Entry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3), entryOf(paramK4, paramV4) });
  }
  
  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    return fromEntries(Ordering.natural(), false, 5, new Map.Entry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3), entryOf(paramK4, paramV4), entryOf(paramK5, paramV5) });
  }
  
  public static <K, V> Builder<K, V> orderedBy(Comparator<K> paramComparator)
  {
    return new Builder(paramComparator);
  }
  
  public static <K extends Comparable<?>, V> Builder<K, V> reverseOrder()
  {
    return new Builder(Ordering.natural().reverse());
  }
  
  private static <K, V> void sortEntries(Comparator<? super K> paramComparator, int paramInt, Map.Entry<K, V>[] paramArrayOfEntry)
  {
    Arrays.sort(paramArrayOfEntry, 0, paramInt, Ordering.from(paramComparator).onKeys());
  }
  
  private static <K, V> void validateEntries(int paramInt, Map.Entry<K, V>[] paramArrayOfEntry, Comparator<? super K> paramComparator)
  {
    int i = 1;
    if (i < paramInt)
    {
      if (paramComparator.compare(paramArrayOfEntry[(i - 1)].getKey(), paramArrayOfEntry[i].getKey()) != 0) {}
      for (boolean bool = true;; bool = false)
      {
        checkNoConflict(bool, "key", paramArrayOfEntry[(i - 1)], paramArrayOfEntry[i]);
        i += 1;
        break;
      }
    }
  }
  
  public Map.Entry<K, V> ceilingEntry(K paramK)
  {
    return tailMap(paramK, true).firstEntry();
  }
  
  public K ceilingKey(K paramK)
  {
    return (K)Maps.keyOrNull(ceilingEntry(paramK));
  }
  
  public Comparator<? super K> comparator()
  {
    return keySet().comparator();
  }
  
  public boolean containsValue(@Nullable Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  abstract ImmutableSortedMap<K, V> createDescendingMap();
  
  public ImmutableSortedSet<K> descendingKeySet()
  {
    return keySet().descendingSet();
  }
  
  public ImmutableSortedMap<K, V> descendingMap()
  {
    ImmutableSortedMap localImmutableSortedMap2 = descendingMap;
    ImmutableSortedMap localImmutableSortedMap1 = localImmutableSortedMap2;
    if (localImmutableSortedMap2 == null)
    {
      localImmutableSortedMap1 = createDescendingMap();
      descendingMap = localImmutableSortedMap1;
    }
    return localImmutableSortedMap1;
  }
  
  public ImmutableSet<Map.Entry<K, V>> entrySet()
  {
    return super.entrySet();
  }
  
  public Map.Entry<K, V> firstEntry()
  {
    if (isEmpty()) {
      return null;
    }
    return (Map.Entry)entrySet().asList().get(0);
  }
  
  public K firstKey()
  {
    return (K)keySet().first();
  }
  
  public Map.Entry<K, V> floorEntry(K paramK)
  {
    return headMap(paramK, true).lastEntry();
  }
  
  public K floorKey(K paramK)
  {
    return (K)Maps.keyOrNull(floorEntry(paramK));
  }
  
  public ImmutableSortedMap<K, V> headMap(K paramK)
  {
    return headMap(paramK, false);
  }
  
  public abstract ImmutableSortedMap<K, V> headMap(K paramK, boolean paramBoolean);
  
  public Map.Entry<K, V> higherEntry(K paramK)
  {
    return tailMap(paramK, false).firstEntry();
  }
  
  public K higherKey(K paramK)
  {
    return (K)Maps.keyOrNull(higherEntry(paramK));
  }
  
  boolean isPartialView()
  {
    return (keySet().isPartialView()) || (values().isPartialView());
  }
  
  public abstract ImmutableSortedSet<K> keySet();
  
  public Map.Entry<K, V> lastEntry()
  {
    if (isEmpty()) {
      return null;
    }
    return (Map.Entry)entrySet().asList().get(size() - 1);
  }
  
  public K lastKey()
  {
    return (K)keySet().last();
  }
  
  public Map.Entry<K, V> lowerEntry(K paramK)
  {
    return headMap(paramK, false).lastEntry();
  }
  
  public K lowerKey(K paramK)
  {
    return (K)Maps.keyOrNull(lowerEntry(paramK));
  }
  
  public ImmutableSortedSet<K> navigableKeySet()
  {
    return keySet();
  }
  
  @Deprecated
  public final Map.Entry<K, V> pollFirstEntry()
  {
    throw new UnsupportedOperationException();
  }
  
  @Deprecated
  public final Map.Entry<K, V> pollLastEntry()
  {
    throw new UnsupportedOperationException();
  }
  
  public int size()
  {
    return values().size();
  }
  
  public ImmutableSortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }
  
  public ImmutableSortedMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    Preconditions.checkNotNull(paramK1);
    Preconditions.checkNotNull(paramK2);
    if (comparator().compare(paramK1, paramK2) <= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "expected fromKey <= toKey but %s > %s", new Object[] { paramK1, paramK2 });
      return headMap(paramK2, paramBoolean2).tailMap(paramK1, paramBoolean1);
    }
  }
  
  public ImmutableSortedMap<K, V> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }
  
  public abstract ImmutableSortedMap<K, V> tailMap(K paramK, boolean paramBoolean);
  
  public abstract ImmutableCollection<V> values();
  
  Object writeReplace()
  {
    return new SerializedForm(this);
  }
  
  public static class Builder<K, V>
    extends ImmutableMap.Builder<K, V>
  {
    private final Comparator<? super K> comparator;
    
    public Builder(Comparator<? super K> paramComparator)
    {
      comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    }
    
    public ImmutableSortedMap<K, V> build()
    {
      return ImmutableSortedMap.fromEntries(comparator, false, size, entries);
    }
    
    public Builder<K, V> put(K paramK, V paramV)
    {
      super.put(paramK, paramV);
      return this;
    }
    
    public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
    {
      super.put(paramEntry);
      return this;
    }
    
    public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
    {
      super.putAll(paramMap);
      return this;
    }
  }
  
  private static class SerializedForm
    extends ImmutableMap.SerializedForm
  {
    private static final long serialVersionUID = 0L;
    private final Comparator<Object> comparator;
    
    SerializedForm(ImmutableSortedMap<?, ?> paramImmutableSortedMap)
    {
      super();
      comparator = paramImmutableSortedMap.comparator();
    }
    
    Object readResolve()
    {
      return createMap(new ImmutableSortedMap.Builder(comparator));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */