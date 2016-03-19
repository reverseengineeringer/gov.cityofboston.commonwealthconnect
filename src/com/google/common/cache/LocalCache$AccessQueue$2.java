package com.google.common.cache;

import com.google.common.collect.AbstractSequentialIterator;

class LocalCache$AccessQueue$2
  extends AbstractSequentialIterator<LocalCache.ReferenceEntry<K, V>>
{
  LocalCache$AccessQueue$2(LocalCache.AccessQueue paramAccessQueue, LocalCache.ReferenceEntry paramReferenceEntry)
  {
    super(paramReferenceEntry);
  }
  
  protected LocalCache.ReferenceEntry<K, V> computeNext(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    LocalCache.ReferenceEntry localReferenceEntry = paramReferenceEntry.getNextInAccessQueue();
    paramReferenceEntry = localReferenceEntry;
    if (localReferenceEntry == this$0.head) {
      paramReferenceEntry = null;
    }
    return paramReferenceEntry;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.AccessQueue.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */