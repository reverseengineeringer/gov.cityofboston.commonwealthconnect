package com.google.common.collect;

import java.util.NoSuchElementException;

class Sets$SubSet$1
  extends UnmodifiableIterator<E>
{
  final ImmutableList<E> elements = Sets.SubSet.access$100(this$0).keySet().asList();
  int remainingSetBits = Sets.SubSet.access$200(this$0);
  
  Sets$SubSet$1(Sets.SubSet paramSubSet) {}
  
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
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.SubSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */