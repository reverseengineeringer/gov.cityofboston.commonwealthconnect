package com.google.common.collect;

import com.google.common.base.Optional;
import java.util.Iterator;

class BinaryTreeTraverser$1
  extends FluentIterable<T>
{
  BinaryTreeTraverser$1(BinaryTreeTraverser paramBinaryTreeTraverser, Object paramObject) {}
  
  public Iterator<T> iterator()
  {
    new AbstractIterator()
    {
      boolean doneLeft;
      boolean doneRight;
      
      protected T computeNext()
      {
        Optional localOptional;
        if (!doneLeft)
        {
          doneLeft = true;
          localOptional = this$0.leftChild(val$root);
          if (localOptional.isPresent()) {
            return (T)localOptional.get();
          }
        }
        if (!doneRight)
        {
          doneRight = true;
          localOptional = this$0.rightChild(val$root);
          if (localOptional.isPresent()) {
            return (T)localOptional.get();
          }
        }
        return (T)endOfData();
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.BinaryTreeTraverser.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */