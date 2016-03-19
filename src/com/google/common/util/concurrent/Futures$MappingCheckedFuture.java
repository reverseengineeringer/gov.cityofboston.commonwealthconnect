package com.google.common.util.concurrent;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;

class Futures$MappingCheckedFuture<V, X extends Exception>
  extends AbstractCheckedFuture<V, X>
{
  final Function<Exception, X> mapper;
  
  Futures$MappingCheckedFuture(ListenableFuture<V> paramListenableFuture, Function<Exception, X> paramFunction)
  {
    super(paramListenableFuture);
    mapper = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  protected X mapException(Exception paramException)
  {
    return (Exception)mapper.apply(paramException);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.MappingCheckedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */