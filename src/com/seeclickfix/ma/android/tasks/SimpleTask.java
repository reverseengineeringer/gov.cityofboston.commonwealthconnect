package com.seeclickfix.ma.android.tasks;

import android.os.AsyncTask;
import android.support.v4.util.ArrayMap;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.SimpleState;
import java.util.Map;

public abstract class SimpleTask<ArgType, ResultType>
  extends AsyncTask<ArgType, Integer, ResultType>
{
  protected static Map<String, SimpleTask> active = new ArrayMap();
  private SimpleListener.Code failureCode;
  private SimpleListener<ResultType> listener;
  
  public SimpleTask(SimpleListener<ResultType> paramSimpleListener)
  {
    listener = paramSimpleListener;
    failureCode = SimpleListener.Code.SUCCESS;
  }
  
  public static void cancel(String paramString)
  {
    if (active.containsKey(paramString)) {
      ((SimpleTask)active.remove(paramString)).cancel(true);
    }
  }
  
  public static SimpleTask register(String paramString, SimpleTask paramSimpleTask)
  {
    return (SimpleTask)active.put(paramString, paramSimpleTask);
  }
  
  public SimpleListener.Code getErrorCode()
  {
    return failureCode;
  }
  
  protected void onPostExecute(ResultType paramResultType)
  {
    listener.onStateChange(SimpleListener.SimpleState.FINISHED, successful());
    if (successful())
    {
      listener.onSuccess(paramResultType);
      return;
    }
    listener.onFailure(getErrorCode());
  }
  
  protected void onPreExecute()
  {
    listener.onStateChange(SimpleListener.SimpleState.STARTED, successful());
  }
  
  public void setErrorCode(SimpleListener.Code paramCode)
  {
    failureCode = paramCode;
  }
  
  public boolean successful()
  {
    return failureCode == SimpleListener.Code.SUCCESS;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.SimpleTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */