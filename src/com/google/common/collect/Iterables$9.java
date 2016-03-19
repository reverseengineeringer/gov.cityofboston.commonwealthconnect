package com.google.common.collect;

import java.util.Iterator;
import java.util.List;

final class Iterables$9
  extends FluentIterable<T>
{
  Iterables$9(List paramList, int paramInt) {}
  
  public Iterator<T> iterator()
  {
    int i = Math.min(val$list.size(), val$numberToSkip);
    return val$list.subList(i, val$list.size()).iterator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterables.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */