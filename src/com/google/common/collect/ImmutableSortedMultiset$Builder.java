package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Iterator;

public class ImmutableSortedMultiset$Builder<E>
  extends ImmutableMultiset.Builder<E>
{
  public ImmutableSortedMultiset$Builder(Comparator<? super E> paramComparator)
  {
    super(TreeMultiset.create((Comparator)Preconditions.checkNotNull(paramComparator)));
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
  
  public Builder<E> addCopies(E paramE, int paramInt)
  {
    super.addCopies(paramE, paramInt);
    return this;
  }
  
  public ImmutableSortedMultiset<E> build()
  {
    return ImmutableSortedMultiset.copyOfSorted((SortedMultiset)contents);
  }
  
  public Builder<E> setCount(E paramE, int paramInt)
  {
    super.setCount(paramE, paramInt);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSortedMultiset.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */