package com.google.common.collect;

import java.util.ArrayDeque;
import java.util.Queue;

final class TreeTraverser$BreadthFirstIterator
  extends UnmodifiableIterator<T>
  implements PeekingIterator<T>
{
  private final Queue<T> queue = new ArrayDeque();
  
  TreeTraverser$BreadthFirstIterator(T paramT)
  {
    Object localObject;
    queue.add(localObject);
  }
  
  public boolean hasNext()
  {
    return !queue.isEmpty();
  }
  
  public T next()
  {
    Object localObject = queue.remove();
    Iterables.addAll(queue, this$0.children(localObject));
    return (T)localObject;
  }
  
  public T peek()
  {
    return (T)queue.element();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeTraverser.BreadthFirstIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */