package com.google.common.collect;

import java.util.ArrayDeque;
import java.util.Iterator;

final class TreeTraverser$PostOrderIterator
  extends AbstractIterator<T>
{
  private final ArrayDeque<TreeTraverser.PostOrderNode<T>> stack = new ArrayDeque();
  
  TreeTraverser$PostOrderIterator(T paramT)
  {
    Object localObject;
    stack.addLast(expand(localObject));
  }
  
  private TreeTraverser.PostOrderNode<T> expand(T paramT)
  {
    return new TreeTraverser.PostOrderNode(paramT, this$0.children(paramT).iterator());
  }
  
  protected T computeNext()
  {
    while (!stack.isEmpty())
    {
      Object localObject = (TreeTraverser.PostOrderNode)stack.getLast();
      if (childIterator.hasNext())
      {
        localObject = childIterator.next();
        stack.addLast(expand(localObject));
      }
      else
      {
        stack.removeLast();
        return (T)root;
      }
    }
    return (T)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeTraverser.PostOrderIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */