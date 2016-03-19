package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

public final class Equivalence$Wrapper<T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final Equivalence<? super T> equivalence;
  @Nullable
  private final T reference;
  
  private Equivalence$Wrapper(Equivalence<? super T> paramEquivalence, @Nullable T paramT)
  {
    equivalence = ((Equivalence)Preconditions.checkNotNull(paramEquivalence));
    reference = paramT;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject instanceof Wrapper))
    {
      paramObject = (Wrapper)paramObject;
      if (equivalence.equals(equivalence)) {
        return equivalence.equivalent(reference, reference);
      }
    }
    return false;
  }
  
  @Nullable
  public T get()
  {
    return (T)reference;
  }
  
  public int hashCode()
  {
    return equivalence.hash(reference);
  }
  
  public String toString()
  {
    return equivalence + ".wrap(" + reference + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Equivalence.Wrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */