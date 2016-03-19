package com.google.common.collect;

import java.util.Iterator;

public abstract class ImmutableCollection$Builder<E>
{
  static final int DEFAULT_INITIAL_CAPACITY = 4;
  
  static int expandedCapacity(int paramInt1, int paramInt2)
  {
    if (paramInt2 < 0) {
      throw new AssertionError("cannot store more than MAX_VALUE elements");
    }
    int i = (paramInt1 >> 1) + paramInt1 + 1;
    paramInt1 = i;
    if (i < paramInt2) {
      paramInt1 = Integer.highestOneBit(paramInt2 - 1) << 1;
    }
    paramInt2 = paramInt1;
    if (paramInt1 < 0) {
      paramInt2 = Integer.MAX_VALUE;
    }
    return paramInt2;
  }
  
  public abstract Builder<E> add(E paramE);
  
  public Builder<E> add(E... paramVarArgs)
  {
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      add(paramVarArgs[i]);
      i += 1;
    }
    return this;
  }
  
  public Builder<E> addAll(Iterable<? extends E> paramIterable)
  {
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext()) {
      add(paramIterable.next());
    }
    return this;
  }
  
  public Builder<E> addAll(Iterator<? extends E> paramIterator)
  {
    while (paramIterator.hasNext()) {
      add(paramIterator.next());
    }
    return this;
  }
  
  public abstract ImmutableCollection<E> build();
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableCollection.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */