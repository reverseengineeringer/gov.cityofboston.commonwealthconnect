package com.google.common.util.concurrent;

import javax.annotation.Nullable;

public abstract interface FutureCallback<V>
{
  public abstract void onFailure(Throwable paramThrowable);
  
  public abstract void onSuccess(@Nullable V paramV);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.FutureCallback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */