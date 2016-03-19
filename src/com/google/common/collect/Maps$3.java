package com.google.common.collect;

import java.util.Collection;
import java.util.Set;

final class Maps$3
  extends ForwardingSet<E>
{
  Maps$3(Set paramSet) {}
  
  public boolean add(E paramE)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    throw new UnsupportedOperationException();
  }
  
  protected Set<E> delegate()
  {
    return val$set;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */