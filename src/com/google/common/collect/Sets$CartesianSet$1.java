package com.google.common.collect;

import java.util.List;

final class Sets$CartesianSet$1
  extends ImmutableList<List<E>>
{
  Sets$CartesianSet$1(ImmutableList paramImmutableList) {}
  
  public List<E> get(int paramInt)
  {
    return ((ImmutableSet)val$axes.get(paramInt)).asList();
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return val$axes.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.CartesianSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */