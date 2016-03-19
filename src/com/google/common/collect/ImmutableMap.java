package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableMap<K, V>
  implements Map<K, V>, Serializable
{
  private static final Map.Entry<?, ?>[] EMPTY_ENTRY_ARRAY = new Map.Entry[0];
  private transient ImmutableSet<Map.Entry<K, V>> entrySet;
  private transient ImmutableSet<K> keySet;
  private transient ImmutableSetMultimap<K, V> multimapView;
  private transient ImmutableCollection<V> values;
  
  public static <K, V> Builder<K, V> builder()
  {
    return new Builder();
  }
  
  static void checkNoConflict(boolean paramBoolean, String paramString, Map.Entry<?, ?> paramEntry1, Map.Entry<?, ?> paramEntry2)
  {
    if (!paramBoolean) {
      throw new IllegalArgumentException("Multiple entries with same " + paramString + ": " + paramEntry1 + " and " + paramEntry2);
    }
  }
  
  public static <K, V> ImmutableMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap)
  {
    if (((paramMap instanceof ImmutableMap)) && (!(paramMap instanceof ImmutableSortedMap)))
    {
      ImmutableMap localImmutableMap = (ImmutableMap)paramMap;
      if (!localImmutableMap.isPartialView()) {
        return localImmutableMap;
      }
    }
    else if ((paramMap instanceof EnumMap))
    {
      return copyOfEnumMapUnsafe(paramMap);
    }
    paramMap = (Map.Entry[])paramMap.entrySet().toArray(EMPTY_ENTRY_ARRAY);
    switch (paramMap.length)
    {
    default: 
      return new RegularImmutableMap(paramMap);
    case 0: 
      return of();
    }
    paramMap = paramMap[0];
    return of(paramMap.getKey(), paramMap.getValue());
  }
  
  private static <K extends Enum<K>, V> ImmutableMap<K, V> copyOfEnumMap(Map<K, ? extends V> paramMap)
  {
    paramMap = new EnumMap(paramMap);
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      CollectPreconditions.checkEntryNotNull(localEntry.getKey(), localEntry.getValue());
    }
    return ImmutableEnumMap.asImmutable(paramMap);
  }
  
  private static <K, V> ImmutableMap<K, V> copyOfEnumMapUnsafe(Map<? extends K, ? extends V> paramMap)
  {
    return copyOfEnumMap((EnumMap)paramMap);
  }
  
  private ImmutableSetMultimap<K, V> createMultimapView()
  {
    ImmutableMap localImmutableMap = viewMapValuesAsSingletonSets();
    return new ImmutableSetMultimap(localImmutableMap, localImmutableMap.size(), null);
  }
  
  static <K, V> ImmutableMapEntry.TerminalEntry<K, V> entryOf(K paramK, V paramV)
  {
    CollectPreconditions.checkEntryNotNull(paramK, paramV);
    return new ImmutableMapEntry.TerminalEntry(paramK, paramV);
  }
  
  public static <K, V> ImmutableMap<K, V> of()
  {
    return ImmutableBiMap.of();
  }
  
  public static <K, V> ImmutableMap<K, V> of(K paramK, V paramV)
  {
    return ImmutableBiMap.of(paramK, paramV);
  }
  
  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    return new RegularImmutableMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2) });
  }
  
  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    return new RegularImmutableMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3) });
  }
  
  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    return new RegularImmutableMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3), entryOf(paramK4, paramV4) });
  }
  
  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    return new RegularImmutableMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3), entryOf(paramK4, paramV4), entryOf(paramK5, paramV5) });
  }
  
  private ImmutableMap<K, ImmutableSet<V>> viewMapValuesAsSingletonSets()
  {
    return new MapViewOfValuesAsSingletonSets(this);
  }
  
  @Beta
  public ImmutableSetMultimap<K, V> asMultimap()
  {
    ImmutableSetMultimap localImmutableSetMultimap2 = multimapView;
    ImmutableSetMultimap localImmutableSetMultimap1 = localImmutableSetMultimap2;
    if (localImmutableSetMultimap2 == null)
    {
      localImmutableSetMultimap1 = createMultimapView();
      multimapView = localImmutableSetMultimap1;
    }
    return localImmutableSetMultimap1;
  }
  
  @Deprecated
  public final void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return get(paramObject) != null;
  }
  
  public boolean containsValue(@Nullable Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  abstract ImmutableSet<Map.Entry<K, V>> createEntrySet();
  
  ImmutableSet<K> createKeySet()
  {
    return new ImmutableMapKeySet(this);
  }
  
  public ImmutableSet<Map.Entry<K, V>> entrySet()
  {
    ImmutableSet localImmutableSet2 = entrySet;
    ImmutableSet localImmutableSet1 = localImmutableSet2;
    if (localImmutableSet2 == null)
    {
      localImmutableSet1 = createEntrySet();
      entrySet = localImmutableSet1;
    }
    return localImmutableSet1;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return Maps.equalsImpl(this, paramObject);
  }
  
  public abstract V get(@Nullable Object paramObject);
  
  public int hashCode()
  {
    return entrySet().hashCode();
  }
  
  public boolean isEmpty()
  {
    return size() == 0;
  }
  
  abstract boolean isPartialView();
  
  public ImmutableSet<K> keySet()
  {
    ImmutableSet localImmutableSet2 = keySet;
    ImmutableSet localImmutableSet1 = localImmutableSet2;
    if (localImmutableSet2 == null)
    {
      localImmutableSet1 = createKeySet();
      keySet = localImmutableSet1;
    }
    return localImmutableSet1;
  }
  
  @Deprecated
  public final V put(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  @Deprecated
  public final void putAll(Map<? extends K, ? extends V> paramMap)
  {
    throw new UnsupportedOperationException();
  }
  
  @Deprecated
  public final V remove(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public String toString()
  {
    return Maps.toStringImpl(this);
  }
  
  public ImmutableCollection<V> values()
  {
    ImmutableCollection localImmutableCollection = values;
    Object localObject = localImmutableCollection;
    if (localImmutableCollection == null)
    {
      localObject = new ImmutableMapValues(this);
      values = ((ImmutableCollection)localObject);
    }
    return (ImmutableCollection<V>)localObject;
  }
  
  Object writeReplace()
  {
    return new SerializedForm(this);
  }
  
  public static class Builder<K, V>
  {
    ImmutableMapEntry.TerminalEntry<K, V>[] entries;
    int size;
    
    public Builder()
    {
      this(4);
    }
    
    Builder(int paramInt)
    {
      entries = new ImmutableMapEntry.TerminalEntry[paramInt];
      size = 0;
    }
    
    private void ensureCapacity(int paramInt)
    {
      if (paramInt > entries.length) {
        entries = ((ImmutableMapEntry.TerminalEntry[])ObjectArrays.arraysCopyOf(entries, ImmutableCollection.Builder.expandedCapacity(entries.length, paramInt)));
      }
    }
    
    public ImmutableMap<K, V> build()
    {
      switch (size)
      {
      default: 
        return new RegularImmutableMap(size, entries);
      case 0: 
        return ImmutableMap.of();
      }
      return ImmutableMap.of(entries[0].getKey(), entries[0].getValue());
    }
    
    public Builder<K, V> put(K paramK, V paramV)
    {
      ensureCapacity(size + 1);
      paramK = ImmutableMap.entryOf(paramK, paramV);
      paramV = entries;
      int i = size;
      size = (i + 1);
      paramV[i] = paramK;
      return this;
    }
    
    public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
    {
      return put(paramEntry.getKey(), paramEntry.getValue());
    }
    
    public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
    {
      ensureCapacity(size + paramMap.size());
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext()) {
        put((Map.Entry)paramMap.next());
      }
      return this;
    }
  }
  
  private static final class MapViewOfValuesAsSingletonSets<K, V>
    extends ImmutableMap<K, ImmutableSet<V>>
  {
    private final ImmutableMap<K, V> delegate;
    
    MapViewOfValuesAsSingletonSets(ImmutableMap<K, V> paramImmutableMap)
    {
      delegate = ((ImmutableMap)Preconditions.checkNotNull(paramImmutableMap));
    }
    
    public boolean containsKey(@Nullable Object paramObject)
    {
      return delegate.containsKey(paramObject);
    }
    
    ImmutableSet<Map.Entry<K, ImmutableSet<V>>> createEntrySet()
    {
      new ImmutableMapEntrySet()
      {
        public UnmodifiableIterator<Map.Entry<K, ImmutableSet<V>>> iterator()
        {
          new UnmodifiableIterator()
          {
            public boolean hasNext()
            {
              return val$backingIterator.hasNext();
            }
            
            public Map.Entry<K, ImmutableSet<V>> next()
            {
              new AbstractMapEntry()
              {
                public K getKey()
                {
                  return (K)val$backingEntry.getKey();
                }
                
                public ImmutableSet<V> getValue()
                {
                  return ImmutableSet.of(val$backingEntry.getValue());
                }
              };
            }
          };
        }
        
        ImmutableMap<K, ImmutableSet<V>> map()
        {
          return ImmutableMap.MapViewOfValuesAsSingletonSets.this;
        }
      };
    }
    
    public ImmutableSet<V> get(@Nullable Object paramObject)
    {
      paramObject = delegate.get(paramObject);
      if (paramObject == null) {
        return null;
      }
      return ImmutableSet.of(paramObject);
    }
    
    boolean isPartialView()
    {
      return false;
    }
    
    public int size()
    {
      return delegate.size();
    }
  }
  
  static class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Object[] keys;
    private final Object[] values;
    
    SerializedForm(ImmutableMap<?, ?> paramImmutableMap)
    {
      keys = new Object[paramImmutableMap.size()];
      values = new Object[paramImmutableMap.size()];
      int i = 0;
      paramImmutableMap = paramImmutableMap.entrySet().iterator();
      while (paramImmutableMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramImmutableMap.next();
        keys[i] = localEntry.getKey();
        values[i] = localEntry.getValue();
        i += 1;
      }
    }
    
    Object createMap(ImmutableMap.Builder<Object, Object> paramBuilder)
    {
      int i = 0;
      while (i < keys.length)
      {
        paramBuilder.put(keys[i], values[i]);
        i += 1;
      }
      return paramBuilder.build();
    }
    
    Object readResolve()
    {
      return createMap(new ImmutableMap.Builder());
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */