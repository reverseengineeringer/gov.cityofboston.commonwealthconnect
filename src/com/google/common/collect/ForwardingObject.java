package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
public abstract class ForwardingObject
{
  protected abstract Object delegate();
  
  public String toString()
  {
    return delegate().toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ForwardingObject
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */