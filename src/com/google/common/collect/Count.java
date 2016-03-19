package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import javax.annotation.Nullable;

@GwtCompatible
final class Count
  implements Serializable
{
  private int value;
  
  Count(int paramInt)
  {
    value = paramInt;
  }
  
  public int addAndGet(int paramInt)
  {
    paramInt = value + paramInt;
    value = paramInt;
    return paramInt;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return ((paramObject instanceof Count)) && (value == value);
  }
  
  public int get()
  {
    return value;
  }
  
  public int getAndAdd(int paramInt)
  {
    int i = value;
    value = (i + paramInt);
    return i;
  }
  
  public int getAndSet(int paramInt)
  {
    int i = value;
    value = paramInt;
    return i;
  }
  
  public int hashCode()
  {
    return value;
  }
  
  public void set(int paramInt)
  {
    value = paramInt;
  }
  
  public String toString()
  {
    return Integer.toString(value);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Count
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */