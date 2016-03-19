package com.google.common.collect;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.NoSuchElementException;
import javax.annotation.Nullable;

final class Sets$SubSet<E>
  extends AbstractSet<E>
{
  private final ImmutableMap<E, Integer> inputSet;
  private final int mask;
  
  Sets$SubSet(ImmutableMap<E, Integer> paramImmutableMap, int paramInt)
  {
    inputSet = paramImmutableMap;
    mask = paramInt;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    paramObject = (Integer)inputSet.get(paramObject);
    return (paramObject != null) && ((mask & 1 << ((Integer)paramObject).intValue()) != 0);
  }
  
  public Iterator<E> iterator()
  {
    new UnmodifiableIterator()
    {
      final ImmutableList<E> elements = inputSet.keySet().asList();
      int remainingSetBits = mask;
      
      public boolean hasNext()
      {
        return remainingSetBits != 0;
      }
      
      public E next()
      {
        int i = Integer.numberOfTrailingZeros(remainingSetBits);
        if (i == 32) {
          throw new NoSuchElementException();
        }
        remainingSetBits &= (1 << i ^ 0xFFFFFFFF);
        return (E)elements.get(i);
      }
    };
  }
  
  public int size()
  {
    return Integer.bitCount(mask);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.SubSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */