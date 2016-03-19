package com.google.common.cache;

import java.util.concurrent.atomic.AtomicLong;

final class LongAddables$PureJavaLongAddable
  extends AtomicLong
  implements LongAddable
{
  public void add(long paramLong)
  {
    getAndAdd(paramLong);
  }
  
  public void increment()
  {
    getAndIncrement();
  }
  
  public long sum()
  {
    return get();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LongAddables.PureJavaLongAddable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */