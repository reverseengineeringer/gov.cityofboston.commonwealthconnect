package com.seeclickfix.ma.android.tasks;

import android.os.Handler;
import android.os.Message;

class MultiThreadAsyncTask$InternalHandler
  extends Handler
{
  public void handleMessage(Message paramMessage)
  {
    MultiThreadAsyncTask.AsyncTaskResult localAsyncTaskResult = (MultiThreadAsyncTask.AsyncTaskResult)obj;
    switch (what)
    {
    default: 
      return;
    case 1: 
      MultiThreadAsyncTask.access$600(mTask, mData[0]);
      return;
    }
    mTask.onProgressUpdate(mData);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.InternalHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */