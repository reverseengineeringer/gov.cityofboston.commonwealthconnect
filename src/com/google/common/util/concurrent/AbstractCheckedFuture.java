package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Beta
public abstract class AbstractCheckedFuture<V, X extends Exception>
  extends ForwardingListenableFuture.SimpleForwardingListenableFuture<V>
  implements CheckedFuture<V, X>
{
  protected AbstractCheckedFuture(ListenableFuture<V> paramListenableFuture)
  {
    super(paramListenableFuture);
  }
  
  public V checkedGet()
    throws Exception
  {
    try
    {
      Object localObject = get();
      return (V)localObject;
    }
    catch (InterruptedException localInterruptedException)
    {
      Thread.currentThread().interrupt();
      throw mapException(localInterruptedException);
    }
    catch (CancellationException localCancellationException)
    {
      throw mapException(localCancellationException);
    }
    catch (ExecutionException localExecutionException)
    {
      throw mapException(localExecutionException);
    }
  }
  
  public V checkedGet(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException, Exception
  {
    try
    {
      paramTimeUnit = get(paramLong, paramTimeUnit);
      return paramTimeUnit;
    }
    catch (InterruptedException paramTimeUnit)
    {
      Thread.currentThread().interrupt();
      throw mapException(paramTimeUnit);
    }
    catch (CancellationException paramTimeUnit)
    {
      throw mapException(paramTimeUnit);
    }
    catch (ExecutionException paramTimeUnit)
    {
      throw mapException(paramTimeUnit);
    }
  }
  
  protected abstract X mapException(Exception paramException);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractCheckedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */