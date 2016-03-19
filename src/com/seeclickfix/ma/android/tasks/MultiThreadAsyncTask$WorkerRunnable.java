package com.seeclickfix.ma.android.tasks;

import java.util.concurrent.Callable;

abstract class MultiThreadAsyncTask$WorkerRunnable<Params, Result>
  implements Callable<Result>
{
  Params[] mParams;
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.WorkerRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */