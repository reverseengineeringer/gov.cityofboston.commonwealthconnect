package com.google.common.collect;

import java.util.Iterator;

class Multisets$ElementSet$1
  extends TransformedIterator<Multiset.Entry<E>, E>
{
  Multisets$ElementSet$1(Multisets.ElementSet paramElementSet, Iterator paramIterator)
  {
    super(paramIterator);
  }
  
  E transform(Multiset.Entry<E> paramEntry)
  {
    return (E)paramEntry.getElement();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.ElementSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */