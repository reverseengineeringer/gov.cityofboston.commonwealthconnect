package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import javax.annotation.Nullable;

@GwtCompatible
final class CartesianList<E>
  extends AbstractList<List<E>>
  implements RandomAccess
{
  private final transient ImmutableList<List<E>> axes;
  private final transient int[] axesSizeProduct;
  
  CartesianList(ImmutableList<List<E>> paramImmutableList)
  {
    axes = paramImmutableList;
    int[] arrayOfInt = new int[paramImmutableList.size() + 1];
    arrayOfInt[paramImmutableList.size()] = 1;
    try
    {
      int i = paramImmutableList.size() - 1;
      while (i >= 0)
      {
        arrayOfInt[i] = IntMath.checkedMultiply(arrayOfInt[(i + 1)], ((List)paramImmutableList.get(i)).size());
        i -= 1;
      }
      axesSizeProduct = arrayOfInt;
    }
    catch (ArithmeticException paramImmutableList)
    {
      throw new IllegalArgumentException("Cartesian product too large; must have size at most Integer.MAX_VALUE");
    }
  }
  
  static <E> List<List<E>> create(List<? extends List<? extends E>> paramList)
  {
    ImmutableList.Builder localBuilder = new ImmutableList.Builder(paramList.size());
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      ImmutableList localImmutableList = ImmutableList.copyOf((List)paramList.next());
      if (localImmutableList.isEmpty()) {
        return ImmutableList.of();
      }
      localBuilder.add(localImmutableList);
    }
    return new CartesianList(localBuilder.build());
  }
  
  private int getAxisIndexForProductIndex(int paramInt1, int paramInt2)
  {
    return paramInt1 / axesSizeProduct[(paramInt2 + 1)] % ((List)axes.get(paramInt2)).size();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if (!(paramObject instanceof List)) {
      return false;
    }
    paramObject = (List)paramObject;
    if (((List)paramObject).size() != axes.size()) {
      return false;
    }
    paramObject = ((List)paramObject).listIterator();
    while (((ListIterator)paramObject).hasNext())
    {
      int i = ((ListIterator)paramObject).nextIndex();
      if (!((List)axes.get(i)).contains(((ListIterator)paramObject).next())) {
        return false;
      }
    }
    return true;
  }
  
  public ImmutableList<E> get(final int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    new ImmutableList()
    {
      public E get(int paramAnonymousInt)
      {
        Preconditions.checkElementIndex(paramAnonymousInt, size());
        int i = CartesianList.this.getAxisIndexForProductIndex(paramInt, paramAnonymousInt);
        return (E)((List)axes.get(paramAnonymousInt)).get(i);
      }
      
      boolean isPartialView()
      {
        return true;
      }
      
      public int size()
      {
        return axes.size();
      }
    };
  }
  
  public int size()
  {
    return axesSizeProduct[0];
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.CartesianList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */