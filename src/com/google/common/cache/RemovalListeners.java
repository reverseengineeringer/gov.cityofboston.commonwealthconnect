package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.concurrent.Executor;

@Beta
public final class RemovalListeners
{
  public static <K, V> RemovalListener<K, V> asynchronous(final RemovalListener<K, V> paramRemovalListener, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramRemovalListener);
    Preconditions.checkNotNull(paramExecutor);
    new RemovalListener()
    {
      public void onRemoval(final RemovalNotification<K, V> paramAnonymousRemovalNotification)
      {
        val$executor.execute(new Runnable()
        {
          public void run()
          {
            val$listener.onRemoval(paramAnonymousRemovalNotification);
          }
        });
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.RemovalListeners
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */