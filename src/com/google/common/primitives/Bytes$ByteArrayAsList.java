package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Bytes$ByteArrayAsList
  extends AbstractList<Byte>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final byte[] array;
  final int end;
  final int start;
  
  Bytes$ByteArrayAsList(byte[] paramArrayOfByte)
  {
    this(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  Bytes$ByteArrayAsList(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    array = paramArrayOfByte;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Byte)) && (Bytes.access$000(array, ((Byte)paramObject).byteValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof ByteArrayAsList)) {
        break;
      }
      paramObject = (ByteArrayAsList)paramObject;
      int j = size();
      if (((ByteArrayAsList)paramObject).size() != j) {
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
  
  public Byte get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Byte.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Bytes.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Byte))
    {
      int i = Bytes.access$000(array, ((Byte)paramObject).byteValue(), start, end);
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
    if ((paramObject instanceof Byte))
    {
      int i = Bytes.access$100(array, ((Byte)paramObject).byteValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Byte set(int paramInt, Byte paramByte)
  {
    Preconditions.checkElementIndex(paramInt, size());
    byte b = array[(start + paramInt)];
    array[(start + paramInt)] = ((Byte)Preconditions.checkNotNull(paramByte)).byteValue();
    return Byte.valueOf(b);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Byte> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new ByteArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  byte[] toByteArray()
  {
    int i = size();
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(array, start, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(size() * 5);
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
 * Qualified Name:     com.google.common.primitives.Bytes.ByteArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */