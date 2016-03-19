package com.google.common.collect;

import java.util.ArrayDeque;
import java.util.BitSet;
import java.util.Deque;

final class BinaryTreeTraverser$InOrderIterator
  extends AbstractIterator<T>
{
  private final BitSet hasExpandedLeft = new BitSet();
  private final Deque<T> stack = new ArrayDeque();
  
  BinaryTreeTraverser$InOrderIterator(T paramT)
  {
    Object localObject;
    stack.addLast(localObject);
  }
  
  protected T computeNext()
  {
    while (!stack.isEmpty())
    {
      Object localObject = stack.getLast();
      if (hasExpandedLeft.get(stack.size() - 1))
      {
        stack.removeLast();
        hasExpandedLeft.clear(stack.size());
        BinaryTreeTraverser.access$000(stack, this$0.rightChild(localObject));
        return (T)localObject;
      }
      hasExpandedLeft.set(stack.size() - 1);
      BinaryTreeTraverser.access$000(stack, this$0.leftChild(localObject));
    }
    return (T)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.BinaryTreeTraverser.InOrderIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */