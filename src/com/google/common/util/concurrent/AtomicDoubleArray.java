package com.google.common.util.concurrent;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.concurrent.atomic.AtomicLongArray;

public class AtomicDoubleArray
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private transient AtomicLongArray longs;
  
  public AtomicDoubleArray(int paramInt)
  {
    longs = new AtomicLongArray(paramInt);
  }
  
  public AtomicDoubleArray(double[] paramArrayOfDouble)
  {
    int j = paramArrayOfDouble.length;
    long[] arrayOfLong = new long[j];
    int i = 0;
    while (i < j)
    {
      arrayOfLong[i] = Double.doubleToRawLongBits(paramArrayOfDouble[i]);
      i += 1;
    }
    longs = new AtomicLongArray(arrayOfLong);
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    int j = paramObjectInputStream.readInt();
    longs = new AtomicLongArray(j);
    int i = 0;
    while (i < j)
    {
      set(i, paramObjectInputStream.readDouble());
      i += 1;
    }
  }
  
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    int j = length();
    paramObjectOutputStream.writeInt(j);
    int i = 0;
    while (i < j)
    {
      paramObjectOutputStream.writeDouble(get(i));
      i += 1;
    }
  }
  
  public double addAndGet(int paramInt, double paramDouble)
  {
    long l1;
    double d;
    long l2;
    do
    {
      l1 = longs.get(paramInt);
      d = Double.longBitsToDouble(l1) + paramDouble;
      l2 = Double.doubleToRawLongBits(d);
    } while (!longs.compareAndSet(paramInt, l1, l2));
    return d;
  }
  
  public final boolean compareAndSet(int paramInt, double paramDouble1, double paramDouble2)
  {
    return longs.compareAndSet(paramInt, Double.doubleToRawLongBits(paramDouble1), Double.doubleToRawLongBits(paramDouble2));
  }
  
  public final double get(int paramInt)
  {
    return Double.longBitsToDouble(longs.get(paramInt));
  }
  
  public final double getAndAdd(int paramInt, double paramDouble)
  {
    long l1;
    double d;
    long l2;
    do
    {
      l1 = longs.get(paramInt);
      d = Double.longBitsToDouble(l1);
      l2 = Double.doubleToRawLongBits(d + paramDouble);
    } while (!longs.compareAndSet(paramInt, l1, l2));
    return d;
  }
  
  public final double getAndSet(int paramInt, double paramDouble)
  {
    long l = Double.doubleToRawLongBits(paramDouble);
    return Double.longBitsToDouble(longs.getAndSet(paramInt, l));
  }
  
  public final void lazySet(int paramInt, double paramDouble)
  {
    set(paramInt, paramDouble);
  }
  
  public final int length()
  {
    return longs.length();
  }
  
  public final void set(int paramInt, double paramDouble)
  {
    long l = Double.doubleToRawLongBits(paramDouble);
    longs.set(paramInt, l);
  }
  
  public String toString()
  {
    int j = length() - 1;
    if (j == -1) {
      return "[]";
    }
    StringBuilder localStringBuilder = new StringBuilder((j + 1) * 19);
    localStringBuilder.append('[');
    int i = 0;
    for (;;)
    {
      localStringBuilder.append(Double.longBitsToDouble(longs.get(i)));
      if (i == j) {
        return ']';
      }
      localStringBuilder.append(',').append(' ');
      i += 1;
    }
  }
  
  public final boolean weakCompareAndSet(int paramInt, double paramDouble1, double paramDouble2)
  {
    return longs.weakCompareAndSet(paramInt, Double.doubleToRawLongBits(paramDouble1), Double.doubleToRawLongBits(paramDouble2));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AtomicDoubleArray
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */