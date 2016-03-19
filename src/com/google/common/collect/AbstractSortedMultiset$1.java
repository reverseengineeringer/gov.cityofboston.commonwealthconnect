package com.google.common.collect;

import java.util.Iterator;

class AbstractSortedMultiset$1
  extends DescendingMultiset<E>
{
  AbstractSortedMultiset$1(AbstractSortedMultiset paramAbstractSortedMultiset) {}
  
  Iterator<Multiset.Entry<E>> entryIterator()
  {
    return this$0.descendingEntryIterator();
  }
  
  SortedMultiset<E> forwardMultiset()
  {
    return this$0;
  }
  
  public Iterator<E> iterator()
  {
    return this$0.descendingIterator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractSortedMultiset.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */