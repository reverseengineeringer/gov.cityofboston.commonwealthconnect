package com.google.common.util.concurrent;

import com.google.common.collect.ImmutableCollection;
import java.util.Iterator;

class Futures$CombinedFuture$1
  implements Runnable
{
  Futures$CombinedFuture$1(Futures.CombinedFuture paramCombinedFuture) {}
  
  public void run()
  {
    if (this$0.isCancelled())
    {
      Iterator localIterator = this$0.futures.iterator();
      while (localIterator.hasNext()) {
        ((ListenableFuture)localIterator.next()).cancel(this$0.wasInterrupted());
      }
    }
    this$0.futures = null;
    this$0.values = null;
    this$0.combiner = null;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.CombinedFuture.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */