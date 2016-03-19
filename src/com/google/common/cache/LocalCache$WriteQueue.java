package com.google.common.cache;

import com.google.common.collect.AbstractSequentialIterator;
import java.util.AbstractQueue;
import java.util.Iterator;

final class LocalCache$WriteQueue<K, V>
  extends AbstractQueue<LocalCache.ReferenceEntry<K, V>>
{
  final LocalCache.ReferenceEntry<K, V> head = new LocalCache.AbstractReferenceEntry()
  {
    LocalCache.ReferenceEntry<K, V> nextWrite = this;
    LocalCache.ReferenceEntry<K, V> previousWrite = this;
    
    public LocalCache.ReferenceEntry<K, V> getNextInWriteQueue()
    {
      return nextWrite;
    }
    
    public LocalCache.ReferenceEntry<K, V> getPreviousInWriteQueue()
    {
      return previousWrite;
    }
    
    public long getWriteTime()
    {
      return Long.MAX_VALUE;
    }
    
    public void setNextInWriteQueue(LocalCache.ReferenceEntry<K, V> paramAnonymousReferenceEntry)
    {
      nextWrite = paramAnonymousReferenceEntry;
    }
    
    public void setPreviousInWriteQueue(LocalCache.ReferenceEntry<K, V> paramAnonymousReferenceEntry)
    {
      previousWrite = paramAnonymousReferenceEntry;
    }
    
    public void setWriteTime(long paramAnonymousLong) {}
  };
  
  public void clear()
  {
    LocalCache.ReferenceEntry localReferenceEntry;
    for (Object localObject = head.getNextInWriteQueue(); localObject != head; localObject = localReferenceEntry)
    {
      localReferenceEntry = ((LocalCache.ReferenceEntry)localObject).getNextInWriteQueue();
      LocalCache.nullifyWriteOrder((LocalCache.ReferenceEntry)localObject);
    }
    head.setNextInWriteQueue(head);
    head.setPreviousInWriteQueue(head);
  }
  
  public boolean contains(Object paramObject)
  {
    return ((LocalCache.ReferenceEntry)paramObject).getNextInWriteQueue() != LocalCache.NullEntry.INSTANCE;
  }
  
  public boolean isEmpty()
  {
    return head.getNextInWriteQueue() == head;
  }
  
  public Iterator<LocalCache.ReferenceEntry<K, V>> iterator()
  {
    new AbstractSequentialIterator(peek())
    {
      protected LocalCache.ReferenceEntry<K, V> computeNext(LocalCache.ReferenceEntry<K, V> paramAnonymousReferenceEntry)
      {
        LocalCache.ReferenceEntry localReferenceEntry = paramAnonymousReferenceEntry.getNextInWriteQueue();
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
    LocalCache.connectWriteOrder(paramReferenceEntry.getPreviousInWriteQueue(), paramReferenceEntry.getNextInWriteQueue());
    LocalCache.connectWriteOrder(head.getPreviousInWriteQueue(), paramReferenceEntry);
    LocalCache.connectWriteOrder(paramReferenceEntry, head);
    return true;
  }
  
  public LocalCache.ReferenceEntry<K, V> peek()
  {
    LocalCache.ReferenceEntry localReferenceEntry2 = head.getNextInWriteQueue();
    LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2;
    if (localReferenceEntry2 == head) {
      localReferenceEntry1 = null;
    }
    return localReferenceEntry1;
  }
  
  public LocalCache.ReferenceEntry<K, V> poll()
  {
    LocalCache.ReferenceEntry localReferenceEntry = head.getNextInWriteQueue();
    if (localReferenceEntry == head) {
      return null;
    }
    remove(localReferenceEntry);
    return localReferenceEntry;
  }
  
  public boolean remove(Object paramObject)
  {
    paramObject = (LocalCache.ReferenceEntry)paramObject;
    LocalCache.ReferenceEntry localReferenceEntry1 = ((LocalCache.ReferenceEntry)paramObject).getPreviousInWriteQueue();
    LocalCache.ReferenceEntry localReferenceEntry2 = ((LocalCache.ReferenceEntry)paramObject).getNextInWriteQueue();
    LocalCache.connectWriteOrder(localReferenceEntry1, localReferenceEntry2);
    LocalCache.nullifyWriteOrder((LocalCache.ReferenceEntry)paramObject);
    return localReferenceEntry2 != LocalCache.NullEntry.INSTANCE;
  }
  
  public int size()
  {
    int i = 0;
    for (LocalCache.ReferenceEntry localReferenceEntry = head.getNextInWriteQueue(); localReferenceEntry != head; localReferenceEntry = localReferenceEntry.getNextInWriteQueue()) {
      i += 1;
    }
    return i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WriteQueue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */