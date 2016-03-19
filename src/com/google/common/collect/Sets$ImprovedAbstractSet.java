package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractSet;
import java.util.Collection;

abstract class Sets$ImprovedAbstractSet<E>
  extends AbstractSet<E>
{
  public boolean removeAll(Collection<?> paramCollection)
  {
    return Sets.removeAllImpl(this, paramCollection);
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return super.retainAll((Collection)Preconditions.checkNotNull(paramCollection));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.ImprovedAbstractSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */