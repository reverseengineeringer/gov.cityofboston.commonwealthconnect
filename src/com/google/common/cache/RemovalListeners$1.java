package com.google.common.cache;

import java.util.concurrent.Executor;

final class RemovalListeners$1
  implements RemovalListener<K, V>
{
  RemovalListeners$1(Executor paramExecutor, RemovalListener paramRemovalListener) {}
  
  public void onRemoval(final RemovalNotification<K, V> paramRemovalNotification)
  {
    val$executor.execute(new Runnable()
    {
      public void run()
      {
        val$listener.onRemoval(paramRemovalNotification);
      }
    });
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.RemovalListeners.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */