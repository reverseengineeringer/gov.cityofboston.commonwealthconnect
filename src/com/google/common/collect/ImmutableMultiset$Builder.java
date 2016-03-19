package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Set;

public class ImmutableMultiset$Builder<E>
  extends ImmutableCollection.Builder<E>
{
  final Multiset<E> contents;
  
  public ImmutableMultiset$Builder()
  {
    this(LinkedHashMultiset.create());
  }
  
  ImmutableMultiset$Builder(Multiset<E> paramMultiset)
  {
    contents = paramMultiset;
  }
  
  public Builder<E> add(E paramE)
  {
    contents.add(Preconditions.checkNotNull(paramE));
    return this;
  }
  
  public Builder<E> add(E... paramVarArgs)
  {
    super.add(paramVarArgs);
    return this;
  }
  
  public Builder<E> addAll(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Multiset))
    {
      paramIterable = Multisets.cast(paramIterable).entrySet().iterator();
      while (paramIterable.hasNext())
      {
        Multiset.Entry localEntry = (Multiset.Entry)paramIterable.next();
        addCopies(localEntry.getElement(), localEntry.getCount());
      }
    }
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
    contents.add(Preconditions.checkNotNull(paramE), paramInt);
    return this;
  }
  
  public ImmutableMultiset<E> build()
  {
    return ImmutableMultiset.copyOf(contents);
  }
  
  public Builder<E> setCount(E paramE, int paramInt)
  {
    contents.setCount(Preconditions.checkNotNull(paramE), paramInt);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultiset.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */