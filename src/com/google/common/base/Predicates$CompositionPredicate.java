package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Predicates$CompositionPredicate<A, B>
  implements Predicate<A>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Function<A, ? extends B> f;
  final Predicate<B> p;
  
  private Predicates$CompositionPredicate(Predicate<B> paramPredicate, Function<A, ? extends B> paramFunction)
  {
    p = ((Predicate)Preconditions.checkNotNull(paramPredicate));
    f = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  public boolean apply(@Nullable A paramA)
  {
    return p.apply(f.apply(paramA));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof CompositionPredicate))
    {
      paramObject = (CompositionPredicate)paramObject;
      bool1 = bool2;
      if (f.equals(f))
      {
        bool1 = bool2;
        if (p.equals(p)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return f.hashCode() ^ p.hashCode();
  }
  
  public String toString()
  {
    return p.toString() + "(" + f.toString() + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.CompositionPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */