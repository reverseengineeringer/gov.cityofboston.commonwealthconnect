package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

abstract class Multisets$ElementSet<E>
  extends Sets.ImprovedAbstractSet<E>
{
  public void clear()
  {
    multiset().clear();
  }
  
  public boolean contains(Object paramObject)
  {
    return multiset().contains(paramObject);
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return multiset().containsAll(paramCollection);
  }
  
  public boolean isEmpty()
  {
    return multiset().isEmpty();
  }
  
  public Iterator<E> iterator()
  {
    new TransformedIterator(multiset().entrySet().iterator())
    {
      E transform(Multiset.Entry<E> paramAnonymousEntry)
      {
        return (E)paramAnonymousEntry.getElement();
      }
    };
  }
  
  abstract Multiset<E> multiset();
  
  public boolean remove(Object paramObject)
  {
    int i = multiset().count(paramObject);
    if (i > 0)
    {
      multiset().remove(paramObject, i);
      return true;
    }
    return false;
  }
  
  public int size()
  {
    return multiset().entrySet().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.ElementSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */