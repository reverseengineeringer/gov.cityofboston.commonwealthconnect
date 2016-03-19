package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Iterator;

@GwtCompatible
abstract class TransformedIterator<F, T>
  implements Iterator<T>
{
  final Iterator<? extends F> backingIterator;
  
  TransformedIterator(Iterator<? extends F> paramIterator)
  {
    backingIterator = ((Iterator)Preconditions.checkNotNull(paramIterator));
  }
  
  public final boolean hasNext()
  {
    return backingIterator.hasNext();
  }
  
  public final T next()
  {
    return (T)transform(backingIterator.next());
  }
  
  public final void remove()
  {
    backingIterator.remove();
  }
  
  abstract T transform(F paramF);
}

/* Location:
 * Qualified Name:     com.google.common.collect.TransformedIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */