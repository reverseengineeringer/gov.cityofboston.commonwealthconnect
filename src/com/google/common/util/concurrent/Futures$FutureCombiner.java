package com.google.common.util.concurrent;

import com.google.common.base.Optional;
import java.util.List;

abstract interface Futures$FutureCombiner<V, C>
{
  public abstract C combine(List<Optional<V>> paramList);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.FutureCombiner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */