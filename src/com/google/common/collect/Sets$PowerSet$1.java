package com.google.common.collect;

import java.util.Set;

class Sets$PowerSet$1
  extends AbstractIndexedListIterator<Set<E>>
{
  Sets$PowerSet$1(Sets.PowerSet paramPowerSet, int paramInt)
  {
    super(paramInt);
  }
  
  protected Set<E> get(int paramInt)
  {
    return new Sets.SubSet(this$0.inputSet, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.PowerSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */