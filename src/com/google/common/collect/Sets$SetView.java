package com.google.common.collect;

import java.util.AbstractSet;
import java.util.Set;

public abstract class Sets$SetView<E>
  extends AbstractSet<E>
{
  public <S extends Set<E>> S copyInto(S paramS)
  {
    paramS.addAll(this);
    return paramS;
  }
  
  public ImmutableSet<E> immutableCopy()
  {
    return ImmutableSet.copyOf(this);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.SetView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */