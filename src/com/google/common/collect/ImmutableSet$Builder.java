package com.google.common.collect;

import java.util.Iterator;

public class ImmutableSet$Builder<E>
  extends ImmutableCollection.ArrayBasedBuilder<E>
{
  public ImmutableSet$Builder()
  {
    this(4);
  }
  
  ImmutableSet$Builder(int paramInt)
  {
    super(paramInt);
  }
  
  public Builder<E> add(E paramE)
  {
    super.add(paramE);
    return this;
  }
  
  public Builder<E> add(E... paramVarArgs)
  {
    super.add(paramVarArgs);
    return this;
  }
  
  public Builder<E> addAll(Iterable<? extends E> paramIterable)
  {
    super.addAll(paramIterable);
    return this;
  }
  
  public Builder<E> addAll(Iterator<? extends E> paramIterator)
  {
    super.addAll(paramIterator);
    return this;
  }
  
  public ImmutableSet<E> build()
  {
    ImmutableSet localImmutableSet = ImmutableSet.access$000(size, contents);
    size = localImmutableSet.size();
    return localImmutableSet;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSet.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */