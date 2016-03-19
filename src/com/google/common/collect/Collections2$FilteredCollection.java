package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import javax.annotation.Nullable;

class Collections2$FilteredCollection<E>
  extends AbstractCollection<E>
{
  final Predicate<? super E> predicate;
  final Collection<E> unfiltered;
  
  Collections2$FilteredCollection(Collection<E> paramCollection, Predicate<? super E> paramPredicate)
  {
    unfiltered = paramCollection;
    predicate = paramPredicate;
  }
  
  public boolean add(E paramE)
  {
    Preconditions.checkArgument(predicate.apply(paramE));
    return unfiltered.add(paramE);
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = localIterator.next();
      Preconditions.checkArgument(predicate.apply(localObject));
    }
    return unfiltered.addAll(paramCollection);
  }
  
  public void clear()
  {
    Iterables.removeIf(unfiltered, predicate);
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if (Collections2.safeContains(unfiltered, paramObject)) {
      return predicate.apply(paramObject);
    }
    return false;
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return Collections2.containsAllImpl(this, paramCollection);
  }
  
  FilteredCollection<E> createCombined(Predicate<? super E> paramPredicate)
  {
    return new FilteredCollection(unfiltered, Predicates.and(predicate, paramPredicate));
  }
  
  public boolean isEmpty()
  {
    return !Iterables.any(unfiltered, predicate);
  }
  
  public Iterator<E> iterator()
  {
    return Iterators.filter(unfiltered.iterator(), predicate);
  }
  
  public boolean remove(Object paramObject)
  {
    return (contains(paramObject)) && (unfiltered.remove(paramObject));
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return Iterables.removeIf(unfiltered, Predicates.and(predicate, Predicates.in(paramCollection)));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return Iterables.removeIf(unfiltered, Predicates.and(predicate, Predicates.not(Predicates.in(paramCollection))));
  }
  
  public int size()
  {
    return Iterators.size(iterator());
  }
  
  public Object[] toArray()
  {
    return Lists.newArrayList(iterator()).toArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return Lists.newArrayList(iterator()).toArray(paramArrayOfT);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Collections2.FilteredCollection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */