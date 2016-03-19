package com.google.common.cache;

import sun.misc.Unsafe;

final class Striped64$Cell
{
  private static final Unsafe UNSAFE;
  private static final long valueOffset;
  volatile long p0;
  volatile long p1;
  volatile long p2;
  volatile long p3;
  volatile long p4;
  volatile long p5;
  volatile long p6;
  volatile long q0;
  volatile long q1;
  volatile long q2;
  volatile long q3;
  volatile long q4;
  volatile long q5;
  volatile long q6;
  volatile long value;
  
  static
  {
    try
    {
      UNSAFE = Striped64.access$000();
      valueOffset = UNSAFE.objectFieldOffset(Cell.class.getDeclaredField("value"));
      return;
    }
    catch (Exception localException)
    {
      throw new Error(localException);
    }
  }
  
  Striped64$Cell(long paramLong)
  {
    value = paramLong;
  }
  
  final boolean cas(long paramLong1, long paramLong2)
  {
    return UNSAFE.compareAndSwapLong(this, valueOffset, paramLong1, paramLong2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.Striped64.Cell
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */