package com.google.common.collect;

import java.util.ArrayDeque;
import java.util.BitSet;
import java.util.Deque;

final class BinaryTreeTraverser$PostOrderIterator
  extends UnmodifiableIterator<T>
{
  private final BitSet hasExpanded;
  private final Deque<T> stack = new ArrayDeque();
  
  BinaryTreeTraverser$PostOrderIterator(T paramT)
  {
    Object localObject;
    stack.addLast(localObject);
    hasExpanded = new BitSet();
  }
  
  public boolean hasNext()
  {
    return !stack.isEmpty();
  }
  
  public T next()
  {
    for (;;)
    {
      Object localObject = stack.getLast();
      if (hasExpanded.get(stack.size() - 1))
      {
        stack.removeLast();
        hasExpanded.clear(stack.size());
        return (T)localObject;
      }
      hasExpanded.set(stack.size() - 1);
      BinaryTreeTraverser.access$000(stack, this$0.rightChild(localObject));
      BinaryTreeTraverser.access$000(stack, this$0.leftChild(localObject));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.BinaryTreeTraverser.PostOrderIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */