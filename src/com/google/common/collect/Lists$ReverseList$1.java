package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ListIterator;
import java.util.NoSuchElementException;

class Lists$ReverseList$1
  implements ListIterator<T>
{
  boolean canRemoveOrSet;
  
  Lists$ReverseList$1(Lists.ReverseList paramReverseList, ListIterator paramListIterator) {}
  
  public void add(T paramT)
  {
    val$forwardIterator.add(paramT);
    val$forwardIterator.previous();
    canRemoveOrSet = false;
  }
  
  public boolean hasNext()
  {
    return val$forwardIterator.hasPrevious();
  }
  
  public boolean hasPrevious()
  {
    return val$forwardIterator.hasNext();
  }
  
  public T next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    canRemoveOrSet = true;
    return (T)val$forwardIterator.previous();
  }
  
  public int nextIndex()
  {
    return Lists.ReverseList.access$000(this$0, val$forwardIterator.nextIndex());
  }
  
  public T previous()
  {
    if (!hasPrevious()) {
      throw new NoSuchElementException();
    }
    canRemoveOrSet = true;
    return (T)val$forwardIterator.next();
  }
  
  public int previousIndex()
  {
    return nextIndex() - 1;
  }
  
  public void remove()
  {
    CollectPreconditions.checkRemove(canRemoveOrSet);
    val$forwardIterator.remove();
    canRemoveOrSet = false;
  }
  
  public void set(T paramT)
  {
    Preconditions.checkState(canRemoveOrSet);
    val$forwardIterator.set(paramT);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.ReverseList.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */