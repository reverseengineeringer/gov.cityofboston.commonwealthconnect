package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Iterator;

final class TreeTraverser$PreOrderIterator
  extends UnmodifiableIterator<T>
{
  private final Deque<Iterator<T>> stack = new ArrayDeque();
  
  TreeTraverser$PreOrderIterator(T paramT)
  {
    Object localObject;
    stack.addLast(Iterators.singletonIterator(Preconditions.checkNotNull(localObject)));
  }
  
  public boolean hasNext()
  {
    return !stack.isEmpty();
  }
  
  public T next()
  {
    Iterator localIterator = (Iterator)stack.getLast();
    Object localObject = Preconditions.checkNotNull(localIterator.next());
    if (!localIterator.hasNext()) {
      stack.removeLast();
    }
    localIterator = this$0.children(localObject).iterator();
    if (localIterator.hasNext()) {
      stack.addLast(localIterator);
    }
    return (T)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeTraverser.PreOrderIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */