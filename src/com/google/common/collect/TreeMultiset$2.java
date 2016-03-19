package com.google.common.collect;

import java.util.Iterator;
import java.util.NoSuchElementException;

class TreeMultiset$2
  implements Iterator<Multiset.Entry<E>>
{
  TreeMultiset.AvlNode<E> current = TreeMultiset.access$1200(this$0);
  Multiset.Entry<E> prevEntry;
  
  TreeMultiset$2(TreeMultiset paramTreeMultiset) {}
  
  public boolean hasNext()
  {
    if (current == null) {
      return false;
    }
    if (TreeMultiset.access$1300(this$0).tooHigh(current.getElement()))
    {
      current = null;
      return false;
    }
    return true;
  }
  
  public Multiset.Entry<E> next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    Multiset.Entry localEntry = TreeMultiset.access$1400(this$0, current);
    prevEntry = localEntry;
    if (TreeMultiset.AvlNode.access$900(current) == TreeMultiset.access$1500(this$0))
    {
      current = null;
      return localEntry;
    }
    current = TreeMultiset.AvlNode.access$900(current);
    return localEntry;
  }
  
  public void remove()
  {
    if (prevEntry != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      this$0.setCount(prevEntry.getElement(), 0);
      prevEntry = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeMultiset.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */