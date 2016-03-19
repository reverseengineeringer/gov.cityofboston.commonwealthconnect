package com.google.common.collect;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

class LinkedListMultimap$2
  extends Sets.ImprovedAbstractSet<K>
{
  LinkedListMultimap$2(LinkedListMultimap paramLinkedListMultimap) {}
  
  public boolean contains(Object paramObject)
  {
    return this$0.containsKey(paramObject);
  }
  
  public Iterator<K> iterator()
  {
    return new LinkedListMultimap.DistinctKeyIterator(this$0, null);
  }
  
  public boolean remove(Object paramObject)
  {
    return !this$0.removeAll(paramObject).isEmpty();
  }
  
  public int size()
  {
    return LinkedListMultimap.access$600(this$0).size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */