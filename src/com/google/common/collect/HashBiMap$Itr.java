package com.google.common.collect;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

abstract class HashBiMap$Itr<T>
  implements Iterator<T>
{
  int expectedModCount = HashBiMap.access$000(this$0);
  HashBiMap.BiEntry<K, V> next = null;
  int nextBucket = 0;
  HashBiMap.BiEntry<K, V> toRemove = null;
  
  HashBiMap$Itr(HashBiMap paramHashBiMap) {}
  
  private void checkForConcurrentModification()
  {
    if (HashBiMap.access$000(this$0) != expectedModCount) {
      throw new ConcurrentModificationException();
    }
  }
  
  public boolean hasNext()
  {
    checkForConcurrentModification();
    if (next != null) {
      return true;
    }
    do
    {
      nextBucket += 1;
      if (nextBucket >= HashBiMap.access$100(this$0).length) {
        break;
      }
    } while (HashBiMap.access$100(this$0)[nextBucket] == null);
    HashBiMap.BiEntry[] arrayOfBiEntry = HashBiMap.access$100(this$0);
    int i = nextBucket;
    nextBucket = (i + 1);
    next = arrayOfBiEntry[i];
    return true;
    return false;
  }
  
  public T next()
  {
    checkForConcurrentModification();
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    HashBiMap.BiEntry localBiEntry = next;
    next = nextInKToVBucket;
    toRemove = localBiEntry;
    return (T)output(localBiEntry);
  }
  
  abstract T output(HashBiMap.BiEntry<K, V> paramBiEntry);
  
  public void remove()
  {
    checkForConcurrentModification();
    if (toRemove != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      HashBiMap.access$200(this$0, toRemove);
      expectedModCount = HashBiMap.access$000(this$0);
      toRemove = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.HashBiMap.Itr
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */