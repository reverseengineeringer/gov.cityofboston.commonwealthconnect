package com.google.common.collect;

import java.util.List;
import java.util.RandomAccess;
import javax.annotation.Nullable;

class Synchronized$SynchronizedRandomAccessList<E>
  extends Synchronized.SynchronizedList<E>
  implements RandomAccess
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedRandomAccessList(List<E> paramList, @Nullable Object paramObject)
  {
    super(paramList, paramObject);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedRandomAccessList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */