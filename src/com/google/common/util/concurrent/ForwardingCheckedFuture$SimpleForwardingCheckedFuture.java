package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;

@Beta
public abstract class ForwardingCheckedFuture$SimpleForwardingCheckedFuture<V, X extends Exception>
  extends ForwardingCheckedFuture<V, X>
{
  private final CheckedFuture<V, X> delegate;
  
  protected ForwardingCheckedFuture$SimpleForwardingCheckedFuture(CheckedFuture<V, X> paramCheckedFuture)
  {
    delegate = ((CheckedFuture)Preconditions.checkNotNull(paramCheckedFuture));
  }
  
  protected final CheckedFuture<V, X> delegate()
  {
    return delegate;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ForwardingCheckedFuture.SimpleForwardingCheckedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */