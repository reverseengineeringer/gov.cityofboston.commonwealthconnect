package com.seeclickfix.ma.android.tasks;

class MultiThreadAsyncTask$SerialExecutor$1
  implements Runnable
{
  MultiThreadAsyncTask$SerialExecutor$1(MultiThreadAsyncTask.SerialExecutor paramSerialExecutor, Runnable paramRunnable) {}
  
  public void run()
  {
    try
    {
      val$r.run();
      return;
    }
    finally
    {
      this$0.scheduleNext();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.SerialExecutor.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */