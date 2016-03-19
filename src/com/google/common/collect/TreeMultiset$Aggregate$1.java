package com.google.common.collect;

import javax.annotation.Nullable;

 enum TreeMultiset$Aggregate$1
{
  TreeMultiset$Aggregate$1()
  {
    super(paramString, paramInt, null);
  }
  
  int nodeAggregate(TreeMultiset.AvlNode<?> paramAvlNode)
  {
    return TreeMultiset.AvlNode.access$200(paramAvlNode);
  }
  
  long treeAggregate(@Nullable TreeMultiset.AvlNode<?> paramAvlNode)
  {
    if (paramAvlNode == null) {
      return 0L;
    }
    return TreeMultiset.AvlNode.access$300(paramAvlNode);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeMultiset.Aggregate.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */