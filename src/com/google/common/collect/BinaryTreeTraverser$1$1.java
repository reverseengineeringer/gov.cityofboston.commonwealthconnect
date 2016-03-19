package com.google.common.collect;

import com.google.common.base.Optional;

class BinaryTreeTraverser$1$1
  extends AbstractIterator<T>
{
  boolean doneLeft;
  boolean doneRight;
  
  BinaryTreeTraverser$1$1(BinaryTreeTraverser.1 param1) {}
  
  protected T computeNext()
  {
    Optional localOptional;
    if (!doneLeft)
    {
      doneLeft = true;
      localOptional = this$1.this$0.leftChild(this$1.val$root);
      if (localOptional.isPresent()) {
        return (T)localOptional.get();
      }
    }
    if (!doneRight)
    {
      doneRight = true;
      localOptional = this$1.this$0.rightChild(this$1.val$root);
      if (localOptional.isPresent()) {
        return (T)localOptional.get();
      }
    }
    return (T)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.BinaryTreeTraverser.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */