package com.google.common.cache;

import com.google.common.collect.AbstractSequentialIterator;
import java.util.AbstractQueue;
import java.util.Iterator;

final class LocalCache$AccessQueue<K, V>
  extends AbstractQueue<LocalCache.ReferenceEntry<K, V>>
{
  final LocalCache.ReferenceEntry<K, V> head = new LocalCache.AbstractReferenceEntry()
  {
    LocalCache.ReferenceEntry<K, V> nextAccess = this;
    LocalCache.ReferenceEntry<K, V> previousAccess = this;
    
    public long getAccessTime()
    {
      return Long.MAX_VALUE;
    }
    
    public LocalCache.ReferenceEntry<K, V> getNextInAccessQueue()
    {
      return nextAccess;
    }
    
    public LocalCache.ReferenceEntry<K, V> getPreviousInAccessQueue()
    {
      return previousAccess;
    }
    
    public void setAccessTime(long paramAnonymousLong) {}
    
    public void setNextInAccessQueue(LocalCache.ReferenceEntry<K, V> paramAnonymousReferenceEntry)
    {
      nextAccess = paramAnonymousReferenceEntry;
    }
    
    public void setPreviousInAccessQueue(LocalCache.ReferenceEntry<K, V> paramAnonymousReferenceEntry)
    {
      previousAccess = paramAnonymousReferenceEntry;
    }
  };
  
  public void clear()
  {
    LocalCache.ReferenceEntry localReferenceEntry;
    for (Object localObject = head.getNextInAccessQueue(); localObject != head; localObject = localReferenceEntry)
    {
      localReferenceEntry = ((LocalCache.ReferenceEntry)localObject).getNextInAccessQueue();
      LocalCache.nullifyAccessOrder((LocalCache.ReferenceEntry)localObject);
    }
    head.setNextInAccessQueue(head);
    head.setPreviousInAccessQueue(head);
  }
  
  public boolean contains(Object paramObject)
  {
    return ((LocalCache.ReferenceEntry)paramObject).getNextInAccessQueue() != LocalCache.NullEntry.INSTANCE;
  }
  
  public boolean isEmpty()
  {
    return head.getNextInAccessQueue() == head;
  }
  
  public Iterator<LocalCache.ReferenceEntry<K, V>> iterator()
  {
    new AbstractSequentialIterator(peek())
    {
      protected LocalCache.ReferenceEntry<K, V> computeNext(LocalCache.ReferenceEntry<K, V> paramAnonymousReferenceEntry)
      {
        LocalCache.ReferenceEntry localReferenceEntry = paramAnonymousReferenceEntry.getNextInAccessQueue();
        paramAnonymousReferenceEntry = localReferenceEntry;
        if (localReferenceEntry == head) {
          paramAnonymousReferenceEntry = null;
        }
        return paramAnonymousReferenceEntry;
      }
    };
  }
  
  public boolean offer(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    LocalCache.connectAccessOrder(paramReferenceEntry.getPreviousInAccessQueue(), paramReferenceEntry.getNextInAccessQueue());
    LocalCache.connectAccessOrder(head.getPreviousInAccessQueue(), paramReferenceEntry);
    LocalCache.connectAccessOrder(paramReferenceEntry, head);
    return true;
  }
  
  public LocalCache.ReferenceEntry<K, V> peek()
  {
    LocalCache.ReferenceEntry localReferenceEntry2 = head.getNextInAccessQueue();
    LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2;
    if (localReferenceEntry2 == head) {
      localReferenceEntry1 = null;
    }
    return localReferenceEntry1;
  }
  
  public LocalCache.ReferenceEntry<K, V> poll()
  {
    LocalCache.ReferenceEntry localReferenceEntry = head.getNextInAccessQueue();
    if (localReferenceEntry == head) {
      return null;
    }
    remove(localReferenceEntry);
    return localReferenceEntry;
  }
  
  public boolean remove(Object paramObject)
  {
    paramObject = (LocalCache.ReferenceEntry)paramObject;
    LocalCache.ReferenceEntry localReferenceEntry1 = ((LocalCache.ReferenceEntry)paramObject).getPreviousInAccessQueue();
    LocalCache.ReferenceEntry localReferenceEntry2 = ((LocalCache.ReferenceEntry)paramObject).getNextInAccessQueue();
    LocalCache.connectAccessOrder(localReferenceEntry1, localReferenceEntry2);
    LocalCache.nullifyAccessOrder((LocalCache.ReferenceEntry)paramObject);
    return localReferenceEntry2 != LocalCache.NullEntry.INSTANCE;
  }
  
  public int size()
  {
    int i = 0;
    for (LocalCache.ReferenceEntry localReferenceEntry = head.getNextInAccessQueue(); localReferenceEntry != head; localReferenceEntry = localReferenceEntry.getNextInAccessQueue()) {
      i += 1;
    }
    return i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.AccessQueue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */