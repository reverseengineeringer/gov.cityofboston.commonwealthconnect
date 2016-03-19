package com.seeclickfix.ma.android.tasks;

import android.util.Log;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

class MultiThreadAsyncTask$3
  extends FutureTask<Result>
{
  MultiThreadAsyncTask$3(MultiThreadAsyncTask paramMultiThreadAsyncTask, Callable paramCallable)
  {
    super(paramCallable);
  }
  
  protected void done()
  {
    try
    {
      MultiThreadAsyncTask.access$500(this$0, get());
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.w("MultiThreadAsyncTask", localInterruptedException);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      throw new RuntimeException("An error occured while executing doInBackground()", localExecutionException.getCause());
    }
    catch (CancellationException localCancellationException)
    {
      MultiThreadAsyncTask.access$500(this$0, null);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */