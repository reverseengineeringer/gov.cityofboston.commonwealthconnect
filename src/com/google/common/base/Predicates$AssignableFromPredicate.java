package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import javax.annotation.Nullable;

@GwtIncompatible("Class.isAssignableFrom")
class Predicates$AssignableFromPredicate
  implements Predicate<Class<?>>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Class<?> clazz;
  
  private Predicates$AssignableFromPredicate(Class<?> paramClass)
  {
    clazz = ((Class)Preconditions.checkNotNull(paramClass));
  }
  
  public boolean apply(Class<?> paramClass)
  {
    return clazz.isAssignableFrom(paramClass);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof AssignableFromPredicate))
    {
      paramObject = (AssignableFromPredicate)paramObject;
      bool1 = bool2;
      if (clazz == clazz) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return clazz.hashCode();
  }
  
  public String toString()
  {
    return "Predicates.assignableFrom(" + clazz.getName() + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.AssignableFromPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */