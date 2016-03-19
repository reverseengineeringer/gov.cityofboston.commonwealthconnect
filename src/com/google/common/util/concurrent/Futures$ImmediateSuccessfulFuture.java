package com.google.common.util.concurrent;

import javax.annotation.Nullable;

class Futures$ImmediateSuccessfulFuture<V>
  extends Futures.ImmediateFuture<V>
{
  @Nullable
  private final V value;
  
  Futures$ImmediateSuccessfulFuture(@Nullable V paramV)
  {
    super(null);
    value = paramV;
  }
  
  public V get()
  {
    return (V)value;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ImmediateSuccessfulFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */