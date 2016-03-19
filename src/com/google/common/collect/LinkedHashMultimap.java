package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public final class LinkedHashMultimap<K, V>
  extends AbstractSetMultimap<K, V>
{
  private static final int DEFAULT_KEY_CAPACITY = 16;
  private static final int DEFAULT_VALUE_SET_CAPACITY = 2;
  @VisibleForTesting
  static final double VALUE_SET_LOAD_FACTOR = 1.0D;
  @GwtIncompatible("java serialization not supported")
  private static final long serialVersionUID = 1L;
  private transient ValueEntry<K, V> multimapHeaderEntry;
  @VisibleForTesting
  transient int valueSetCapacity = 2;
  
  private LinkedHashMultimap(int paramInt1, int paramInt2)
  {
    super(new LinkedHashMap(paramInt1));
    CollectPreconditions.checkNonnegative(paramInt2, "expectedValuesPerKey");
    valueSetCapacity = paramInt2;
    multimapHeaderEntry = new ValueEntry(null, null, 0, null);
    succeedsInMultimap(multimapHeaderEntry, multimapHeaderEntry);
  }
  
  public static <K, V> LinkedHashMultimap<K, V> create()
  {
    return new LinkedHashMultimap(16, 2);
  }
  
  public static <K, V> LinkedHashMultimap<K, V> create(int paramInt1, int paramInt2)
  {
    return new LinkedHashMultimap(Maps.capacity(paramInt1), Maps.capacity(paramInt2));
  }
  
  public static <K, V> LinkedHashMultimap<K, V> create(Multimap<? extends K, ? extends V> paramMultimap)
  {
    LinkedHashMultimap localLinkedHashMultimap = create(paramMultimap.keySet().size(), 2);
    localLinkedHashMultimap.putAll(paramMultimap);
    return localLinkedHashMultimap;
  }
  
  private static <K, V> void deleteFromMultimap(ValueEntry<K, V> paramValueEntry)
  {
    succeedsInMultimap(paramValueEntry.getPredecessorInMultimap(), paramValueEntry.getSuccessorInMultimap());
  }
  
  private static <K, V> void deleteFromValueSet(ValueSetLink<K, V> paramValueSetLink)
  {
    succeedsInValueSet(paramValueSetLink.getPredecessorInValueSet(), paramValueSetLink.getSuccessorInValueSet());
  }
  
  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    multimapHeaderEntry = new ValueEntry(null, null, 0, null);
    succeedsInMultimap(multimapHeaderEntry, multimapHeaderEntry);
    valueSetCapacity = paramObjectInputStream.readInt();
    int j = paramObjectInputStream.readInt();
    LinkedHashMap localLinkedHashMap = new LinkedHashMap(Maps.capacity(j));
    int i = 0;
    Object localObject1;
    while (i < j)
    {
      localObject1 = paramObjectInputStream.readObject();
      localLinkedHashMap.put(localObject1, createCollection(localObject1));
      i += 1;
    }
    j = paramObjectInputStream.readInt();
    i = 0;
    while (i < j)
    {
      localObject1 = paramObjectInputStream.readObject();
      Object localObject2 = paramObjectInputStream.readObject();
      ((Collection)localLinkedHashMap.get(localObject1)).add(localObject2);
      i += 1;
    }
    setMap(localLinkedHashMap);
  }
  
  private static <K, V> void succeedsInMultimap(ValueEntry<K, V> paramValueEntry1, ValueEntry<K, V> paramValueEntry2)
  {
    paramValueEntry1.setSuccessorInMultimap(paramValueEntry2);
    paramValueEntry2.setPredecessorInMultimap(paramValueEntry1);
  }
  
  private static <K, V> void succeedsInValueSet(ValueSetLink<K, V> paramValueSetLink1, ValueSetLink<K, V> paramValueSetLink2)
  {
    paramValueSetLink1.setSuccessorInValueSet(paramValueSetLink2);
    paramValueSetLink2.setPredecessorInValueSet(paramValueSetLink1);
  }
  
  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeInt(valueSetCapacity);
    paramObjectOutputStream.writeInt(keySet().size());
    Iterator localIterator = keySet().iterator();
    while (localIterator.hasNext()) {
      paramObjectOutputStream.writeObject(localIterator.next());
    }
    paramObjectOutputStream.writeInt(size());
    localIterator = entries().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      paramObjectOutputStream.writeObject(localEntry.getKey());
      paramObjectOutputStream.writeObject(localEntry.getValue());
    }
  }
  
  public void clear()
  {
    super.clear();
    succeedsInMultimap(multimapHeaderEntry, multimapHeaderEntry);
  }
  
  Collection<V> createCollection(K paramK)
  {
    return new ValueSet(paramK, valueSetCapacity);
  }
  
  Set<V> createCollection()
  {
    return new LinkedHashSet(valueSetCapacity);
  }
  
  public Set<Map.Entry<K, V>> entries()
  {
    return super.entries();
  }
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    new Iterator()
    {
      LinkedHashMultimap.ValueEntry<K, V> nextEntry = multimapHeaderEntry.successorInMultimap;
      LinkedHashMultimap.ValueEntry<K, V> toRemove;
      
      public boolean hasNext()
      {
        return nextEntry != multimapHeaderEntry;
      }
      
      public Map.Entry<K, V> next()
      {
        if (!hasNext()) {
          throw new NoSuchElementException();
        }
        LinkedHashMultimap.ValueEntry localValueEntry = nextEntry;
        toRemove = localValueEntry;
        nextEntry = nextEntry.successorInMultimap;
        return localValueEntry;
      }
      
      public void remove()
      {
        if (toRemove != null) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          remove(toRemove.getKey(), toRemove.getValue());
          toRemove = null;
          return;
        }
      }
    };
  }
  
  public Set<V> replaceValues(@Nullable K paramK, Iterable<? extends V> paramIterable)
  {
    return super.replaceValues(paramK, paramIterable);
  }
  
  Iterator<V> valueIterator()
  {
    return Maps.valueIterator(entryIterator());
  }
  
  public Collection<V> values()
  {
    return super.values();
  }
  
  @VisibleForTesting
  static final class ValueEntry<K, V>
    extends ImmutableEntry<K, V>
    implements LinkedHashMultimap.ValueSetLink<K, V>
  {
    @Nullable
    ValueEntry<K, V> nextInValueBucket;
    ValueEntry<K, V> predecessorInMultimap;
    LinkedHashMultimap.ValueSetLink<K, V> predecessorInValueSet;
    final int smearedValueHash;
    ValueEntry<K, V> successorInMultimap;
    LinkedHashMultimap.ValueSetLink<K, V> successorInValueSet;
    
    ValueEntry(@Nullable K paramK, @Nullable V paramV, int paramInt, @Nullable ValueEntry<K, V> paramValueEntry)
    {
      super(paramV);
      smearedValueHash = paramInt;
      nextInValueBucket = paramValueEntry;
    }
    
    public ValueEntry<K, V> getPredecessorInMultimap()
    {
      return predecessorInMultimap;
    }
    
    public LinkedHashMultimap.ValueSetLink<K, V> getPredecessorInValueSet()
    {
      return predecessorInValueSet;
    }
    
    public ValueEntry<K, V> getSuccessorInMultimap()
    {
      return successorInMultimap;
    }
    
    public LinkedHashMultimap.ValueSetLink<K, V> getSuccessorInValueSet()
    {
      return successorInValueSet;
    }
    
    boolean matchesValue(@Nullable Object paramObject, int paramInt)
    {
      return (smearedValueHash == paramInt) && (Objects.equal(getValue(), paramObject));
    }
    
    public void setPredecessorInMultimap(ValueEntry<K, V> paramValueEntry)
    {
      predecessorInMultimap = paramValueEntry;
    }
    
    public void setPredecessorInValueSet(LinkedHashMultimap.ValueSetLink<K, V> paramValueSetLink)
    {
      predecessorInValueSet = paramValueSetLink;
    }
    
    public void setSuccessorInMultimap(ValueEntry<K, V> paramValueEntry)
    {
      successorInMultimap = paramValueEntry;
    }
    
    public void setSuccessorInValueSet(LinkedHashMultimap.ValueSetLink<K, V> paramValueSetLink)
    {
      successorInValueSet = paramValueSetLink;
    }
  }
  
  @VisibleForTesting
  final class ValueSet
    extends Sets.ImprovedAbstractSet<V>
    implements LinkedHashMultimap.ValueSetLink<K, V>
  {
    private LinkedHashMultimap.ValueSetLink<K, V> firstEntry;
    @VisibleForTesting
    LinkedHashMultimap.ValueEntry<K, V>[] hashTable;
    private final K key;
    private LinkedHashMultimap.ValueSetLink<K, V> lastEntry;
    private int modCount = 0;
    private int size = 0;
    
    ValueSet(int paramInt)
    {
      key = paramInt;
      firstEntry = this;
      lastEntry = this;
      int i;
      hashTable = new LinkedHashMultimap.ValueEntry[Hashing.closedTableSize(i, 1.0D)];
    }
    
    private int mask()
    {
      return hashTable.length - 1;
    }
    
    private void rehashIfNecessary()
    {
      if (Hashing.needsResizing(size, hashTable.length, 1.0D))
      {
        LinkedHashMultimap.ValueEntry[] arrayOfValueEntry = new LinkedHashMultimap.ValueEntry[hashTable.length * 2];
        hashTable = arrayOfValueEntry;
        int i = arrayOfValueEntry.length;
        for (LinkedHashMultimap.ValueSetLink localValueSetLink = firstEntry; localValueSetLink != this; localValueSetLink = localValueSetLink.getSuccessorInValueSet())
        {
          LinkedHashMultimap.ValueEntry localValueEntry = (LinkedHashMultimap.ValueEntry)localValueSetLink;
          int j = smearedValueHash & i - 1;
          nextInValueBucket = arrayOfValueEntry[j];
          arrayOfValueEntry[j] = localValueEntry;
        }
      }
    }
    
    public boolean add(@Nullable V paramV)
    {
      int i = Hashing.smearedHash(paramV);
      int j = i & mask();
      LinkedHashMultimap.ValueEntry localValueEntry2 = hashTable[j];
      for (LinkedHashMultimap.ValueEntry localValueEntry1 = localValueEntry2; localValueEntry1 != null; localValueEntry1 = nextInValueBucket) {
        if (localValueEntry1.matchesValue(paramV, i)) {
          return false;
        }
      }
      paramV = new LinkedHashMultimap.ValueEntry(key, paramV, i, localValueEntry2);
      LinkedHashMultimap.succeedsInValueSet(lastEntry, paramV);
      LinkedHashMultimap.succeedsInValueSet(paramV, this);
      LinkedHashMultimap.succeedsInMultimap(multimapHeaderEntry.getPredecessorInMultimap(), paramV);
      LinkedHashMultimap.succeedsInMultimap(paramV, multimapHeaderEntry);
      hashTable[j] = paramV;
      size += 1;
      modCount += 1;
      rehashIfNecessary();
      return true;
    }
    
    public void clear()
    {
      Arrays.fill(hashTable, null);
      size = 0;
      for (LinkedHashMultimap.ValueSetLink localValueSetLink = firstEntry; localValueSetLink != this; localValueSetLink = localValueSetLink.getSuccessorInValueSet()) {
        LinkedHashMultimap.deleteFromMultimap((LinkedHashMultimap.ValueEntry)localValueSetLink);
      }
      LinkedHashMultimap.succeedsInValueSet(this, this);
      modCount += 1;
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      int i = Hashing.smearedHash(paramObject);
      for (LinkedHashMultimap.ValueEntry localValueEntry = hashTable[(mask() & i)]; localValueEntry != null; localValueEntry = nextInValueBucket) {
        if (localValueEntry.matchesValue(paramObject, i)) {
          return true;
        }
      }
      return false;
    }
    
    public LinkedHashMultimap.ValueSetLink<K, V> getPredecessorInValueSet()
    {
      return lastEntry;
    }
    
    public LinkedHashMultimap.ValueSetLink<K, V> getSuccessorInValueSet()
    {
      return firstEntry;
    }
    
    public Iterator<V> iterator()
    {
      new Iterator()
      {
        int expectedModCount = modCount;
        LinkedHashMultimap.ValueSetLink<K, V> nextEntry = firstEntry;
        LinkedHashMultimap.ValueEntry<K, V> toRemove;
        
        private void checkForComodification()
        {
          if (modCount != expectedModCount) {
            throw new ConcurrentModificationException();
          }
        }
        
        public boolean hasNext()
        {
          checkForComodification();
          return nextEntry != LinkedHashMultimap.ValueSet.this;
        }
        
        public V next()
        {
          if (!hasNext()) {
            throw new NoSuchElementException();
          }
          LinkedHashMultimap.ValueEntry localValueEntry = (LinkedHashMultimap.ValueEntry)nextEntry;
          Object localObject = localValueEntry.getValue();
          toRemove = localValueEntry;
          nextEntry = localValueEntry.getSuccessorInValueSet();
          return (V)localObject;
        }
        
        public void remove()
        {
          checkForComodification();
          if (toRemove != null) {}
          for (boolean bool = true;; bool = false)
          {
            CollectPreconditions.checkRemove(bool);
            remove(toRemove.getValue());
            expectedModCount = modCount;
            toRemove = null;
            return;
          }
        }
      };
    }
    
    public boolean remove(@Nullable Object paramObject)
    {
      int i = Hashing.smearedHash(paramObject);
      int j = i & mask();
      Object localObject = null;
      for (LinkedHashMultimap.ValueEntry localValueEntry = hashTable[j]; localValueEntry != null; localValueEntry = nextInValueBucket)
      {
        if (localValueEntry.matchesValue(paramObject, i))
        {
          if (localObject == null) {
            hashTable[j] = nextInValueBucket;
          }
          for (;;)
          {
            LinkedHashMultimap.deleteFromValueSet(localValueEntry);
            LinkedHashMultimap.deleteFromMultimap(localValueEntry);
            size -= 1;
            modCount += 1;
            return true;
            nextInValueBucket = nextInValueBucket;
          }
        }
        localObject = localValueEntry;
      }
      return false;
    }
    
    public void setPredecessorInValueSet(LinkedHashMultimap.ValueSetLink<K, V> paramValueSetLink)
    {
      lastEntry = paramValueSetLink;
    }
    
    public void setSuccessorInValueSet(LinkedHashMultimap.ValueSetLink<K, V> paramValueSetLink)
    {
      firstEntry = paramValueSetLink;
    }
    
    public int size()
    {
      return size;
    }
  }
  
  private static abstract interface ValueSetLink<K, V>
  {
    public abstract ValueSetLink<K, V> getPredecessorInValueSet();
    
    public abstract ValueSetLink<K, V> getSuccessorInValueSet();
    
    public abstract void setPredecessorInValueSet(ValueSetLink<K, V> paramValueSetLink);
    
    public abstract void setSuccessorInValueSet(ValueSetLink<K, V> paramValueSetLink);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedHashMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */