package com.google.common.collect;

import java.util.Collection;
import java.util.List;
import java.util.ListIterator;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$WrappedList
  extends AbstractMapBasedMultimap<K, V>.WrappedCollection
  implements List<V>
{
  AbstractMapBasedMultimap$WrappedList(@Nullable K paramK, List<V> paramList, @Nullable AbstractMapBasedMultimap<K, V>.WrappedCollection paramAbstractMapBasedMultimap)
  {
    super(paramK, paramList, paramAbstractMapBasedMultimap, localWrappedCollection);
  }
  
  public void add(int paramInt, V paramV)
  {
    refreshIfEmpty();
    boolean bool = getDelegate().isEmpty();
    getListDelegate().add(paramInt, paramV);
    AbstractMapBasedMultimap.access$208(this$0);
    if (bool) {
      addToMap();
    }
  }
  
  public boolean addAll(int paramInt, Collection<? extends V> paramCollection)
  {
    boolean bool1;
    if (paramCollection.isEmpty()) {
      bool1 = false;
    }
    int i;
    boolean bool2;
    do
    {
      do
      {
        return bool1;
        i = size();
        bool2 = getListDelegate().addAll(paramInt, paramCollection);
        bool1 = bool2;
      } while (!bool2);
      paramInt = getDelegate().size();
      AbstractMapBasedMultimap.access$212(this$0, paramInt - i);
      bool1 = bool2;
    } while (i != 0);
    addToMap();
    return bool2;
  }
  
  public V get(int paramInt)
  {
    refreshIfEmpty();
    return (V)getListDelegate().get(paramInt);
  }
  
  List<V> getListDelegate()
  {
    return (List)getDelegate();
  }
  
  public int indexOf(Object paramObject)
  {
    refreshIfEmpty();
    return getListDelegate().indexOf(paramObject);
  }
  
  public int lastIndexOf(Object paramObject)
  {
    refreshIfEmpty();
    return getListDelegate().lastIndexOf(paramObject);
  }
  
  public ListIterator<V> listIterator()
  {
    refreshIfEmpty();
    return new WrappedListIterator();
  }
  
  public ListIterator<V> listIterator(int paramInt)
  {
    refreshIfEmpty();
    return new WrappedListIterator(paramInt);
  }
  
  public V remove(int paramInt)
  {
    refreshIfEmpty();
    Object localObject = getListDelegate().remove(paramInt);
    AbstractMapBasedMultimap.access$210(this$0);
    removeIfEmpty();
    return (V)localObject;
  }
  
  public V set(int paramInt, V paramV)
  {
    refreshIfEmpty();
    return (V)getListDelegate().set(paramInt, paramV);
  }
  
  public List<V> subList(int paramInt1, int paramInt2)
  {
    refreshIfEmpty();
    AbstractMapBasedMultimap localAbstractMapBasedMultimap = this$0;
    Object localObject2 = getKey();
    List localList = getListDelegate().subList(paramInt1, paramInt2);
    if (getAncestor() == null) {}
    for (Object localObject1 = this;; localObject1 = getAncestor()) {
      return AbstractMapBasedMultimap.access$300(localAbstractMapBasedMultimap, localObject2, localList, (AbstractMapBasedMultimap.WrappedCollection)localObject1);
    }
  }
  
  private class WrappedListIterator
    extends AbstractMapBasedMultimap<K, V>.WrappedCollection.WrappedIterator
    implements ListIterator<V>
  {
    WrappedListIterator()
    {
      super();
    }
    
    public WrappedListIterator(int paramInt)
    {
      super(getListDelegate().listIterator(paramInt));
    }
    
    private ListIterator<V> getDelegateListIterator()
    {
      return (ListIterator)getDelegateIterator();
    }
    
    public void add(V paramV)
    {
      boolean bool = isEmpty();
      getDelegateListIterator().add(paramV);
      AbstractMapBasedMultimap.access$208(this$0);
      if (bool) {
        addToMap();
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
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.WrappedList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */