package com.google.common.collect;

import com.google.common.base.Function;

class Interners$InternerFunction<E>
  implements Function<E, E>
{
  private final Interner<E> interner;
  
  public Interners$InternerFunction(Interner<E> paramInterner)
  {
    interner = paramInterner;
  }
  
  public E apply(E paramE)
  {
    return (E)interner.intern(paramE);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof InternerFunction))
    {
      paramObject = (InternerFunction)paramObject;
      return interner.equals(interner);
    }
    return false;
  }
  
  public int hashCode()
  {
    return interner.hashCode();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Interners.InternerFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */