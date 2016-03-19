package com.google.common.collect;

import com.google.common.annotations.Beta;

@Beta
public abstract interface Interner<E>
{
  public abstract E intern(E paramE);
}

/* Location:
 * Qualified Name:     com.google.common.collect.Interner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */