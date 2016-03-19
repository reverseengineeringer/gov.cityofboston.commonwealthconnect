package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Equivalence$EquivalentToPredicate<T>
  implements Predicate<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Equivalence<T> equivalence;
  @Nullable
  private final T target;
  
  Equivalence$EquivalentToPredicate(Equivalence<T> paramEquivalence, @Nullable T paramT)
  {
    equivalence = ((Equivalence)Preconditions.checkNotNull(paramEquivalence));
    target = paramT;
  }
  
  public boolean apply(@Nullable T paramT)
  {
    return equivalence.equivalent(paramT, target);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof EquivalentToPredicate)) {
        break;
      }
      paramObject = (EquivalentToPredicate)paramObject;
    } while ((equivalence.equals(equivalence)) && (Objects.equal(target, target)));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { equivalence, target });
  }
  
  public String toString()
  {
    return equivalence + ".equivalentTo(" + target + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Equivalence.EquivalentToPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */