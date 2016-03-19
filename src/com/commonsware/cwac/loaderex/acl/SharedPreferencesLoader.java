package com.commonsware.cwac.loaderex.acl;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.preference.PreferenceManager;
import android.support.v4.content.AsyncTaskLoader;

public class SharedPreferencesLoader
  extends AsyncTaskLoader<SharedPreferences>
{
  private SharedPreferences prefs = null;
  
  public SharedPreferencesLoader(Context paramContext)
  {
    super(paramContext);
  }
  
  @TargetApi(9)
  public static void persist(SharedPreferences.Editor paramEditor)
  {
    if (Build.VERSION.SDK_INT >= 9)
    {
      paramEditor.apply();
      return;
    }
    new Thread()
    {
      public void run()
      {
        val$editor.commit();
      }
    }.start();
  }
  
  public SharedPreferences loadInBackground()
  {
    prefs = PreferenceManager.getDefaultSharedPreferences(getContext());
    return prefs;
  }
  
  protected void onStartLoading()
  {
    if (prefs != null) {
      deliverResult(prefs);
    }
    if ((takeContentChanged()) || (prefs == null)) {
      forceLoad();
    }
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.acl.SharedPreferencesLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */