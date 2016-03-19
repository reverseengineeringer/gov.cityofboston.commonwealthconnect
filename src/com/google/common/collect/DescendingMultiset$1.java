package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;

class DescendingMultiset$1
  extends Multisets.EntrySet<E>
{
  DescendingMultiset$1(DescendingMultiset paramDescendingMultiset) {}
  
  public Iterator<Multiset.Entry<E>> iterator()
  {
    return this$0.entryIterator();
  }
  
  Multiset<E> multiset()
  {
    return this$0;
  }
  
  public int size()
  {
    return this$0.forwardMultiset().entrySet().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DescendingMultiset.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */