package com.google.common.base;

import java.io.Serializable;
import java.util.Collection;
import javax.annotation.Nullable;

class Predicates$InPredicate<T>
  implements Predicate<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Collection<?> target;
  
  private Predicates$InPredicate(Collection<?> paramCollection)
  {
    target = ((Collection)Preconditions.checkNotNull(paramCollection));
  }
  
  public boolean apply(@Nullable T paramT)
  {
    try
    {
      boolean bool = target.contains(paramT);
      return bool;
    }
    catch (NullPointerException paramT)
    {
      return false;
    }
    catch (ClassCastException paramT) {}
    return false;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof InPredicate))
    {
      paramObject = (InPredicate)paramObject;
      return target.equals(target);
    }
    return false;
  }
  
  public int hashCode()
  {
    return target.hashCode();
  }
  
  public String toString()
  {
    return "Predicates.in(" + target + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.InPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */