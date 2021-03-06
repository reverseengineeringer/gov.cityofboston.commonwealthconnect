package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;

@Beta
@GwtCompatible
public final class Runnables
{
  private static final Runnable EMPTY_RUNNABLE = new Runnable()
  {
    public void run() {}
  };
  
  public static Runnable doNothing()
  {
    return EMPTY_RUNNABLE;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Runnables
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */