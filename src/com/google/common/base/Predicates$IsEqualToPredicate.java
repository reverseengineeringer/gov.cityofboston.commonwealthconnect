package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Predicates$IsEqualToPredicate<T>
  implements Predicate<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final T target;
  
  private Predicates$IsEqualToPredicate(T paramT)
  {
    target = paramT;
  }
  
  public boolean apply(T paramT)
  {
    return target.equals(paramT);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof IsEqualToPredicate))
    {
      paramObject = (IsEqualToPredicate)paramObject;
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
    return "Predicates.equalTo(" + target + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.IsEqualToPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */