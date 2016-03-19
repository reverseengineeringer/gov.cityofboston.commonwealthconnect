package com.google.common.collect;

import com.google.common.base.Function;

class FluentIterable$FromIterableFunction<E>
  implements Function<Iterable<E>, FluentIterable<E>>
{
  public FluentIterable<E> apply(Iterable<E> paramIterable)
  {
    return FluentIterable.from(paramIterable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FluentIterable.FromIterableFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */