package com.seeclickfix.ma.android.tasks;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;

public abstract class SafeTask<ArgType, ResultType>
  extends SimpleTask<ArgType, ResultType>
{
  private BaseFrag fragment;
  
  protected SafeTask(SafeListener<ResultType> paramSafeListener)
  {
    super(paramSafeListener);
    fragment = paramSafeListener.getFragment();
  }
  
  public BaseFrag getFragment()
  {
    return fragment;
  }
  
  public boolean isAttached()
  {
    return fragment.getActivity() != null;
  }
  
  public void onPostExecute(ResultType paramResultType)
  {
    if (isAttached()) {
      super.onPostExecute(paramResultType);
    }
    fragment = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.SafeTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */