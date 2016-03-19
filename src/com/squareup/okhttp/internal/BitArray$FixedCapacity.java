package com.squareup.okhttp.internal;

public final class BitArray$FixedCapacity
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

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.BitArray.FixedCapacity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */