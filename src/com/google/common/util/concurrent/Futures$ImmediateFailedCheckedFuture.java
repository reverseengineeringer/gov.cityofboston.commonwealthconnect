package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

class Futures$ImmediateFailedCheckedFuture<V, X extends Exception>
  extends Futures.ImmediateFuture<V>
  implements CheckedFuture<V, X>
{
  private final X thrown;
  
  Futures$ImmediateFailedCheckedFuture(X paramX)
  {
    super(null);
    thrown = paramX;
  }
  
  public V checkedGet()
    throws Exception
  {
    throw thrown;
  }
  
  public V checkedGet(long paramLong, TimeUnit paramTimeUnit)
    throws Exception
  {
    Preconditions.checkNotNull(paramTimeUnit);
    throw thrown;
  }
  
  public V get()
    throws ExecutionException
  {
    throw new ExecutionException(thrown);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ImmediateFailedCheckedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */