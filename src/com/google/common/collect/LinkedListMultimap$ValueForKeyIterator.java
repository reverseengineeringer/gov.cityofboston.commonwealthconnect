package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ListIterator;
import java.util.Map;
import javax.annotation.Nullable;

class LinkedListMultimap$ValueForKeyIterator
  implements ListIterator<V>
{
  LinkedListMultimap.Node<K, V> current;
  final Object key;
  LinkedListMultimap.Node<K, V> next;
  int nextIndex;
  LinkedListMultimap.Node<K, V> previous;
  
  LinkedListMultimap$ValueForKeyIterator(@Nullable LinkedListMultimap paramLinkedListMultimap, Object paramObject)
  {
    key = paramObject;
    paramLinkedListMultimap = (LinkedListMultimap.KeyList)LinkedListMultimap.access$600(paramLinkedListMultimap).get(paramObject);
    if (paramLinkedListMultimap == null) {}
    for (paramLinkedListMultimap = null;; paramLinkedListMultimap = head)
    {
      next = paramLinkedListMultimap;
      return;
    }
  }
  
  public LinkedListMultimap$ValueForKeyIterator(@Nullable LinkedListMultimap paramLinkedListMultimap, Object paramObject, int paramInt)
  {
    paramLinkedListMultimap = (LinkedListMultimap.KeyList)LinkedListMultimap.access$600(paramLinkedListMultimap).get(paramObject);
    int i;
    if (paramLinkedListMultimap == null)
    {
      i = 0;
      Preconditions.checkPositionIndex(paramInt, i);
      if (paramInt < i / 2) {
        break label97;
      }
      if (paramLinkedListMultimap != null) {
        break label89;
      }
    }
    label89:
    for (paramLinkedListMultimap = null;; paramLinkedListMultimap = tail)
    {
      previous = paramLinkedListMultimap;
      nextIndex = i;
      while (paramInt < i)
      {
        previous();
        paramInt += 1;
      }
      i = count;
      break;
    }
    label97:
    if (paramLinkedListMultimap == null) {}
    for (paramLinkedListMultimap = null;; paramLinkedListMultimap = head)
    {
      next = paramLinkedListMultimap;
      while (paramInt > 0)
      {
        next();
        paramInt -= 1;
      }
    }
    key = paramObject;
    current = null;
  }
  
  public void add(V paramV)
  {
    previous = LinkedListMultimap.access$700(this$0, key, paramV, next);
    nextIndex += 1;
    current = null;
  }
  
  public boolean hasNext()
  {
    return next != null;
  }
  
  public boolean hasPrevious()
  {
    return previous != null;
  }
  
  public V next()
  {
    LinkedListMultimap.access$300(next);
    LinkedListMultimap.Node localNode = next;
    current = localNode;
    previous = localNode;
    next = next.nextSibling;
    nextIndex += 1;
    return (V)current.value;
  }
  
  public int nextIndex()
  {
    return nextIndex;
  }
  
  public V previous()
  {
    LinkedListMultimap.access$300(previous);
    LinkedListMultimap.Node localNode = previous;
    current = localNode;
    next = localNode;
    previous = previous.previousSibling;
    nextIndex -= 1;
    return (V)current.value;
  }
  
  public int previousIndex()
  {
    return nextIndex - 1;
  }
  
  public void remove()
  {
    boolean bool;
    if (current != null)
    {
      bool = true;
      CollectPreconditions.checkRemove(bool);
      if (current == next) {
        break label67;
      }
      previous = current.previousSibling;
      nextIndex -= 1;
    }
    for (;;)
    {
      LinkedListMultimap.access$400(this$0, current);
      current = null;
      return;
      bool = false;
      break;
      label67:
      next = current.nextSibling;
    }
  }
  
  public void set(V paramV)
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
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.ValueForKeyIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */