package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.VisibleForTesting;

@GwtCompatible(emulated=true, serializable=true)
final class RegularImmutableSet<E>
  extends ImmutableSet<E>
{
  private final Object[] elements;
  private final transient int hashCode;
  private final transient int mask;
  @VisibleForTesting
  final transient Object[] table;
  
  RegularImmutableSet(Object[] paramArrayOfObject1, int paramInt1, Object[] paramArrayOfObject2, int paramInt2)
  {
    elements = paramArrayOfObject1;
    table = paramArrayOfObject2;
    mask = paramInt2;
    hashCode = paramInt1;
  }
  
  public boolean contains(Object paramObject)
  {
    if (paramObject == null) {
      return false;
    }
    int i = Hashing.smear(paramObject.hashCode());
    for (;;)
    {
      Object localObject = table[(mask & i)];
      if (localObject == null) {
        break;
      }
      if (localObject.equals(paramObject)) {
        return true;
      }
      i += 1;
    }
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    System.arraycopy(elements, 0, paramArrayOfObject, paramInt, elements.length);
    return elements.length + paramInt;
  }
  
  ImmutableList<E> createAsList()
  {
    return new RegularImmutableAsList(this, elements);
  }
  
  public int hashCode()
  {
    return hashCode;
  }
  
  boolean isHashCodeFast()
  {
    return true;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.forArray(elements);
  }
  
  public int size()
  {
    return elements.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */