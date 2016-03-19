package com.google.common.collect;

import java.util.Iterator;

public final class ImmutableList$Builder<E>
  extends ImmutableCollection.ArrayBasedBuilder<E>
{
  public ImmutableList$Builder()
  {
    this(4);
  }
  
  ImmutableList$Builder(int paramInt)
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
  
  public ImmutableList<E> build()
  {
    return ImmutableList.asImmutableList(contents, size);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableList.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */