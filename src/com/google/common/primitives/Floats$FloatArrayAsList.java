package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Floats$FloatArrayAsList
  extends AbstractList<Float>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final float[] array;
  final int end;
  final int start;
  
  Floats$FloatArrayAsList(float[] paramArrayOfFloat)
  {
    this(paramArrayOfFloat, 0, paramArrayOfFloat.length);
  }
  
  Floats$FloatArrayAsList(float[] paramArrayOfFloat, int paramInt1, int paramInt2)
  {
    array = paramArrayOfFloat;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Float)) && (Floats.access$000(array, ((Float)paramObject).floatValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof FloatArrayAsList)) {
        break;
      }
      paramObject = (FloatArrayAsList)paramObject;
      int j = size();
      if (((FloatArrayAsList)paramObject).size() != j) {
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
  
  public Float get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Float.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Floats.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Float))
    {
      int i = Floats.access$000(array, ((Float)paramObject).floatValue(), start, end);
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
    if ((paramObject instanceof Float))
    {
      int i = Floats.access$100(array, ((Float)paramObject).floatValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Float set(int paramInt, Float paramFloat)
  {
    Preconditions.checkElementIndex(paramInt, size());
    float f = array[(start + paramInt)];
    array[(start + paramInt)] = ((Float)Preconditions.checkNotNull(paramFloat)).floatValue();
    return Float.valueOf(f);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Float> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new FloatArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  float[] toFloatArray()
  {
    int i = size();
    float[] arrayOfFloat = new float[i];
    System.arraycopy(array, start, arrayOfFloat, 0, i);
    return arrayOfFloat;
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
 * Qualified Name:     com.google.common.primitives.Floats.FloatArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */