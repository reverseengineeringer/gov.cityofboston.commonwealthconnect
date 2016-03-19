package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;
import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import javax.annotation.Nullable;

@VisibleForTesting
final class LinkedHashMultimap$ValueSet
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
  
  LinkedHashMultimap$ValueSet(K paramK, int paramInt)
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
    LinkedHashMultimap.access$200(lastEntry, paramV);
    LinkedHashMultimap.access$200(paramV, this);
    LinkedHashMultimap.access$400(LinkedHashMultimap.access$300(this$0).getPredecessorInMultimap(), paramV);
    LinkedHashMultimap.access$400(paramV, LinkedHashMultimap.access$300(this$0));
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
      LinkedHashMultimap.access$600((LinkedHashMultimap.ValueEntry)localValueSetLink);
    }
    LinkedHashMultimap.access$200(this, this);
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
          LinkedHashMultimap.access$500(localValueEntry);
          LinkedHashMultimap.access$600(localValueEntry);
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

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedHashMultimap.ValueSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */