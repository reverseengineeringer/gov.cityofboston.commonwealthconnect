package com.seeclickfix.ma.android.tasks;

import android.annotation.TargetApi;
import java.util.ArrayDeque;
import java.util.concurrent.Executor;

@TargetApi(11)
class MultiThreadAsyncTask$SerialExecutor
  implements Executor
{
  Runnable mActive;
  final ArrayDeque<Runnable> mTasks = new ArrayDeque();
  
  public void execute(final Runnable paramRunnable)
  {
    try
    {
      mTasks.offer(new Runnable()
      {
        public void run()
        {
          try
          {
            paramRunnable.run();
            return;
          }
          finally
          {
            scheduleNext();
          }
        }
      });
      if (mActive == null) {
        scheduleNext();
      }
      return;
    }
    finally
    {
      paramRunnable = finally;
      throw paramRunnable;
    }
  }
  
  protected void scheduleNext()
  {
    try
    {
      Runnable localRunnable = (Runnable)mTasks.poll();
      mActive = localRunnable;
      if (localRunnable != null) {
        MultiThreadAsyncTask.THREAD_POOL_EXECUTOR.execute(mActive);
      }
      return;
    }
    finally {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.SerialExecutor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */