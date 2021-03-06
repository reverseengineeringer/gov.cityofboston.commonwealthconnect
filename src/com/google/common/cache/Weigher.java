package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;

@Beta
@GwtCompatible
public abstract interface Weigher<K, V>
{
  public abstract int weigh(K paramK, V paramV);
}

/* Location:
 * Qualified Name:     com.google.common.cache.Weigher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */