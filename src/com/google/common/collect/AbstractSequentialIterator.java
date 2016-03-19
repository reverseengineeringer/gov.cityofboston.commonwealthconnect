package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.NoSuchElementException;
import javax.annotation.Nullable;

@GwtCompatible
public abstract class AbstractSequentialIterator<T>
  extends UnmodifiableIterator<T>
{
  private T nextOrNull;
  
  protected AbstractSequentialIterator(@Nullable T paramT)
  {
    nextOrNull = paramT;
  }
  
  protected abstract T computeNext(T paramT);
  
  public final boolean hasNext()
  {
    return nextOrNull != null;
  }
  
  public final T next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    try
    {
      Object localObject1 = nextOrNull;
      return (T)localObject1;
    }
    finally
    {
      nextOrNull = computeNext(nextOrNull);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractSequentialIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */