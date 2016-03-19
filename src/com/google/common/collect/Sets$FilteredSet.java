package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Set;
import javax.annotation.Nullable;

class Sets$FilteredSet<E>
  extends Collections2.FilteredCollection<E>
  implements Set<E>
{
  Sets$FilteredSet(Set<E> paramSet, Predicate<? super E> paramPredicate)
  {
    super(paramSet, paramPredicate);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return Sets.equalsImpl(this, paramObject);
  }
  
  public int hashCode()
  {
    return Sets.hashCodeImpl(this);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.FilteredSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */