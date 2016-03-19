package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

class Lists$TransformingRandomAccessList<F, T>
  extends AbstractList<T>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final List<F> fromList;
  final Function<? super F, ? extends T> function;
  
  Lists$TransformingRandomAccessList(List<F> paramList, Function<? super F, ? extends T> paramFunction)
  {
    fromList = ((List)Preconditions.checkNotNull(paramList));
    function = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  public void clear()
  {
    fromList.clear();
  }
  
  public T get(int paramInt)
  {
    return (T)function.apply(fromList.get(paramInt));
  }
  
  public boolean isEmpty()
  {
    return fromList.isEmpty();
  }
  
  public Iterator<T> iterator()
  {
    return listIterator();
  }
  
  public ListIterator<T> listIterator(int paramInt)
  {
    new TransformedListIterator(fromList.listIterator(paramInt))
    {
      T transform(F paramAnonymousF)
      {
        return (T)function.apply(paramAnonymousF);
      }
    };
  }
  
  public T remove(int paramInt)
  {
    return (T)function.apply(fromList.remove(paramInt));
  }
  
  public int size()
  {
    return fromList.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.TransformingRandomAccessList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */