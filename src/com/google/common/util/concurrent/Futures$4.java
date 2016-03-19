package com.google.common.util.concurrent;

import java.util.concurrent.ConcurrentLinkedQueue;

final class Futures$4
  implements Runnable
{
  Futures$4(ConcurrentLinkedQueue paramConcurrentLinkedQueue, ListenableFuture paramListenableFuture) {}
  
  public void run()
  {
    ((AsyncSettableFuture)val$delegates.remove()).setFuture(val$future);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */