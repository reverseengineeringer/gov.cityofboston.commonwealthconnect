package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Booleans$BooleanArrayAsList
  extends AbstractList<Boolean>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final boolean[] array;
  final int end;
  final int start;
  
  Booleans$BooleanArrayAsList(boolean[] paramArrayOfBoolean)
  {
    this(paramArrayOfBoolean, 0, paramArrayOfBoolean.length);
  }
  
  Booleans$BooleanArrayAsList(boolean[] paramArrayOfBoolean, int paramInt1, int paramInt2)
  {
    array = paramArrayOfBoolean;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Boolean)) && (Booleans.access$000(array, ((Boolean)paramObject).booleanValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof BooleanArrayAsList)) {
        break;
      }
      paramObject = (BooleanArrayAsList)paramObject;
      int j = size();
      if (((BooleanArrayAsList)paramObject).size() != j) {
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
  
  public Boolean get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Boolean.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Booleans.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Boolean))
    {
      int i = Booleans.access$000(array, ((Boolean)paramObject).booleanValue(), start, end);
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
    if ((paramObject instanceof Boolean))
    {
      int i = Booleans.access$100(array, ((Boolean)paramObject).booleanValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Boolean set(int paramInt, Boolean paramBoolean)
  {
    Preconditions.checkElementIndex(paramInt, size());
    int i = array[(start + paramInt)];
    array[(start + paramInt)] = ((Boolean)Preconditions.checkNotNull(paramBoolean)).booleanValue();
    return Boolean.valueOf(i);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Boolean> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new BooleanArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  boolean[] toBooleanArray()
  {
    int i = size();
    boolean[] arrayOfBoolean = new boolean[i];
    System.arraycopy(array, start, arrayOfBoolean, 0, i);
    return arrayOfBoolean;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(size() * 7);
    int i;
    if (array[start] != 0)
    {
      str = "[true";
      localStringBuilder.append(str);
      i = start + 1;
      label43:
      if (i >= end) {
        break label88;
      }
      if (array[i] == 0) {
        break label82;
      }
    }
    label82:
    for (String str = ", true";; str = ", false")
    {
      localStringBuilder.append(str);
      i += 1;
      break label43;
      str = "[false";
      break;
    }
    label88:
    return ']';
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Booleans.BooleanArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */