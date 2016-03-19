package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import java.util.concurrent.Executor;

final class MoreExecutors$2
  implements Executor
{
  MoreExecutors$2(Executor paramExecutor, Supplier paramSupplier) {}
  
  public void execute(Runnable paramRunnable)
  {
    val$executor.execute(Callables.threadRenaming(paramRunnable, val$nameSupplier));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */