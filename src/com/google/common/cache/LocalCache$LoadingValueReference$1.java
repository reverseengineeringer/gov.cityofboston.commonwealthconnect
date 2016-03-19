package com.google.common.cache;

import com.google.common.base.Function;

class LocalCache$LoadingValueReference$1
  implements Function<V, V>
{
  LocalCache$LoadingValueReference$1(LocalCache.LoadingValueReference paramLoadingValueReference) {}
  
  public V apply(V paramV)
  {
    this$0.set(paramV);
    return paramV;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.LoadingValueReference.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */