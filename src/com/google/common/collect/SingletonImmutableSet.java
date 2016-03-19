package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class SingletonImmutableSet<E>
  extends ImmutableSet<E>
{
  private transient int cachedHashCode;
  final transient E element;
  
  SingletonImmutableSet(E paramE)
  {
    element = Preconditions.checkNotNull(paramE);
  }
  
  SingletonImmutableSet(E paramE, int paramInt)
  {
    element = paramE;
    cachedHashCode = paramInt;
  }
  
  public boolean contains(Object paramObject)
  {
    return element.equals(paramObject);
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    paramArrayOfObject[paramInt] = element;
    return paramInt + 1;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof Set)) {
        break;
      }
      paramObject = (Set)paramObject;
    } while ((((Set)paramObject).size() == 1) && (element.equals(((Set)paramObject).iterator().next())));
    return false;
    return false;
  }
  
  public final int hashCode()
  {
    int j = cachedHashCode;
    int i = j;
    if (j == 0)
    {
      i = element.hashCode();
      cachedHashCode = i;
    }
    return i;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  boolean isHashCodeFast()
  {
    return cachedHashCode != 0;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.singletonIterator(element);
  }
  
  public int size()
  {
    return 1;
  }
  
  public String toString()
  {
    String str = element.toString();
    return str.length() + 2 + '[' + str + ']';
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SingletonImmutableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */