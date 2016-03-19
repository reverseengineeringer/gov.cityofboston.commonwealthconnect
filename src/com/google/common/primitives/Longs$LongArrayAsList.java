package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Longs$LongArrayAsList
  extends AbstractList<Long>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final long[] array;
  final int end;
  final int start;
  
  Longs$LongArrayAsList(long[] paramArrayOfLong)
  {
    this(paramArrayOfLong, 0, paramArrayOfLong.length);
  }
  
  Longs$LongArrayAsList(long[] paramArrayOfLong, int paramInt1, int paramInt2)
  {
    array = paramArrayOfLong;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Long)) && (Longs.access$000(array, ((Long)paramObject).longValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof LongArrayAsList)) {
        break;
      }
      paramObject = (LongArrayAsList)paramObject;
      int j = size();
      if (((LongArrayAsList)paramObject).size() != j) {
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
  
  public Long get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Long.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Longs.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Long))
    {
      int i = Longs.access$000(array, ((Long)paramObject).longValue(), start, end);
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
    if ((paramObject instanceof Long))
    {
      int i = Longs.access$100(array, ((Long)paramObject).longValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Long set(int paramInt, Long paramLong)
  {
    Preconditions.checkElementIndex(paramInt, size());
    long l = array[(start + paramInt)];
    array[(start + paramInt)] = ((Long)Preconditions.checkNotNull(paramLong)).longValue();
    return Long.valueOf(l);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Long> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new LongArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  long[] toLongArray()
  {
    int i = size();
    long[] arrayOfLong = new long[i];
    System.arraycopy(array, start, arrayOfLong, 0, i);
    return arrayOfLong;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(size() * 10);
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
 * Qualified Name:     com.google.common.primitives.Longs.LongArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */