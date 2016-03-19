package com.google.common.util.concurrent;

import java.util.concurrent.ExecutionException;

class Futures$ImmediateFailedFuture<V>
  extends Futures.ImmediateFuture<V>
{
  private final Throwable thrown;
  
  Futures$ImmediateFailedFuture(Throwable paramThrowable)
  {
    super(null);
    thrown = paramThrowable;
  }
  
  public V get()
    throws ExecutionException
  {
    throw new ExecutionException(thrown);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ImmediateFailedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */