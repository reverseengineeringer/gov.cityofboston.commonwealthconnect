package com.google.common.collect;

import java.io.Serializable;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Set;

final class ImmutableSortedMultiset$SerializedForm<E>
  implements Serializable
{
  Comparator<? super E> comparator;
  int[] counts;
  E[] elements;
  
  ImmutableSortedMultiset$SerializedForm(SortedMultiset<E> paramSortedMultiset)
  {
    comparator = paramSortedMultiset.comparator();
    int i = paramSortedMultiset.entrySet().size();
    elements = ((Object[])new Object[i]);
    counts = new int[i];
    i = 0;
    paramSortedMultiset = paramSortedMultiset.entrySet().iterator();
    while (paramSortedMultiset.hasNext())
    {
      Multiset.Entry localEntry = (Multiset.Entry)paramSortedMultiset.next();
      elements[i] = localEntry.getElement();
      counts[i] = localEntry.getCount();
      i += 1;
    }
  }
  
  Object readResolve()
  {
    int j = elements.length;
    ImmutableSortedMultiset.Builder localBuilder = new ImmutableSortedMultiset.Builder(comparator);
    int i = 0;
    while (i < j)
    {
      localBuilder.addCopies(elements[i], counts[i]);
      i += 1;
    }
    return localBuilder.build();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSortedMultiset.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */