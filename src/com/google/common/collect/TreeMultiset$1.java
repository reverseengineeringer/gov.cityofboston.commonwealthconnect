package com.google.common.collect;

class TreeMultiset$1
  extends Multisets.AbstractEntry<E>
{
  TreeMultiset$1(TreeMultiset paramTreeMultiset, TreeMultiset.AvlNode paramAvlNode) {}
  
  public int getCount()
  {
    int j = val$baseEntry.getCount();
    int i = j;
    if (j == 0) {
      i = this$0.count(getElement());
    }
    return i;
  }
  
  public E getElement()
  {
    return (E)val$baseEntry.getElement();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeMultiset.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */