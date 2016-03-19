package com.google.common.collect;

import java.util.List;
import java.util.ListIterator;

class AbstractMapBasedMultimap$WrappedList$WrappedListIterator
  extends AbstractMapBasedMultimap<K, V>.WrappedCollection.WrappedIterator
  implements ListIterator<V>
{
  AbstractMapBasedMultimap$WrappedList$WrappedListIterator(AbstractMapBasedMultimap.WrappedList paramWrappedList)
  {
    super(paramWrappedList);
  }
  
  public AbstractMapBasedMultimap$WrappedList$WrappedListIterator(AbstractMapBasedMultimap.WrappedList paramWrappedList, int paramInt)
  {
    super(paramWrappedList, paramWrappedList.getListDelegate().listIterator(paramInt));
  }
  
  private ListIterator<V> getDelegateListIterator()
  {
    return (ListIterator)getDelegateIterator();
  }
  
  public void add(V paramV)
  {
    boolean bool = this$1.isEmpty();
    getDelegateListIterator().add(paramV);
    AbstractMapBasedMultimap.access$208(this$1.this$0);
    if (bool) {
      this$1.addToMap();
    }
  }
  
  public boolean hasPrevious()
  {
    return getDelegateListIterator().hasPrevious();
  }
  
  public int nextIndex()
  {
    return getDelegateListIterator().nextIndex();
  }
  
  public V previous()
  {
    return (V)getDelegateListIterator().previous();
  }
  
  public int previousIndex()
  {
    return getDelegateListIterator().previousIndex();
  }
  
  public void set(V paramV)
  {
    getDelegateListIterator().set(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.WrappedList.WrappedListIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */