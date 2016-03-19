package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Comparator;
import java.util.SortedSet;
import java.util.TreeSet;

final class MultimapBuilder$TreeSetSupplier<V>
  implements Supplier<SortedSet<V>>, Serializable
{
  private final Comparator<? super V> comparator;
  
  MultimapBuilder$TreeSetSupplier(Comparator<? super V> paramComparator)
  {
    comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
  }
  
  public SortedSet<V> get()
  {
    return new TreeSet(comparator);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.TreeSetSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */