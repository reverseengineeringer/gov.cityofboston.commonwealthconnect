package com.google.common.collect;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Set;

class ImmutableMultiset$SerializedForm
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final int[] counts;
  final Object[] elements;
  
  ImmutableMultiset$SerializedForm(Multiset<?> paramMultiset)
  {
    int i = paramMultiset.entrySet().size();
    elements = new Object[i];
    counts = new int[i];
    i = 0;
    paramMultiset = paramMultiset.entrySet().iterator();
    while (paramMultiset.hasNext())
    {
      Multiset.Entry localEntry = (Multiset.Entry)paramMultiset.next();
      elements[i] = localEntry.getElement();
      counts[i] = localEntry.getCount();
      i += 1;
    }
  }
  
  Object readResolve()
  {
    LinkedHashMultiset localLinkedHashMultiset = LinkedHashMultiset.create(elements.length);
    int i = 0;
    while (i < elements.length)
    {
      localLinkedHashMultiset.add(elements[i], counts[i]);
      i += 1;
    }
    return ImmutableMultiset.copyOf(localLinkedHashMultiset);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultiset.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */