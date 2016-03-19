package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Iterator;

@GwtCompatible
public abstract class UnmodifiableIterator<E>
  implements Iterator<E>
{
  @Deprecated
  public final void remove()
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.UnmodifiableIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */