package com.squareup.okhttp.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class BitArray$VariableCapacity
  implements BitArray
{
  long[] data;
  private int start;
  
  public BitArray$VariableCapacity()
  {
    data = new long[1];
  }
  
  private BitArray$VariableCapacity(BitArray.FixedCapacity paramFixedCapacity)
  {
    data = new long[] { data, 0L };
  }
  
  private static int checkInput(int paramInt)
  {
    if (paramInt < 0) {
      throw new IllegalArgumentException(String.format("input must be a positive number: %s", new Object[] { Integer.valueOf(paramInt) }));
    }
    return paramInt;
  }
  
  private void growToSize(int paramInt)
  {
    long[] arrayOfLong = new long[paramInt];
    if (data != null) {
      System.arraycopy(data, 0, arrayOfLong, 0, data.length);
    }
    data = arrayOfLong;
  }
  
  private int offsetOf(int paramInt)
  {
    paramInt = (paramInt + start) / 64;
    if (paramInt > data.length - 1) {
      growToSize(paramInt + 1);
    }
    return paramInt;
  }
  
  private int shiftOf(int paramInt)
  {
    return (start + paramInt) % 64;
  }
  
  public void clear()
  {
    Arrays.fill(data, 0L);
  }
  
  public boolean get(int paramInt)
  {
    checkInput(paramInt);
    int i = offsetOf(paramInt);
    return (data[i] & 1L << shiftOf(paramInt)) != 0L;
  }
  
  public void set(int paramInt)
  {
    checkInput(paramInt);
    int i = offsetOf(paramInt);
    long[] arrayOfLong = data;
    arrayOfLong[i] |= 1L << shiftOf(paramInt);
  }
  
  public void shiftLeft(int paramInt)
  {
    start -= checkInput(paramInt);
    if (start < 0)
    {
      paramInt = start / -64 + 1;
      long[] arrayOfLong = new long[data.length + paramInt];
      System.arraycopy(data, 0, arrayOfLong, paramInt, data.length);
      data = arrayOfLong;
      start = (start % 64 + 64);
    }
  }
  
  List<Integer> toIntegerList()
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    int j = data.length;
    int k = start;
    while (i < j * 64 - k)
    {
      if (get(i)) {
        localArrayList.add(Integer.valueOf(i));
      }
      i += 1;
    }
    return localArrayList;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("{");
    List localList = toIntegerList();
    int i = 0;
    int j = localList.size();
    while (i < j)
    {
      if (i > 0) {
        localStringBuilder.append(',');
      }
      localStringBuilder.append(localList.get(i));
      i += 1;
    }
    return '}';
  }
  
  public void toggle(int paramInt)
  {
    checkInput(paramInt);
    int i = offsetOf(paramInt);
    long[] arrayOfLong = data;
    arrayOfLong[i] ^= 1L << shiftOf(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.BitArray.VariableCapacity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */