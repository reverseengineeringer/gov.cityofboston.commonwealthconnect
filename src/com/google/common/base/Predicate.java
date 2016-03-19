package com.google.common.base;

import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@GwtCompatible
public abstract interface Predicate<T>
{
  public abstract boolean apply(@Nullable T paramT);
  
  public abstract boolean equals(@Nullable Object paramObject);
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */