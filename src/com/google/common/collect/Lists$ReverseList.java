package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import javax.annotation.Nullable;

class Lists$ReverseList<T>
  extends AbstractList<T>
{
  private final List<T> forwardList;
  
  Lists$ReverseList(List<T> paramList)
  {
    forwardList = ((List)Preconditions.checkNotNull(paramList));
  }
  
  private int reverseIndex(int paramInt)
  {
    int i = size();
    Preconditions.checkElementIndex(paramInt, i);
    return i - 1 - paramInt;
  }
  
  private int reversePosition(int paramInt)
  {
    int i = size();
    Preconditions.checkPositionIndex(paramInt, i);
    return i - paramInt;
  }
  
  public void add(int paramInt, @Nullable T paramT)
  {
    forwardList.add(reversePosition(paramInt), paramT);
  }
  
  public void clear()
  {
    forwardList.clear();
  }
  
  public T get(int paramInt)
  {
    return (T)forwardList.get(reverseIndex(paramInt));
  }
  
  List<T> getForwardList()
  {
    return forwardList;
  }
  
  public Iterator<T> iterator()
  {
    return listIterator();
  }
  
  public ListIterator<T> listIterator(int paramInt)
  {
    paramInt = reversePosition(paramInt);
    new ListIterator()
    {
      boolean canRemoveOrSet;
      
      public void add(T paramAnonymousT)
      {
        val$forwardIterator.add(paramAnonymousT);
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
        return Lists.ReverseList.this.reversePosition(val$forwardIterator.nextIndex());
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
      
      public void set(T paramAnonymousT)
      {
        Preconditions.checkState(canRemoveOrSet);
        val$forwardIterator.set(paramAnonymousT);
      }
    };
  }
  
  public T remove(int paramInt)
  {
    return (T)forwardList.remove(reverseIndex(paramInt));
  }
  
  protected void removeRange(int paramInt1, int paramInt2)
  {
    subList(paramInt1, paramInt2).clear();
  }
  
  public T set(int paramInt, @Nullable T paramT)
  {
    return (T)forwardList.set(reverseIndex(paramInt), paramT);
  }
  
  public int size()
  {
    return forwardList.size();
  }
  
  public List<T> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    return Lists.reverse(forwardList.subList(reversePosition(paramInt2), reversePosition(paramInt1)));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.ReverseList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */