package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Doubles$DoubleArrayAsList
  extends AbstractList<Double>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final double[] array;
  final int end;
  final int start;
  
  Doubles$DoubleArrayAsList(double[] paramArrayOfDouble)
  {
    this(paramArrayOfDouble, 0, paramArrayOfDouble.length);
  }
  
  Doubles$DoubleArrayAsList(double[] paramArrayOfDouble, int paramInt1, int paramInt2)
  {
    array = paramArrayOfDouble;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Double)) && (Doubles.access$000(array, ((Double)paramObject).doubleValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof DoubleArrayAsList)) {
        break;
      }
      paramObject = (DoubleArrayAsList)paramObject;
      int j = size();
      if (((DoubleArrayAsList)paramObject).size() != j) {
        return false;
      }
      int i = 0;
      while (i < j)
      {
        if (array[(start + i)] != array[(start + i)]) {
          return false;
        }
        i += 1;
      }
    }
    return super.equals(paramObject);
  }
  
  public Double get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Double.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Doubles.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Double))
    {
      int i = Doubles.access$000(array, ((Double)paramObject).doubleValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public int lastIndexOf(Object paramObject)
  {
    if ((paramObject instanceof Double))
    {
      int i = Doubles.access$100(array, ((Double)paramObject).doubleValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Double set(int paramInt, Double paramDouble)
  {
    Preconditions.checkElementIndex(paramInt, size());
    double d = array[(start + paramInt)];
    array[(start + paramInt)] = ((Double)Preconditions.checkNotNull(paramDouble)).doubleValue();
    return Double.valueOf(d);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Double> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new DoubleArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  double[] toDoubleArray()
  {
    int i = size();
    double[] arrayOfDouble = new double[i];
    System.arraycopy(array, start, arrayOfDouble, 0, i);
    return arrayOfDouble;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(size() * 12);
    localStringBuilder.append('[').append(array[start]);
    int i = start + 1;
    while (i < end)
    {
      localStringBuilder.append(", ").append(array[i]);
      i += 1;
    }
    return ']';
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Doubles.DoubleArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */