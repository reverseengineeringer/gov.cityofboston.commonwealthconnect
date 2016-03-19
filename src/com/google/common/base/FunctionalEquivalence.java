package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
final class FunctionalEquivalence<F, T>
  extends Equivalence<F>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final Function<F, ? extends T> function;
  private final Equivalence<T> resultEquivalence;
  
  FunctionalEquivalence(Function<F, ? extends T> paramFunction, Equivalence<T> paramEquivalence)
  {
    function = ((Function)Preconditions.checkNotNull(paramFunction));
    resultEquivalence = ((Equivalence)Preconditions.checkNotNull(paramEquivalence));
  }
  
  protected boolean doEquivalent(F paramF1, F paramF2)
  {
    return resultEquivalence.equivalent(function.apply(paramF1), function.apply(paramF2));
  }
  
  protected int doHash(F paramF)
  {
    return resultEquivalence.hash(function.apply(paramF));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof FunctionalEquivalence)) {
        break;
      }
      paramObject = (FunctionalEquivalence)paramObject;
    } while ((function.equals(function)) && (resultEquivalence.equals(resultEquivalence)));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { function, resultEquivalence });
  }
  
  public String toString()
  {
    return resultEquivalence + ".onResultOf(" + function + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.FunctionalEquivalence
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */