package com.google.common.util.concurrent;

import java.util.concurrent.CancellationException;

class Futures$ImmediateCancelledFuture<V>
  extends Futures.ImmediateFuture<V>
{
  private final CancellationException thrown = new CancellationException("Immediate cancelled future.");
  
  Futures$ImmediateCancelledFuture()
  {
    super(null);
  }
  
  public V get()
  {
    throw AbstractFuture.cancellationExceptionWithCause("Task was cancelled.", thrown);
  }
  
  public boolean isCancelled()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ImmediateCancelledFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */