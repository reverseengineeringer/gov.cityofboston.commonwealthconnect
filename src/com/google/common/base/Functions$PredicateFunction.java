package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Functions$PredicateFunction<T>
  implements Function<T, Boolean>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Predicate<T> predicate;
  
  private Functions$PredicateFunction(Predicate<T> paramPredicate)
  {
    predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  public Boolean apply(@Nullable T paramT)
  {
    return Boolean.valueOf(predicate.apply(paramT));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof PredicateFunction))
    {
      paramObject = (PredicateFunction)paramObject;
      return predicate.equals(predicate);
    }
    return false;
  }
  
  public int hashCode()
  {
    return predicate.hashCode();
  }
  
  public String toString()
  {
    return "forPredicate(" + predicate + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions.PredicateFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */