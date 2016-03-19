package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;

final class Iterators$8
  extends TransformedIterator<F, T>
{
  Iterators$8(Iterator paramIterator, Function paramFunction)
  {
    super(paramIterator);
  }
  
  T transform(F paramF)
  {
    return (T)val$function.apply(paramF);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */