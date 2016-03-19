package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class RegularImmutableMap<K, V>
  extends ImmutableMap<K, V>
{
  private static final double MAX_LOAD_FACTOR = 1.2D;
  private static final long serialVersionUID = 0L;
  private final transient ImmutableMapEntry<K, V>[] entries;
  private final transient int mask;
  private final transient ImmutableMapEntry<K, V>[] table;
  
  RegularImmutableMap(int paramInt, ImmutableMapEntry.TerminalEntry<?, ?>[] paramArrayOfTerminalEntry)
  {
    entries = createEntryArray(paramInt);
    int i = Hashing.closedTableSize(paramInt, 1.2D);
    table = createEntryArray(i);
    mask = (i - 1);
    i = 0;
    if (i < paramInt)
    {
      Object localObject1 = paramArrayOfTerminalEntry[i];
      Object localObject2 = ((ImmutableMapEntry.TerminalEntry)localObject1).getKey();
      int j = Hashing.smear(localObject2.hashCode()) & mask;
      ImmutableMapEntry localImmutableMapEntry = table[j];
      if (localImmutableMapEntry == null) {}
      for (;;)
      {
        table[j] = localObject1;
        entries[i] = localObject1;
        checkNoConflictInBucket(localObject2, (ImmutableMapEntry)localObject1, localImmutableMapEntry);
        i += 1;
        break;
        localObject1 = new NonTerminalMapEntry((ImmutableMapEntry)localObject1, localImmutableMapEntry);
      }
    }
  }
  
  RegularImmutableMap(ImmutableMapEntry.TerminalEntry<?, ?>... paramVarArgs)
  {
    this(paramVarArgs.length, paramVarArgs);
  }
  
  RegularImmutableMap(Map.Entry<?, ?>[] paramArrayOfEntry)
  {
    int j = paramArrayOfEntry.length;
    entries = createEntryArray(j);
    int i = Hashing.closedTableSize(j, 1.2D);
    table = createEntryArray(i);
    mask = (i - 1);
    i = 0;
    if (i < j)
    {
      Object localObject1 = paramArrayOfEntry[i];
      Object localObject2 = ((Map.Entry)localObject1).getKey();
      localObject1 = ((Map.Entry)localObject1).getValue();
      CollectPreconditions.checkEntryNotNull(localObject2, localObject1);
      int k = Hashing.smear(localObject2.hashCode()) & mask;
      ImmutableMapEntry localImmutableMapEntry = table[k];
      if (localImmutableMapEntry == null) {}
      for (localObject1 = new ImmutableMapEntry.TerminalEntry(localObject2, localObject1);; localObject1 = new NonTerminalMapEntry(localObject2, localObject1, localImmutableMapEntry))
      {
        table[k] = localObject1;
        entries[i] = localObject1;
        checkNoConflictInBucket(localObject2, (ImmutableMapEntry)localObject1, localImmutableMapEntry);
        i += 1;
        break;
      }
    }
  }
  
  private void checkNoConflictInBucket(K paramK, ImmutableMapEntry<K, V> paramImmutableMapEntry1, ImmutableMapEntry<K, V> paramImmutableMapEntry2)
  {
    if (paramImmutableMapEntry2 != null)
    {
      if (!paramK.equals(paramImmutableMapEntry2.getKey())) {}
      for (boolean bool = true;; bool = false)
      {
        checkNoConflict(bool, "key", paramImmutableMapEntry1, paramImmutableMapEntry2);
        paramImmutableMapEntry2 = paramImmutableMapEntry2.getNextInKeyBucket();
        break;
      }
    }
  }
  
  private ImmutableMapEntry<K, V>[] createEntryArray(int paramInt)
  {
    return new ImmutableMapEntry[paramInt];
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    return new EntrySet(null);
  }
  
  public V get(@Nullable Object paramObject)
  {
    if (paramObject == null) {}
    for (;;)
    {
      return null;
      int i = Hashing.smear(paramObject.hashCode());
      int j = mask;
      for (ImmutableMapEntry localImmutableMapEntry = table[(i & j)]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInKeyBucket()) {
        if (paramObject.equals(localImmutableMapEntry.getKey())) {
          return (V)localImmutableMapEntry.getValue();
        }
      }
    }
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int size()
  {
    return entries.length;
  }
  
  private class EntrySet
    extends ImmutableMapEntrySet<K, V>
  {
    private EntrySet() {}
    
    ImmutableList<Map.Entry<K, V>> createAsList()
    {
      return new RegularImmutableAsList(this, entries);
    }
    
    public UnmodifiableIterator<Map.Entry<K, V>> iterator()
    {
      return asList().iterator();
    }
    
    ImmutableMap<K, V> map()
    {
      return RegularImmutableMap.this;
    }
  }
  
  private static final class NonTerminalMapEntry<K, V>
    extends ImmutableMapEntry<K, V>
  {
    private final ImmutableMapEntry<K, V> nextInKeyBucket;
    
    NonTerminalMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry1, ImmutableMapEntry<K, V> paramImmutableMapEntry2)
    {
      super();
      nextInKeyBucket = paramImmutableMapEntry2;
    }
    
    NonTerminalMapEntry(K paramK, V paramV, ImmutableMapEntry<K, V> paramImmutableMapEntry)
    {
      super(paramV);
      nextInKeyBucket = paramImmutableMapEntry;
    }
    
    ImmutableMapEntry<K, V> getNextInKeyBucket()
    {
      return nextInKeyBucket;
    }
    
    @Nullable
    ImmutableMapEntry<K, V> getNextInValueBucket()
    {
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */