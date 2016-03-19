package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractSequentialList;
import java.util.List;
import java.util.ListIterator;

class Lists$TransformingSequentialList<F, T>
  extends AbstractSequentialList<T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final List<F> fromList;
  final Function<? super F, ? extends T> function;
  
  Lists$TransformingSequentialList(List<F> paramList, Function<? super F, ? extends T> paramFunction)
  {
    fromList = ((List)Preconditions.checkNotNull(paramList));
    function = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  public void clear()
  {
    fromList.clear();
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
  
  public int size()
  {
    return fromList.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.TransformingSequentialList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */