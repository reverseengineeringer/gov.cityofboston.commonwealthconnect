package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$WrappedCollection
  extends AbstractCollection<V>
{
  final AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor;
  final Collection<V> ancestorDelegate;
  Collection<V> delegate;
  final K key;
  
  AbstractMapBasedMultimap$WrappedCollection(@Nullable K paramK, Collection<V> paramCollection, @Nullable AbstractMapBasedMultimap<K, V>.WrappedCollection paramAbstractMapBasedMultimap)
  {
    key = paramCollection;
    delegate = paramAbstractMapBasedMultimap;
    WrappedCollection localWrappedCollection;
    ancestor = localWrappedCollection;
    if (localWrappedCollection == null) {}
    for (paramK = null;; paramK = localWrappedCollection.getDelegate())
    {
      ancestorDelegate = paramK;
      return;
    }
  }
  
  public boolean add(V paramV)
  {
    refreshIfEmpty();
    boolean bool1 = delegate.isEmpty();
    boolean bool2 = delegate.add(paramV);
    if (bool2)
    {
      AbstractMapBasedMultimap.access$208(this$0);
      if (bool1) {
        addToMap();
      }
    }
    return bool2;
  }
  
  public boolean addAll(Collection<? extends V> paramCollection)
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
        bool2 = delegate.addAll(paramCollection);
        bool1 = bool2;
      } while (!bool2);
      int j = delegate.size();
      AbstractMapBasedMultimap.access$212(this$0, j - i);
      bool1 = bool2;
    } while (i != 0);
    addToMap();
    return bool2;
  }
  
  void addToMap()
  {
    if (ancestor != null)
    {
      ancestor.addToMap();
      return;
    }
    AbstractMapBasedMultimap.access$000(this$0).put(key, delegate);
  }
  
  public void clear()
  {
    int i = size();
    if (i == 0) {
      return;
    }
    delegate.clear();
    AbstractMapBasedMultimap.access$220(this$0, i);
    removeIfEmpty();
  }
  
  public boolean contains(Object paramObject)
  {
    refreshIfEmpty();
    return delegate.contains(paramObject);
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    refreshIfEmpty();
    return delegate.containsAll(paramCollection);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    refreshIfEmpty();
    return delegate.equals(paramObject);
  }
  
  AbstractMapBasedMultimap<K, V>.WrappedCollection getAncestor()
  {
    return ancestor;
  }
  
  Collection<V> getDelegate()
  {
    return delegate;
  }
  
  K getKey()
  {
    return (K)key;
  }
  
  public int hashCode()
  {
    refreshIfEmpty();
    return delegate.hashCode();
  }
  
  public Iterator<V> iterator()
  {
    refreshIfEmpty();
    return new WrappedIterator();
  }
  
  void refreshIfEmpty()
  {
    if (ancestor != null)
    {
      ancestor.refreshIfEmpty();
      if (ancestor.getDelegate() != ancestorDelegate) {
        throw new ConcurrentModificationException();
      }
    }
    else if (delegate.isEmpty())
    {
      Collection localCollection = (Collection)AbstractMapBasedMultimap.access$000(this$0).get(key);
      if (localCollection != null) {
        delegate = localCollection;
      }
    }
  }
  
  public boolean remove(Object paramObject)
  {
    refreshIfEmpty();
    boolean bool = delegate.remove(paramObject);
    if (bool)
    {
      AbstractMapBasedMultimap.access$210(this$0);
      removeIfEmpty();
    }
    return bool;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    boolean bool1;
    if (paramCollection.isEmpty()) {
      bool1 = false;
    }
    int i;
    boolean bool2;
    do
    {
      return bool1;
      i = size();
      bool2 = delegate.removeAll(paramCollection);
      bool1 = bool2;
    } while (!bool2);
    int j = delegate.size();
    AbstractMapBasedMultimap.access$212(this$0, j - i);
    removeIfEmpty();
    return bool2;
  }
  
  void removeIfEmpty()
  {
    if (ancestor != null) {
      ancestor.removeIfEmpty();
    }
    while (!delegate.isEmpty()) {
      return;
    }
    AbstractMapBasedMultimap.access$000(this$0).remove(key);
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    int i = size();
    boolean bool = delegate.retainAll(paramCollection);
    if (bool)
    {
      int j = delegate.size();
      AbstractMapBasedMultimap.access$212(this$0, j - i);
      removeIfEmpty();
    }
    return bool;
  }
  
  public int size()
  {
    refreshIfEmpty();
    return delegate.size();
  }
  
  public String toString()
  {
    refreshIfEmpty();
    return delegate.toString();
  }
  
  class WrappedIterator
    implements Iterator<V>
  {
    final Iterator<V> delegateIterator;
    final Collection<V> originalDelegate = delegate;
    
    WrappedIterator()
    {
      delegateIterator = AbstractMapBasedMultimap.access$100(this$0, delegate);
    }
    
    WrappedIterator()
    {
      Iterator localIterator;
      delegateIterator = localIterator;
    }
    
    Iterator<V> getDelegateIterator()
    {
      validateIterator();
      return delegateIterator;
    }
    
    public boolean hasNext()
    {
      validateIterator();
      return delegateIterator.hasNext();
    }
    
    public V next()
    {
      validateIterator();
      return (V)delegateIterator.next();
    }
    
    public void remove()
    {
      delegateIterator.remove();
      AbstractMapBasedMultimap.access$210(this$0);
      removeIfEmpty();
    }
    
    void validateIterator()
    {
      refreshIfEmpty();
      if (delegate != originalDelegate) {
        throw new ConcurrentModificationException();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.WrappedCollection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */