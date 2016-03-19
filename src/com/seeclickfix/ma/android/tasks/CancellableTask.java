package com.seeclickfix.ma.android.tasks;

import java.util.concurrent.Callable;

public abstract interface CancellableTask<T>
  extends Callable<T>
{
  public abstract void cancel();
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.CancellableTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */