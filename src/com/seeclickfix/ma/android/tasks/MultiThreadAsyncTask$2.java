package com.seeclickfix.ma.android.tasks;

import android.os.Process;
import java.util.concurrent.atomic.AtomicBoolean;

class MultiThreadAsyncTask$2
  extends MultiThreadAsyncTask.WorkerRunnable<Params, Result>
{
  MultiThreadAsyncTask$2(MultiThreadAsyncTask paramMultiThreadAsyncTask)
  {
    super(null);
  }
  
  public Result call()
    throws Exception
  {
    MultiThreadAsyncTask.access$300(this$0).set(true);
    Process.setThreadPriority(10);
    return (Result)MultiThreadAsyncTask.access$400(this$0, this$0.doInBackground(mParams));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */