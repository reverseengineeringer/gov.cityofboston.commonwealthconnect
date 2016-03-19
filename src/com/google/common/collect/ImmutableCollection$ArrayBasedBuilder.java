package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;

abstract class ImmutableCollection$ArrayBasedBuilder<E>
  extends ImmutableCollection.Builder<E>
{
  Object[] contents;
  int size;
  
  ImmutableCollection$ArrayBasedBuilder(int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "initialCapacity");
    contents = new Object[paramInt];
    size = 0;
  }
  
  private void ensureCapacity(int paramInt)
  {
    if (contents.length < paramInt) {
      contents = ObjectArrays.arraysCopyOf(contents, expandedCapacity(contents.length, paramInt));
    }
  }
  
  public ArrayBasedBuilder<E> add(E paramE)
  {
    Preconditions.checkNotNull(paramE);
    ensureCapacity(size + 1);
    Object[] arrayOfObject = contents;
    int i = size;
    size = (i + 1);
    arrayOfObject[i] = paramE;
    return this;
  }
  
  public ImmutableCollection.Builder<E> add(E... paramVarArgs)
  {
    ObjectArrays.checkElementsNotNull(paramVarArgs);
    ensureCapacity(size + paramVarArgs.length);
    System.arraycopy(paramVarArgs, 0, contents, size, paramVarArgs.length);
    size += paramVarArgs.length;
    return this;
  }
  
  public ImmutableCollection.Builder<E> addAll(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
    {
      Collection localCollection = (Collection)paramIterable;
      ensureCapacity(size + localCollection.size());
    }
    super.addAll(paramIterable);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableCollection.ArrayBasedBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */