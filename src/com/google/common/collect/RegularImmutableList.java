package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
class RegularImmutableList<E>
  extends ImmutableList<E>
{
  private final transient Object[] array;
  private final transient int offset;
  private final transient int size;
  
  RegularImmutableList(Object[] paramArrayOfObject)
  {
    this(paramArrayOfObject, 0, paramArrayOfObject.length);
  }
  
  RegularImmutableList(Object[] paramArrayOfObject, int paramInt1, int paramInt2)
  {
    offset = paramInt1;
    size = paramInt2;
    array = paramArrayOfObject;
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    System.arraycopy(array, offset, paramArrayOfObject, paramInt, size);
    return size + paramInt;
  }
  
  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size);
    return (E)array[(offset + paramInt)];
  }
  
  public int indexOf(@Nullable Object paramObject)
  {
    int j;
    if (paramObject == null)
    {
      j = -1;
      return j;
    }
    int i = 0;
    for (;;)
    {
      if (i >= size) {
        break label45;
      }
      j = i;
      if (array[(offset + i)].equals(paramObject)) {
        break;
      }
      i += 1;
    }
    label45:
    return -1;
  }
  
  boolean isPartialView()
  {
    return size != array.length;
  }
  
  public int lastIndexOf(@Nullable Object paramObject)
  {
    int j;
    if (paramObject == null)
    {
      j = -1;
      return j;
    }
    int i = size - 1;
    for (;;)
    {
      if (i < 0) {
        break label46;
      }
      j = i;
      if (array[(offset + i)].equals(paramObject)) {
        break;
      }
      i -= 1;
    }
    label46:
    return -1;
  }
  
  public UnmodifiableListIterator<E> listIterator(int paramInt)
  {
    return Iterators.forArray(array, offset, size, paramInt);
  }
  
  public int size()
  {
    return size;
  }
  
  ImmutableList<E> subListUnchecked(int paramInt1, int paramInt2)
  {
    return new RegularImmutableList(array, offset + paramInt1, paramInt2 - paramInt1);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */