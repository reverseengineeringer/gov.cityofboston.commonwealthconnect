package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Comparator;
import java.util.Iterator;

@GwtCompatible
abstract interface SortedIterable<T>
  extends Iterable<T>
{
  public abstract Comparator<? super T> comparator();
  
  public abstract Iterator<T> iterator();
}

/* Location:
 * Qualified Name:     com.google.common.collect.SortedIterable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */