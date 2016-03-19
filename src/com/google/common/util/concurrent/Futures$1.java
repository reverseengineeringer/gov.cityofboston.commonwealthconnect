package com.google.common.util.concurrent;

import com.google.common.base.Function;

final class Futures$1
  implements AsyncFunction<I, O>
{
  Futures$1(Function paramFunction) {}
  
  public ListenableFuture<O> apply(I paramI)
  {
    return Futures.immediateFuture(val$function.apply(paramI));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */