package com.squareup.okhttp.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract interface BitArray
{
  public abstract void clear();
  
  public abstract boolean get(int paramInt);
  
  public abstract void set(int paramInt);
  
  public abstract void shiftLeft(int paramInt);
  
  public abstract void toggle(int paramInt);
  
  public static final class FixedCapacity
    implements BitArray
  {
    long data = 0L;
    
    private static int checkInput(int paramInt)
    {
      if ((paramInt < 0) || (paramInt > 63)) {
        throw new IllegalArgumentException(String.format("input must be between 0 and 63: %s", new Object[] { Integer.valueOf(paramInt) }));
      }
      return paramInt;
    }
    
    public void clear()
    {
      data = 0L;
    }
    
    public boolean get(int paramInt)
    {
      return (data >> checkInput(paramInt) & 1L) == 1L;
    }
    
    public void set(int paramInt)
    {
      data |= 1L << checkInput(paramInt);
    }
    
    public void shiftLeft(int paramInt)
    {
      data <<= checkInput(paramInt);
    }
    
    public String toString()
    {
      return Long.toBinaryString(data);
    }
    
    public BitArray toVariableCapacity()
    {
      return new BitArray.VariableCapacity(this, null);
    }
    
    public void toggle(int paramInt)
    {
      data ^= 1L << checkInput(paramInt);
    }
  }
  
  public static final class VariableCapacity
    implements BitArray
  {
    long[] data;
    private int start;
    
    public VariableCapacity()
    {
      data = new long[1];
    }
    
    private VariableCapacity(BitArray.FixedCapacity paramFixedCapacity)
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
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.BitArray
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */