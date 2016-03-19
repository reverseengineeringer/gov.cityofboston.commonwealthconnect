package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.List;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class SingletonImmutableList<E>
  extends ImmutableList<E>
{
  final transient E element;
  
  SingletonImmutableList(E paramE)
  {
    element = Preconditions.checkNotNull(paramE);
  }
  
  public boolean contains(@Nullable Object paramObject)
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
      if (!(paramObject instanceof List)) {
        break;
      }
      paramObject = (List)paramObject;
    } while ((((List)paramObject).size() == 1) && (element.equals(((List)paramObject).get(0))));
    return false;
    return false;
  }
  
  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, 1);
    return (E)element;
  }
  
  public int hashCode()
  {
    return element.hashCode() + 31;
  }
  
  public int indexOf(@Nullable Object paramObject)
  {
    if (element.equals(paramObject)) {
      return 0;
    }
    return -1;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.singletonIterator(element);
  }
  
  public int lastIndexOf(@Nullable Object paramObject)
  {
    return indexOf(paramObject);
  }
  
  public ImmutableList<E> reverse()
  {
    return this;
  }
  
  public int size()
  {
    return 1;
  }
  
  public ImmutableList<E> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, 1);
    Object localObject = this;
    if (paramInt1 == paramInt2) {
      localObject = ImmutableList.of();
    }
    return (ImmutableList<E>)localObject;
  }
  
  public String toString()
  {
    String str = element.toString();
    return str.length() + 2 + '[' + str + ']';
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SingletonImmutableList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */