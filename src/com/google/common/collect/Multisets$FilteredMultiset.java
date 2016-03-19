package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

final class Multisets$FilteredMultiset<E>
  extends AbstractMultiset<E>
{
  final Predicate<? super E> predicate;
  final Multiset<E> unfiltered;
  
  Multisets$FilteredMultiset(Multiset<E> paramMultiset, Predicate<? super E> paramPredicate)
  {
    unfiltered = ((Multiset)Preconditions.checkNotNull(paramMultiset));
    predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  public int add(@Nullable E paramE, int paramInt)
  {
    Preconditions.checkArgument(predicate.apply(paramE), "Element %s does not match predicate %s", new Object[] { paramE, predicate });
    return unfiltered.add(paramE, paramInt);
  }
  
  public void clear()
  {
    elementSet().clear();
  }
  
  public int count(@Nullable Object paramObject)
  {
    int i = unfiltered.count(paramObject);
    if (i > 0)
    {
      if (predicate.apply(paramObject)) {
        return i;
      }
      return 0;
    }
    return 0;
  }
  
  Set<E> createElementSet()
  {
    return Sets.filter(unfiltered.elementSet(), predicate);
  }
  
  Set<Multiset.Entry<E>> createEntrySet()
  {
    Sets.filter(unfiltered.entrySet(), new Predicate()
    {
      public boolean apply(Multiset.Entry<E> paramAnonymousEntry)
      {
        return predicate.apply(paramAnonymousEntry.getElement());
      }
    });
  }
  
  int distinctElements()
  {
    return elementSet().size();
  }
  
  Iterator<Multiset.Entry<E>> entryIterator()
  {
    throw new AssertionError("should never be called");
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.filter(unfiltered.iterator(), predicate);
  }
  
  public int remove(@Nullable Object paramObject, int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "occurrences");
    if (paramInt == 0) {
      return count(paramObject);
    }
    if (contains(paramObject)) {
      return unfiltered.remove(paramObject, paramInt);
    }
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.FilteredMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */