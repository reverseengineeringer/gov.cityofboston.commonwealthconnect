package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
abstract interface Constraint<E>
{
  public abstract E checkElement(E paramE);
  
  public abstract String toString();
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraint
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */