package com.google.common.cache;

import com.google.common.base.Preconditions;
import com.google.common.base.Ticker;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.atomic.AtomicReferenceArray;

abstract class LocalCache$HashIterator<T>
  implements Iterator<T>
{
  LocalCache.Segment<K, V> currentSegment;
  AtomicReferenceArray<LocalCache.ReferenceEntry<K, V>> currentTable;
  LocalCache<K, V>.WriteThroughEntry lastReturned;
  LocalCache.ReferenceEntry<K, V> nextEntry;
  LocalCache<K, V>.WriteThroughEntry nextExternal;
  int nextSegmentIndex;
  int nextTableIndex;
  
  LocalCache$HashIterator(LocalCache paramLocalCache)
  {
    nextSegmentIndex = (segments.length - 1);
    nextTableIndex = -1;
    advance();
  }
  
  final void advance()
  {
    nextExternal = null;
    if (nextInChain()) {}
    do
    {
      do
      {
        do
        {
          ;;
          while (nextInTable()) {}
        } while (nextSegmentIndex < 0);
        LocalCache.Segment[] arrayOfSegment = this$0.segments;
        int i = nextSegmentIndex;
        nextSegmentIndex = (i - 1);
        currentSegment = arrayOfSegment[i];
      } while (currentSegment.count == 0);
      currentTable = currentSegment.table;
      nextTableIndex = (currentTable.length() - 1);
    } while (!nextInTable());
  }
  
  boolean advanceTo(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    try
    {
      long l = this$0.ticker.read();
      Object localObject = paramReferenceEntry.getKey();
      paramReferenceEntry = this$0.getLiveValue(paramReferenceEntry, l);
      if (paramReferenceEntry != null)
      {
        nextExternal = new LocalCache.WriteThroughEntry(this$0, localObject, paramReferenceEntry);
        return true;
      }
      return false;
    }
    finally
    {
      currentSegment.postReadCleanup();
    }
  }
  
  public boolean hasNext()
  {
    return nextExternal != null;
  }
  
  public abstract T next();
  
  LocalCache<K, V>.WriteThroughEntry nextEntry()
  {
    if (nextExternal == null) {
      throw new NoSuchElementException();
    }
    lastReturned = nextExternal;
    advance();
    return lastReturned;
  }
  
  boolean nextInChain()
  {
    if (nextEntry != null) {
      for (nextEntry = nextEntry.getNext(); nextEntry != null; nextEntry = nextEntry.getNext()) {
        if (advanceTo(nextEntry)) {
          return true;
        }
      }
    }
    return false;
  }
  
  boolean nextInTable()
  {
    while (nextTableIndex >= 0)
    {
      Object localObject = currentTable;
      int i = nextTableIndex;
      nextTableIndex = (i - 1);
      localObject = (LocalCache.ReferenceEntry)((AtomicReferenceArray)localObject).get(i);
      nextEntry = ((LocalCache.ReferenceEntry)localObject);
      if ((localObject != null) && ((advanceTo(nextEntry)) || (nextInChain()))) {
        return true;
      }
    }
    return false;
  }
  
  public void remove()
  {
    if (lastReturned != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      this$0.remove(lastReturned.getKey());
      lastReturned = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.HashIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */