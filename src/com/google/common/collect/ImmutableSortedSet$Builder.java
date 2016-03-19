package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Iterator;

public final class ImmutableSortedSet$Builder<E>
  extends ImmutableSet.Builder<E>
{
  private final Comparator<? super E> comparator;
  
  public ImmutableSortedSet$Builder(Comparator<? super E> paramComparator)
  {
    comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
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
  
  public ImmutableSortedSet<E> build()
  {
    Object localObject = (Object[])contents;
    localObject = ImmutableSortedSet.construct(comparator, size, (Object[])localObject);
    size = ((ImmutableSortedSet)localObject).size();
    return (ImmutableSortedSet<E>)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSortedSet.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */