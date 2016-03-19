package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.concurrent.ConcurrentMap;

final class Interners$1
  implements Interner<E>
{
  Interners$1(ConcurrentMap paramConcurrentMap) {}
  
  public E intern(E paramE)
  {
    Object localObject = val$map.putIfAbsent(Preconditions.checkNotNull(paramE), paramE);
    if (localObject == null) {
      return paramE;
    }
    return (E)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Interners.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */