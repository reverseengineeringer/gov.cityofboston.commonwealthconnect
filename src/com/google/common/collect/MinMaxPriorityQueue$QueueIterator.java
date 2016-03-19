package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Queue;

class MinMaxPriorityQueue$QueueIterator
  implements Iterator<E>
{
  private boolean canRemove;
  private int cursor = -1;
  private int expectedModCount = MinMaxPriorityQueue.access$700(this$0);
  private Queue<E> forgetMeNot;
  private E lastFromForgetMeNot;
  private List<E> skipMe;
  
  private MinMaxPriorityQueue$QueueIterator(MinMaxPriorityQueue paramMinMaxPriorityQueue) {}
  
  private boolean containsExact(Iterable<E> paramIterable, E paramE)
  {
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext()) {
      if (paramIterable.next() == paramE) {
        return true;
      }
    }
    return false;
  }
  
  private int nextNotInSkipMe(int paramInt)
  {
    int i = paramInt;
    if (skipMe != null) {
      for (;;)
      {
        i = paramInt;
        if (paramInt >= this$0.size()) {
          break;
        }
        i = paramInt;
        if (!containsExact(skipMe, this$0.elementData(paramInt))) {
          break;
        }
        paramInt += 1;
      }
    }
    return i;
  }
  
  void checkModCount()
  {
    if (MinMaxPriorityQueue.access$700(this$0) != expectedModCount) {
      throw new ConcurrentModificationException();
    }
  }
  
  public boolean hasNext()
  {
    checkModCount();
    return (nextNotInSkipMe(cursor + 1) < this$0.size()) || ((forgetMeNot != null) && (!forgetMeNot.isEmpty()));
  }
  
  public E next()
  {
    checkModCount();
    int i = nextNotInSkipMe(cursor + 1);
    if (i < this$0.size())
    {
      cursor = i;
      canRemove = true;
      return (E)this$0.elementData(cursor);
    }
    if (forgetMeNot != null)
    {
      cursor = this$0.size();
      lastFromForgetMeNot = forgetMeNot.poll();
      if (lastFromForgetMeNot != null)
      {
        canRemove = true;
        return (E)lastFromForgetMeNot;
      }
    }
    throw new NoSuchElementException("iterator moved past last element in queue.");
  }
  
  public void remove()
  {
    CollectPreconditions.checkRemove(canRemove);
    checkModCount();
    canRemove = false;
    expectedModCount += 1;
    if (cursor < this$0.size())
    {
      MinMaxPriorityQueue.MoveDesc localMoveDesc = this$0.removeAt(cursor);
      if (localMoveDesc != null)
      {
        if (forgetMeNot == null)
        {
          forgetMeNot = new ArrayDeque();
          skipMe = new ArrayList(3);
        }
        forgetMeNot.add(toTrickle);
        skipMe.add(replaced);
      }
      cursor -= 1;
      return;
    }
    Preconditions.checkState(removeExact(lastFromForgetMeNot));
    lastFromForgetMeNot = null;
  }
  
  boolean removeExact(Object paramObject)
  {
    int i = 0;
    while (i < MinMaxPriorityQueue.access$600(this$0))
    {
      if (MinMaxPriorityQueue.access$500(this$0)[i] == paramObject)
      {
        this$0.removeAt(i);
        return true;
      }
      i += 1;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MinMaxPriorityQueue.QueueIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */