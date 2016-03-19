package com.commonsware.cwac.loaderex.acl;

import android.os.AsyncTask;
import android.support.v4.content.Loader;

public abstract class ContentChangingTask<T1, T2, T3>
  extends AsyncTask<T1, T2, T3>
{
  private Loader<?> loader = null;
  
  ContentChangingTask(Loader<?> paramLoader)
  {
    loader = paramLoader;
  }
  
  protected void onPostExecute(T3 paramT3)
  {
    loader.onContentChanged();
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.acl.ContentChangingTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */