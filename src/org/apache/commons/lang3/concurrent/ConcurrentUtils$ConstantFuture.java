package org.apache.commons.lang3.concurrent;

import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

final class ConcurrentUtils$ConstantFuture<T>
  implements Future<T>
{
  private final T value;
  
  ConcurrentUtils$ConstantFuture(T paramT)
  {
    value = paramT;
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    return false;
  }
  
  public T get()
  {
    return (T)value;
  }
  
  public T get(long paramLong, TimeUnit paramTimeUnit)
  {
    return (T)value;
  }
  
  public boolean isCancelled()
  {
    return false;
  }
  
  public boolean isDone()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.concurrent.ConcurrentUtils.ConstantFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */