package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;

final class TreeTraverser$PostOrderNode<T>
{
  final Iterator<T> childIterator;
  final T root;
  
  TreeTraverser$PostOrderNode(T paramT, Iterator<T> paramIterator)
  {
    root = Preconditions.checkNotNull(paramT);
    childIterator = ((Iterator)Preconditions.checkNotNull(paramIterator));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeTraverser.PostOrderNode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */