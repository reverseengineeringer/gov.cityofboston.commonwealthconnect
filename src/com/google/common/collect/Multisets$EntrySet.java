package com.google.common.collect;

import javax.annotation.Nullable;

abstract class Multisets$EntrySet<E>
  extends Sets.ImprovedAbstractSet<Multiset.Entry<E>>
{
  public void clear()
  {
    multiset().clear();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Multiset.Entry))
    {
      paramObject = (Multiset.Entry)paramObject;
      if (((Multiset.Entry)paramObject).getCount() > 0) {
        break label23;
      }
    }
    label23:
    while (multiset().count(((Multiset.Entry)paramObject).getElement()) != ((Multiset.Entry)paramObject).getCount()) {
      return false;
    }
    return true;
  }
  
  abstract Multiset<E> multiset();
  
  public boolean remove(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Multiset.Entry))
    {
      paramObject = (Multiset.Entry)paramObject;
      Object localObject = ((Multiset.Entry)paramObject).getElement();
      int i = ((Multiset.Entry)paramObject).getCount();
      bool1 = bool2;
      if (i != 0) {
        bool1 = multiset().setCount(localObject, i, 0);
      }
    }
    return bool1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */