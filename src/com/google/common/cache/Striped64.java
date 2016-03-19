package com.google.common.cache;

import java.lang.reflect.Field;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.Random;
import sun.misc.Unsafe;

abstract class Striped64
  extends Number
{
  static final int NCPU = Runtime.getRuntime().availableProcessors();
  private static final Unsafe UNSAFE;
  private static final long baseOffset;
  private static final long busyOffset;
  static final ThreadHashCode threadHashCode = new ThreadHashCode();
  volatile transient long base;
  volatile transient int busy;
  volatile transient Cell[] cells;
  
  static
  {
    try
    {
      UNSAFE = getUnsafe();
      baseOffset = UNSAFE.objectFieldOffset(Striped64.class.getDeclaredField("base"));
      busyOffset = UNSAFE.objectFieldOffset(Striped64.class.getDeclaredField("busy"));
      return;
    }
    catch (Exception localException)
    {
      throw new Error(localException);
    }
  }
  
  private static Unsafe getUnsafe()
  {
    try
    {
      Unsafe localUnsafe1 = Unsafe.getUnsafe();
      return localUnsafe1;
    }
    catch (SecurityException localSecurityException)
    {
      try
      {
        Unsafe localUnsafe2 = (Unsafe)AccessController.doPrivileged(new PrivilegedExceptionAction()
        {
          public Unsafe run()
            throws Exception
          {
            Field[] arrayOfField = Unsafe.class.getDeclaredFields();
            int j = arrayOfField.length;
            int i = 0;
            while (i < j)
            {
              Object localObject = arrayOfField[i];
              ((Field)localObject).setAccessible(true);
              localObject = ((Field)localObject).get(null);
              if (Unsafe.class.isInstance(localObject)) {
                return (Unsafe)Unsafe.class.cast(localObject);
              }
              i += 1;
            }
            throw new NoSuchFieldError("the Unsafe");
          }
        });
        return localUnsafe2;
      }
      catch (PrivilegedActionException localPrivilegedActionException)
      {
        throw new RuntimeException("Could not initialize intrinsics", localPrivilegedActionException.getCause());
      }
    }
  }
  
  final boolean casBase(long paramLong1, long paramLong2)
  {
    return UNSAFE.compareAndSwapLong(this, baseOffset, paramLong1, paramLong2);
  }
  
  final boolean casBusy()
  {
    return UNSAFE.compareAndSwapInt(this, busyOffset, 0, 1);
  }
  
  abstract long fn(long paramLong1, long paramLong2);
  
  final void internalReset(long paramLong)
  {
    Cell[] arrayOfCell = cells;
    base = paramLong;
    if (arrayOfCell != null)
    {
      int j = arrayOfCell.length;
      int i = 0;
      while (i < j)
      {
        Cell localCell = arrayOfCell[i];
        if (localCell != null) {
          value = paramLong;
        }
        i += 1;
      }
    }
  }
  
  final void retryUpdate(long paramLong, HashCode paramHashCode, boolean paramBoolean)
  {
    int k = code;
    int j = 0;
    Object localObject;
    int m;
    Cell[] arrayOfCell;
    for (;;)
    {
      localObject = cells;
      if (localObject == null) {
        break label373;
      }
      m = localObject.length;
      if (m <= 0) {
        break label373;
      }
      arrayOfCell = localObject[(m - 1 & k)];
      if (arrayOfCell != null) {
        break label213;
      }
      if (busy == 0)
      {
        localObject = new Cell(paramLong);
        if ((busy == 0) && (casBusy()))
        {
          m = 0;
          try
          {
            arrayOfCell = cells;
            i = m;
            if (arrayOfCell != null)
            {
              int n = arrayOfCell.length;
              i = m;
              if (n > 0)
              {
                n = n - 1 & k;
                i = m;
                if (arrayOfCell[n] == null)
                {
                  arrayOfCell[n] = localObject;
                  i = 1;
                }
              }
            }
            busy = 0;
            if (i != 0)
            {
              label151:
              code = k;
              return;
            }
          }
          finally
          {
            busy = 0;
          }
        }
      }
    }
    int i = 0;
    boolean bool = paramBoolean;
    label213:
    long l;
    label294:
    do
    {
      do
      {
        for (;;)
        {
          j = k ^ k << 13;
          j ^= j >>> 17;
          k = j ^ j << 5;
          j = i;
          paramBoolean = bool;
          break;
          if (!paramBoolean)
          {
            bool = true;
            i = j;
          }
          else
          {
            l = value;
            if (arrayOfCell.cas(l, fn(l, paramLong))) {
              break label151;
            }
            if ((m >= NCPU) || (cells != localObject))
            {
              i = 0;
              bool = paramBoolean;
            }
            else
            {
              if (j != 0) {
                break label294;
              }
              i = 1;
              bool = paramBoolean;
            }
          }
        }
        i = j;
        bool = paramBoolean;
      } while (busy != 0);
      i = j;
      bool = paramBoolean;
    } while (!casBusy());
    for (;;)
    {
      try
      {
        if (cells == localObject)
        {
          arrayOfCell = new Cell[m << 1];
          i = 0;
          break label484;
          cells = arrayOfCell;
        }
        busy = 0;
        j = 0;
        break;
      }
      finally
      {
        busy = 0;
      }
      label373:
      if ((busy == 0) && (cells == localObject) && (casBusy())) {
        i = 0;
      }
      try
      {
        if (cells == localObject)
        {
          localObject = new Cell[2];
          localObject[(k & 0x1)] = new Cell(paramLong);
          cells = ((Cell[])localObject);
          i = 1;
        }
        busy = 0;
        if (i == 0) {
          break;
        }
      }
      finally
      {
        busy = 0;
      }
      if (!casBase(l, fn(l, paramLong))) {
        break;
      }
      break label151;
      label484:
      while (i < m)
      {
        arrayOfCell[i] = localObject[i];
        i += 1;
      }
    }
  }
  
  static final class Cell
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
    
    Cell(long paramLong)
    {
      value = paramLong;
    }
    
    final boolean cas(long paramLong1, long paramLong2)
    {
      return UNSAFE.compareAndSwapLong(this, valueOffset, paramLong1, paramLong2);
    }
  }
  
  static final class HashCode
  {
    static final Random rng = new Random();
    int code;
    
    HashCode()
    {
      int j = rng.nextInt();
      int i = j;
      if (j == 0) {
        i = 1;
      }
      code = i;
    }
  }
  
  static final class ThreadHashCode
    extends ThreadLocal<Striped64.HashCode>
  {
    public Striped64.HashCode initialValue()
    {
      return new Striped64.HashCode();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.Striped64
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */