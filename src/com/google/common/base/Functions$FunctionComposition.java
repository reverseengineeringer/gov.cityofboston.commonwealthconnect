package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Functions$FunctionComposition<A, B, C>
  implements Function<A, C>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Function<A, ? extends B> f;
  private final Function<B, C> g;
  
  public Functions$FunctionComposition(Function<B, C> paramFunction, Function<A, ? extends B> paramFunction1)
  {
    g = ((Function)Preconditions.checkNotNull(paramFunction));
    f = ((Function)Preconditions.checkNotNull(paramFunction1));
  }
  
  public C apply(@Nullable A paramA)
  {
    return (C)g.apply(f.apply(paramA));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof FunctionComposition))
    {
      paramObject = (FunctionComposition)paramObject;
      bool1 = bool2;
      if (f.equals(f))
      {
        bool1 = bool2;
        if (g.equals(g)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return f.hashCode() ^ g.hashCode();
  }
  
  public String toString()
  {
    return g + "(" + f + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions.FunctionComposition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */