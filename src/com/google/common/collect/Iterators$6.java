package com.google.common.collect;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

final class Iterators$6
  extends UnmodifiableIterator<List<T>>
{
  Iterators$6(Iterator paramIterator, int paramInt, boolean paramBoolean) {}
  
  public boolean hasNext()
  {
    return val$iterator.hasNext();
  }
  
  public List<T> next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    Object localObject = new Object[val$size];
    int i = 0;
    while ((i < val$size) && (val$iterator.hasNext()))
    {
      localObject[i] = val$iterator.next();
      i += 1;
    }
    int j = i;
    while (j < val$size)
    {
      localObject[j] = null;
      j += 1;
    }
    localObject = Collections.unmodifiableList(Arrays.asList((Object[])localObject));
    if ((val$pad) || (i == val$size)) {
      return (List<T>)localObject;
    }
    return ((List)localObject).subList(0, i);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */