package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ConcurrentModificationException;
import java.util.ListIterator;
import java.util.Map.Entry;

class LinkedListMultimap$NodeIterator
  implements ListIterator<Map.Entry<K, V>>
{
  LinkedListMultimap.Node<K, V> current;
  int expectedModCount = LinkedListMultimap.access$000(this$0);
  LinkedListMultimap.Node<K, V> next;
  int nextIndex;
  LinkedListMultimap.Node<K, V> previous;
  
  LinkedListMultimap$NodeIterator(LinkedListMultimap paramLinkedListMultimap, int paramInt)
  {
    int i = paramLinkedListMultimap.size();
    Preconditions.checkPositionIndex(paramInt, i);
    if (paramInt >= i / 2)
    {
      previous = LinkedListMultimap.access$100(paramLinkedListMultimap);
      nextIndex = i;
      while (paramInt < i)
      {
        previous();
        paramInt += 1;
      }
    }
    next = LinkedListMultimap.access$200(paramLinkedListMultimap);
    while (paramInt > 0)
    {
      next();
      paramInt -= 1;
    }
    current = null;
  }
  
  private void checkForConcurrentModification()
  {
    if (LinkedListMultimap.access$000(this$0) != expectedModCount) {
      throw new ConcurrentModificationException();
    }
  }
  
  public void add(Map.Entry<K, V> paramEntry)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean hasNext()
  {
    checkForConcurrentModification();
    return next != null;
  }
  
  public boolean hasPrevious()
  {
    checkForConcurrentModification();
    return previous != null;
  }
  
  public LinkedListMultimap.Node<K, V> next()
  {
    checkForConcurrentModification();
    LinkedListMultimap.access$300(next);
    LinkedListMultimap.Node localNode = next;
    current = localNode;
    previous = localNode;
    next = next.next;
    nextIndex += 1;
    return current;
  }
  
  public int nextIndex()
  {
    return nextIndex;
  }
  
  public LinkedListMultimap.Node<K, V> previous()
  {
    checkForConcurrentModification();
    LinkedListMultimap.access$300(previous);
    LinkedListMultimap.Node localNode = previous;
    current = localNode;
    next = localNode;
    previous = previous.previous;
    nextIndex -= 1;
    return current;
  }
  
  public int previousIndex()
  {
    return nextIndex - 1;
  }
  
  public void remove()
  {
    checkForConcurrentModification();
    boolean bool;
    if (current != null)
    {
      bool = true;
      CollectPreconditions.checkRemove(bool);
      if (current == next) {
        break label82;
      }
      previous = current.previous;
      nextIndex -= 1;
    }
    for (;;)
    {
      LinkedListMultimap.access$400(this$0, current);
      current = null;
      expectedModCount = LinkedListMultimap.access$000(this$0);
      return;
      bool = false;
      break;
      label82:
      next = current.next;
    }
  }
  
  public void set(Map.Entry<K, V> paramEntry)
  {
    throw new UnsupportedOperationException();
  }
  
  void setValue(V paramV)
  {
    if (current != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      current.value = paramV;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.NodeIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */