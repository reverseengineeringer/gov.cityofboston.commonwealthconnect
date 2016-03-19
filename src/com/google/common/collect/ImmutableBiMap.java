package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableBiMap<K, V>
  extends ImmutableMap<K, V>
  implements BiMap<K, V>
{
  private static final Map.Entry<?, ?>[] EMPTY_ENTRY_ARRAY = new Map.Entry[0];
  
  public static <K, V> Builder<K, V> builder()
  {
    return new Builder();
  }
  
  public static <K, V> ImmutableBiMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap)
  {
    if ((paramMap instanceof ImmutableBiMap))
    {
      ImmutableBiMap localImmutableBiMap = (ImmutableBiMap)paramMap;
      if (!localImmutableBiMap.isPartialView()) {
        return localImmutableBiMap;
      }
    }
    paramMap = (Map.Entry[])paramMap.entrySet().toArray(EMPTY_ENTRY_ARRAY);
    switch (paramMap.length)
    {
    default: 
      return new RegularImmutableBiMap(paramMap);
    case 0: 
      return of();
    }
    paramMap = paramMap[0];
    return of(paramMap.getKey(), paramMap.getValue());
  }
  
  public static <K, V> ImmutableBiMap<K, V> of()
  {
    return EmptyImmutableBiMap.INSTANCE;
  }
  
  public static <K, V> ImmutableBiMap<K, V> of(K paramK, V paramV)
  {
    return new SingletonImmutableBiMap(paramK, paramV);
  }
  
  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    return new RegularImmutableBiMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2) });
  }
  
  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    return new RegularImmutableBiMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3) });
  }
  
  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    return new RegularImmutableBiMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3), entryOf(paramK4, paramV4) });
  }
  
  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    return new RegularImmutableBiMap(new ImmutableMapEntry.TerminalEntry[] { entryOf(paramK1, paramV1), entryOf(paramK2, paramV2), entryOf(paramK3, paramV3), entryOf(paramK4, paramV4), entryOf(paramK5, paramV5) });
  }
  
  @Deprecated
  public V forcePut(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public abstract ImmutableBiMap<V, K> inverse();
  
  public ImmutableSet<V> values()
  {
    return inverse().keySet();
  }
  
  Object writeReplace()
  {
    return new SerializedForm(this);
  }
  
  public static final class Builder<K, V>
    extends ImmutableMap.Builder<K, V>
  {
    public ImmutableBiMap<K, V> build()
    {
      switch (size)
      {
      default: 
        return new RegularImmutableBiMap(size, entries);
      case 0: 
        return ImmutableBiMap.of();
      }
      return ImmutableBiMap.of(entries[0].getKey(), entries[0].getValue());
    }
    
    public Builder<K, V> put(K paramK, V paramV)
    {
      super.put(paramK, paramV);
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
    
    SerializedForm(ImmutableBiMap<?, ?> paramImmutableBiMap)
    {
      super();
    }
    
    Object readResolve()
    {
      return createMap(new ImmutableBiMap.Builder());
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */