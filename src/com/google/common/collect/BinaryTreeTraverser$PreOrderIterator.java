package com.google.common.collect;

import java.util.ArrayDeque;
import java.util.Deque;

final class BinaryTreeTraverser$PreOrderIterator
  extends UnmodifiableIterator<T>
  implements PeekingIterator<T>
{
  private final Deque<T> stack = new ArrayDeque();
  
  BinaryTreeTraverser$PreOrderIterator(T paramT)
  {
    Object localObject;
    stack.addLast(localObject);
  }
  
  public boolean hasNext()
  {
    return !stack.isEmpty();
  }
  
  public T next()
  {
    Object localObject = stack.removeLast();
    BinaryTreeTraverser.access$000(stack, this$0.rightChild(localObject));
    BinaryTreeTraverser.access$000(stack, this$0.leftChild(localObject));
    return (T)localObject;
  }
  
  public T peek()
  {
    return (T)stack.getLast();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.BinaryTreeTraverser.PreOrderIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */