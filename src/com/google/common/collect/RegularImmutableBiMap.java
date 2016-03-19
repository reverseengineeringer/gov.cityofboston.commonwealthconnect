package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
class RegularImmutableBiMap<K, V>
  extends ImmutableBiMap<K, V>
{
  static final double MAX_LOAD_FACTOR = 1.2D;
  private final transient ImmutableMapEntry<K, V>[] entries;
  private final transient int hashCode;
  private transient ImmutableBiMap<V, K> inverse;
  private final transient ImmutableMapEntry<K, V>[] keyTable;
  private final transient int mask;
  private final transient ImmutableMapEntry<K, V>[] valueTable;
  
  RegularImmutableBiMap(int paramInt, ImmutableMapEntry.TerminalEntry<?, ?>[] paramArrayOfTerminalEntry)
  {
    int i = Hashing.closedTableSize(paramInt, 1.2D);
    mask = (i - 1);
    ImmutableMapEntry[] arrayOfImmutableMapEntry1 = createEntryArray(i);
    ImmutableMapEntry[] arrayOfImmutableMapEntry2 = createEntryArray(i);
    ImmutableMapEntry[] arrayOfImmutableMapEntry3 = createEntryArray(paramInt);
    int j = 0;
    i = 0;
    if (i < paramInt)
    {
      ImmutableMapEntry.TerminalEntry<?, ?> localTerminalEntry = paramArrayOfTerminalEntry[i];
      Object localObject2 = localTerminalEntry.getKey();
      Object localObject3 = localTerminalEntry.getValue();
      int k = localObject2.hashCode();
      int m = localObject3.hashCode();
      int n = Hashing.smear(k) & mask;
      int i1 = Hashing.smear(m) & mask;
      ImmutableMapEntry localImmutableMapEntry = arrayOfImmutableMapEntry1[n];
      Object localObject1 = localImmutableMapEntry;
      boolean bool;
      if (localObject1 != null)
      {
        if (!localObject2.equals(((ImmutableMapEntry)localObject1).getKey())) {}
        for (bool = true;; bool = false)
        {
          checkNoConflict(bool, "key", localTerminalEntry, (Map.Entry)localObject1);
          localObject1 = ((ImmutableMapEntry)localObject1).getNextInKeyBucket();
          break;
        }
      }
      localObject2 = arrayOfImmutableMapEntry2[i1];
      localObject1 = localObject2;
      if (localObject1 != null)
      {
        if (!localObject3.equals(((ImmutableMapEntry)localObject1).getValue())) {}
        for (bool = true;; bool = false)
        {
          checkNoConflict(bool, "value", localTerminalEntry, (Map.Entry)localObject1);
          localObject1 = ((ImmutableMapEntry)localObject1).getNextInValueBucket();
          break;
        }
      }
      if ((localImmutableMapEntry == null) && (localObject2 == null)) {}
      for (localObject1 = localTerminalEntry;; localObject1 = new NonTerminalBiMapEntry(localTerminalEntry, localImmutableMapEntry, (ImmutableMapEntry)localObject2))
      {
        arrayOfImmutableMapEntry1[n] = localObject1;
        arrayOfImmutableMapEntry2[i1] = localObject1;
        arrayOfImmutableMapEntry3[i] = localObject1;
        j += (k ^ m);
        i += 1;
        break;
      }
    }
    keyTable = arrayOfImmutableMapEntry1;
    valueTable = arrayOfImmutableMapEntry2;
    entries = arrayOfImmutableMapEntry3;
    hashCode = j;
  }
  
  RegularImmutableBiMap(ImmutableMapEntry.TerminalEntry<?, ?>... paramVarArgs)
  {
    this(paramVarArgs.length, paramVarArgs);
  }
  
  RegularImmutableBiMap(Map.Entry<?, ?>[] paramArrayOfEntry)
  {
    int k = paramArrayOfEntry.length;
    int i = Hashing.closedTableSize(k, 1.2D);
    mask = (i - 1);
    ImmutableMapEntry[] arrayOfImmutableMapEntry1 = createEntryArray(i);
    ImmutableMapEntry[] arrayOfImmutableMapEntry2 = createEntryArray(i);
    ImmutableMapEntry[] arrayOfImmutableMapEntry3 = createEntryArray(k);
    int j = 0;
    i = 0;
    if (i < k)
    {
      Map.Entry<?, ?> localEntry = paramArrayOfEntry[i];
      Object localObject2 = localEntry.getKey();
      Object localObject3 = localEntry.getValue();
      CollectPreconditions.checkEntryNotNull(localObject2, localObject3);
      int m = localObject2.hashCode();
      int n = localObject3.hashCode();
      int i1 = Hashing.smear(m) & mask;
      int i2 = Hashing.smear(n) & mask;
      ImmutableMapEntry localImmutableMapEntry1 = arrayOfImmutableMapEntry1[i1];
      Object localObject1 = localImmutableMapEntry1;
      boolean bool;
      if (localObject1 != null)
      {
        if (!localObject2.equals(((ImmutableMapEntry)localObject1).getKey())) {}
        for (bool = true;; bool = false)
        {
          checkNoConflict(bool, "key", localEntry, (Map.Entry)localObject1);
          localObject1 = ((ImmutableMapEntry)localObject1).getNextInKeyBucket();
          break;
        }
      }
      ImmutableMapEntry localImmutableMapEntry2 = arrayOfImmutableMapEntry2[i2];
      localObject1 = localImmutableMapEntry2;
      if (localObject1 != null)
      {
        if (!localObject3.equals(((ImmutableMapEntry)localObject1).getValue())) {}
        for (bool = true;; bool = false)
        {
          checkNoConflict(bool, "value", localEntry, (Map.Entry)localObject1);
          localObject1 = ((ImmutableMapEntry)localObject1).getNextInValueBucket();
          break;
        }
      }
      if ((localImmutableMapEntry1 == null) && (localImmutableMapEntry2 == null)) {}
      for (localObject1 = new ImmutableMapEntry.TerminalEntry(localObject2, localObject3);; localObject1 = new NonTerminalBiMapEntry(localObject2, localObject3, localImmutableMapEntry1, localImmutableMapEntry2))
      {
        arrayOfImmutableMapEntry1[i1] = localObject1;
        arrayOfImmutableMapEntry2[i2] = localObject1;
        arrayOfImmutableMapEntry3[i] = localObject1;
        j += (m ^ n);
        i += 1;
        break;
      }
    }
    keyTable = arrayOfImmutableMapEntry1;
    valueTable = arrayOfImmutableMapEntry2;
    entries = arrayOfImmutableMapEntry3;
    hashCode = j;
  }
  
  private static <K, V> ImmutableMapEntry<K, V>[] createEntryArray(int paramInt)
  {
    return new ImmutableMapEntry[paramInt];
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    new ImmutableMapEntrySet()
    {
      ImmutableList<Map.Entry<K, V>> createAsList()
      {
        return new RegularImmutableAsList(this, entries);
      }
      
      public int hashCode()
      {
        return hashCode;
      }
      
      boolean isHashCodeFast()
      {
        return true;
      }
      
      public UnmodifiableIterator<Map.Entry<K, V>> iterator()
      {
        return asList().iterator();
      }
      
      ImmutableMap<K, V> map()
      {
        return RegularImmutableBiMap.this;
      }
    };
  }
  
  @Nullable
  public V get(@Nullable Object paramObject)
  {
    if (paramObject == null) {}
    for (;;)
    {
      return null;
      int i = Hashing.smear(paramObject.hashCode());
      int j = mask;
      for (ImmutableMapEntry localImmutableMapEntry = keyTable[(i & j)]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInKeyBucket()) {
        if (paramObject.equals(localImmutableMapEntry.getKey())) {
          return (V)localImmutableMapEntry.getValue();
        }
      }
    }
  }
  
  public ImmutableBiMap<V, K> inverse()
  {
    ImmutableBiMap localImmutableBiMap = inverse;
    Object localObject = localImmutableBiMap;
    if (localImmutableBiMap == null)
    {
      localObject = new Inverse(null);
      inverse = ((ImmutableBiMap)localObject);
    }
    return (ImmutableBiMap<V, K>)localObject;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int size()
  {
    return entries.length;
  }
  
  private final class Inverse
    extends ImmutableBiMap<V, K>
  {
    private Inverse() {}
    
    ImmutableSet<Map.Entry<V, K>> createEntrySet()
    {
      return new InverseEntrySet();
    }
    
    public K get(@Nullable Object paramObject)
    {
      if (paramObject == null) {}
      for (;;)
      {
        return null;
        int i = Hashing.smear(paramObject.hashCode());
        int j = mask;
        for (ImmutableMapEntry localImmutableMapEntry = valueTable[(i & j)]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInValueBucket()) {
          if (paramObject.equals(localImmutableMapEntry.getValue())) {
            return (K)localImmutableMapEntry.getKey();
          }
        }
      }
    }
    
    public ImmutableBiMap<K, V> inverse()
    {
      return RegularImmutableBiMap.this;
    }
    
    boolean isPartialView()
    {
      return false;
    }
    
    public int size()
    {
      return inverse().size();
    }
    
    Object writeReplace()
    {
      return new RegularImmutableBiMap.InverseSerializedForm(RegularImmutableBiMap.this);
    }
    
    final class InverseEntrySet
      extends ImmutableMapEntrySet<V, K>
    {
      InverseEntrySet() {}
      
      ImmutableList<Map.Entry<V, K>> createAsList()
      {
        new ImmutableAsList()
        {
          ImmutableCollection<Map.Entry<V, K>> delegateCollection()
          {
            return RegularImmutableBiMap.Inverse.InverseEntrySet.this;
          }
          
          public Map.Entry<V, K> get(int paramAnonymousInt)
          {
            ImmutableMapEntry localImmutableMapEntry = entries[paramAnonymousInt];
            return Maps.immutableEntry(localImmutableMapEntry.getValue(), localImmutableMapEntry.getKey());
          }
        };
      }
      
      public int hashCode()
      {
        return hashCode;
      }
      
      boolean isHashCodeFast()
      {
        return true;
      }
      
      public UnmodifiableIterator<Map.Entry<V, K>> iterator()
      {
        return asList().iterator();
      }
      
      ImmutableMap<V, K> map()
      {
        return RegularImmutableBiMap.Inverse.this;
      }
    }
  }
  
  private static class InverseSerializedForm<K, V>
    implements Serializable
  {
    private static final long serialVersionUID = 1L;
    private final ImmutableBiMap<K, V> forward;
    
    InverseSerializedForm(ImmutableBiMap<K, V> paramImmutableBiMap)
    {
      forward = paramImmutableBiMap;
    }
    
    Object readResolve()
    {
      return forward.inverse();
    }
  }
  
  private static final class NonTerminalBiMapEntry<K, V>
    extends ImmutableMapEntry<K, V>
  {
    @Nullable
    private final ImmutableMapEntry<K, V> nextInKeyBucket;
    @Nullable
    private final ImmutableMapEntry<K, V> nextInValueBucket;
    
    NonTerminalBiMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry1, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry2, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry3)
    {
      super();
      nextInKeyBucket = paramImmutableMapEntry2;
      nextInValueBucket = paramImmutableMapEntry3;
    }
    
    NonTerminalBiMapEntry(K paramK, V paramV, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry1, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry2)
    {
      super(paramV);
      nextInKeyBucket = paramImmutableMapEntry1;
      nextInValueBucket = paramImmutableMapEntry2;
    }
    
    @Nullable
    ImmutableMapEntry<K, V> getNextInKeyBucket()
    {
      return nextInKeyBucket;
    }
    
    @Nullable
    ImmutableMapEntry<K, V> getNextInValueBucket()
    {
      return nextInValueBucket;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */