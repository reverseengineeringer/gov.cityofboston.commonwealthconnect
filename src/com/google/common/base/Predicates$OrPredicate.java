package com.google.common.base;

import java.io.Serializable;
import java.util.List;
import javax.annotation.Nullable;

class Predicates$OrPredicate<T>
  implements Predicate<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final List<? extends Predicate<? super T>> components;
  
  private Predicates$OrPredicate(List<? extends Predicate<? super T>> paramList)
  {
    components = paramList;
  }
  
  public boolean apply(@Nullable T paramT)
  {
    int i = 0;
    while (i < components.size())
    {
      if (((Predicate)components.get(i)).apply(paramT)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof OrPredicate))
    {
      paramObject = (OrPredicate)paramObject;
      return components.equals(components);
    }
    return false;
  }
  
  public int hashCode()
  {
    return components.hashCode() + 87855567;
  }
  
  public String toString()
  {
    return "Predicates.or(" + Predicates.access$800().join(components) + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.OrPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */