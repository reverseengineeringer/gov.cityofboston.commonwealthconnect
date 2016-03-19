package com.seeclickfix.ma.android.net;

import android.content.Context;
import android.support.v4.content.AsyncTaskLoader;
import java.util.List;

public abstract class AbstractSimpleListLoader<T>
  extends AsyncTaskLoader<List<T>>
{
  private List<T> mList;
  
  public AbstractSimpleListLoader(Context paramContext)
  {
    super(paramContext);
  }
  
  public void deliverResult(List<T> paramList)
  {
    if (isReset()) {
      if (paramList != null) {
        paramList.clear();
      }
    }
    List localList;
    do
    {
      return;
      localList = mList;
      mList = paramList;
      if (isStarted()) {
        super.deliverResult(paramList);
      }
    } while ((localList == null) || (localList == paramList) || (localList.size() <= 0));
    localList.clear();
  }
  
  protected abstract List<T> getData();
  
  protected List<T> getList()
  {
    return mList;
  }
  
  public List<T> loadInBackground()
  {
    return getData();
  }
  
  public void onCanceled(List<T> paramList)
  {
    if ((paramList != null) && (paramList.size() > 0)) {
      paramList.clear();
    }
  }
  
  protected void onReset()
  {
    super.onReset();
    onStopLoading();
    if ((mList != null) && (mList.size() > 0)) {
      mList.clear();
    }
    mList = null;
  }
  
  protected void onStartLoading()
  {
    if (mList != null) {
      deliverResult(mList);
    }
    if ((takeContentChanged()) || (mList == null)) {
      forceLoad();
    }
  }
  
  protected void onStopLoading()
  {
    cancelLoad();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.AbstractSimpleListLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */