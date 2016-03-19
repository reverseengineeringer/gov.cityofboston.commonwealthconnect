package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Predicates$NotPredicate<T>
  implements Predicate<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Predicate<T> predicate;
  
  Predicates$NotPredicate(Predicate<T> paramPredicate)
  {
    predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  public boolean apply(@Nullable T paramT)
  {
    return !predicate.apply(paramT);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof NotPredicate))
    {
      paramObject = (NotPredicate)paramObject;
      return predicate.equals(predicate);
    }
    return false;
  }
  
  public int hashCode()
  {
    return predicate.hashCode() ^ 0xFFFFFFFF;
  }
  
  public String toString()
  {
    return "Predicates.not(" + predicate.toString() + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.NotPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */