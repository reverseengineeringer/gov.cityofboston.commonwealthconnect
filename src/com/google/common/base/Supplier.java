package com.google.common.base;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
public abstract interface Supplier<T>
{
  public abstract T get();
}

/* Location:
 * Qualified Name:     com.google.common.base.Supplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */