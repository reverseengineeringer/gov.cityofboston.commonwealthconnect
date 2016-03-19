package com.google.common.cache;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
abstract interface LongAddable
{
  public abstract void add(long paramLong);
  
  public abstract void increment();
  
  public abstract long sum();
}

/* Location:
 * Qualified Name:     com.google.common.cache.LongAddable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */