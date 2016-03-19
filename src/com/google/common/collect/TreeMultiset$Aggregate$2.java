package com.google.common.collect;

import javax.annotation.Nullable;

 enum TreeMultiset$Aggregate$2
{
  TreeMultiset$Aggregate$2()
  {
    super(paramString, paramInt, null);
  }
  
  int nodeAggregate(TreeMultiset.AvlNode<?> paramAvlNode)
  {
    return 1;
  }
  
  long treeAggregate(@Nullable TreeMultiset.AvlNode<?> paramAvlNode)
  {
    if (paramAvlNode == null) {
      return 0L;
    }
    return TreeMultiset.AvlNode.access$400(paramAvlNode);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeMultiset.Aggregate.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */