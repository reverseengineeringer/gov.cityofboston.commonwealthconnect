package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Shorts$ShortArrayAsList
  extends AbstractList<Short>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final short[] array;
  final int end;
  final int start;
  
  Shorts$ShortArrayAsList(short[] paramArrayOfShort)
  {
    this(paramArrayOfShort, 0, paramArrayOfShort.length);
  }
  
  Shorts$ShortArrayAsList(short[] paramArrayOfShort, int paramInt1, int paramInt2)
  {
    array = paramArrayOfShort;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Short)) && (Shorts.access$000(array, ((Short)paramObject).shortValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof ShortArrayAsList)) {
        break;
      }
      paramObject = (ShortArrayAsList)paramObject;
      int j = size();
      if (((ShortArrayAsList)paramObject).size() != j) {
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
  
  public Short get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Short.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Shorts.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Short))
    {
      int i = Shorts.access$000(array, ((Short)paramObject).shortValue(), start, end);
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
    if ((paramObject instanceof Short))
    {
      int i = Shorts.access$100(array, ((Short)paramObject).shortValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Short set(int paramInt, Short paramShort)
  {
    Preconditions.checkElementIndex(paramInt, size());
    short s = array[(start + paramInt)];
    array[(start + paramInt)] = ((Short)Preconditions.checkNotNull(paramShort)).shortValue();
    return Short.valueOf(s);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Short> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new ShortArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  short[] toShortArray()
  {
    int i = size();
    short[] arrayOfShort = new short[i];
    System.arraycopy(array, start, arrayOfShort, 0, i);
    return arrayOfShort;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(size() * 6);
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
 * Qualified Name:     com.google.common.primitives.Shorts.ShortArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */