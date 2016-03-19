package com.google.common.util.concurrent;

import com.google.common.base.Function;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

final class Futures$2
  implements Future<O>
{
  Futures$2(Future paramFuture, Function paramFunction) {}
  
  private O applyTransformation(I paramI)
    throws ExecutionException
  {
    try
    {
      paramI = val$function.apply(paramI);
      return paramI;
    }
    catch (Throwable paramI)
    {
      throw new ExecutionException(paramI);
    }
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    return val$input.cancel(paramBoolean);
  }
  
  public O get()
    throws InterruptedException, ExecutionException
  {
    return (O)applyTransformation(val$input.get());
  }
  
  public O get(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, TimeoutException
  {
    return (O)applyTransformation(val$input.get(paramLong, paramTimeUnit));
  }
  
  public boolean isCancelled()
  {
    return val$input.isCancelled();
  }
  
  public boolean isDone()
  {
    return val$input.isDone();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */