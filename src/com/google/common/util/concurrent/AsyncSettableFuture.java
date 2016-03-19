package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

final class AsyncSettableFuture<V>
  extends ForwardingListenableFuture<V>
{
  private final ListenableFuture<V> dereferenced = Futures.dereference(nested);
  private final NestedFuture<V> nested = new NestedFuture(null);
  
  public static <V> AsyncSettableFuture<V> create()
  {
    return new AsyncSettableFuture();
  }
  
  protected ListenableFuture<V> delegate()
  {
    return dereferenced;
  }
  
  public boolean isSet()
  {
    return nested.isDone();
  }
  
  public boolean setException(Throwable paramThrowable)
  {
    return setFuture(Futures.immediateFailedFuture(paramThrowable));
  }
  
  public boolean setFuture(ListenableFuture<? extends V> paramListenableFuture)
  {
    return nested.setFuture((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
  }
  
  public boolean setValue(@Nullable V paramV)
  {
    return setFuture(Futures.immediateFuture(paramV));
  }
  
  private static final class NestedFuture<V>
    extends AbstractFuture<ListenableFuture<? extends V>>
  {
    boolean setFuture(ListenableFuture<? extends V> paramListenableFuture)
    {
      boolean bool = set(paramListenableFuture);
      if (isCancelled()) {
        paramListenableFuture.cancel(wasInterrupted());
      }
      return bool;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AsyncSettableFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */