package com.google.common.cache;

 enum LocalCache$NullEntry
  implements LocalCache.ReferenceEntry<Object, Object>
{
  INSTANCE;
  
  private LocalCache$NullEntry() {}
  
  public long getAccessTime()
  {
    return 0L;
  }
  
  public int getHash()
  {
    return 0;
  }
  
  public Object getKey()
  {
    return null;
  }
  
  public LocalCache.ReferenceEntry<Object, Object> getNext()
  {
    return null;
  }
  
  public LocalCache.ReferenceEntry<Object, Object> getNextInAccessQueue()
  {
    return this;
  }
  
  public LocalCache.ReferenceEntry<Object, Object> getNextInWriteQueue()
  {
    return this;
  }
  
  public LocalCache.ReferenceEntry<Object, Object> getPreviousInAccessQueue()
  {
    return this;
  }
  
  public LocalCache.ReferenceEntry<Object, Object> getPreviousInWriteQueue()
  {
    return this;
  }
  
  public LocalCache.ValueReference<Object, Object> getValueReference()
  {
    return null;
  }
  
  public long getWriteTime()
  {
    return 0L;
  }
  
  public void setAccessTime(long paramLong) {}
  
  public void setNextInAccessQueue(LocalCache.ReferenceEntry<Object, Object> paramReferenceEntry) {}
  
  public void setNextInWriteQueue(LocalCache.ReferenceEntry<Object, Object> paramReferenceEntry) {}
  
  public void setPreviousInAccessQueue(LocalCache.ReferenceEntry<Object, Object> paramReferenceEntry) {}
  
  public void setPreviousInWriteQueue(LocalCache.ReferenceEntry<Object, Object> paramReferenceEntry) {}
  
  public void setValueReference(LocalCache.ValueReference<Object, Object> paramValueReference) {}
  
  public void setWriteTime(long paramLong) {}
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.NullEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */