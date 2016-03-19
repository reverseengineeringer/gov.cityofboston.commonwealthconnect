package com.google.common.collect;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Set;

class LinkedListMultimap$DistinctKeyIterator
  implements Iterator<K>
{
  LinkedListMultimap.Node<K, V> current;
  int expectedModCount = LinkedListMultimap.access$000(this$0);
  LinkedListMultimap.Node<K, V> next = LinkedListMultimap.access$200(this$0);
  final Set<K> seenKeys = Sets.newHashSetWithExpectedSize(this$0.keySet().size());
  
  private LinkedListMultimap$DistinctKeyIterator(LinkedListMultimap paramLinkedListMultimap) {}
  
  private void checkForConcurrentModification()
  {
    if (LinkedListMultimap.access$000(this$0) != expectedModCount) {
      throw new ConcurrentModificationException();
    }
  }
  
  public boolean hasNext()
  {
    checkForConcurrentModification();
    return next != null;
  }
  
  public K next()
  {
    checkForConcurrentModification();
    LinkedListMultimap.access$300(next);
    current = next;
    seenKeys.add(current.key);
    do
    {
      next = next.next;
    } while ((next != null) && (!seenKeys.add(next.key)));
    return (K)current.key;
  }
  
  public void remove()
  {
    checkForConcurrentModification();
    if (current != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      LinkedListMultimap.access$500(this$0, current.key);
      current = null;
      expectedModCount = LinkedListMultimap.access$000(this$0);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.DistinctKeyIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */