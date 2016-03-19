package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;

final class MoreExecutors$3
  extends WrappingExecutorService
{
  MoreExecutors$3(ExecutorService paramExecutorService, Supplier paramSupplier)
  {
    super(paramExecutorService);
  }
  
  protected Runnable wrapTask(Runnable paramRunnable)
  {
    return Callables.threadRenaming(paramRunnable, val$nameSupplier);
  }
  
  protected <T> Callable<T> wrapTask(Callable<T> paramCallable)
  {
    return Callables.threadRenaming(paramCallable, val$nameSupplier);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */