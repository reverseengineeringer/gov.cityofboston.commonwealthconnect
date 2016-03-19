package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
final class ByFunctionOrdering<F, T>
  extends Ordering<F>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Function<F, ? extends T> function;
  final Ordering<T> ordering;
  
  ByFunctionOrdering(Function<F, ? extends T> paramFunction, Ordering<T> paramOrdering)
  {
    function = ((Function)Preconditions.checkNotNull(paramFunction));
    ordering = ((Ordering)Preconditions.checkNotNull(paramOrdering));
  }
  
  public int compare(F paramF1, F paramF2)
  {
    return ordering.compare(function.apply(paramF1), function.apply(paramF2));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof ByFunctionOrdering)) {
        break;
      }
      paramObject = (ByFunctionOrdering)paramObject;
    } while ((function.equals(function)) && (ordering.equals(ordering)));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { function, ordering });
  }
  
  public String toString()
  {
    return ordering + ".onResultOf(" + function + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ByFunctionOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */