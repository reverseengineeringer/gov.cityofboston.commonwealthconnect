package com.commonsware.cwac.loaderex;

import android.annotation.TargetApi;
import android.content.AsyncTaskLoader;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Build.VERSION;
import android.preference.PreferenceManager;

@TargetApi(11)
public class SharedPreferencesLoader
  extends AsyncTaskLoader<SharedPreferences>
  implements SharedPreferences.OnSharedPreferenceChangeListener
{
  private SharedPreferences prefs = null;
  
  public SharedPreferencesLoader(Context paramContext)
  {
    super(paramContext);
  }
  
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
    prefs.registerOnSharedPreferenceChangeListener(this);
    return prefs;
  }
  
  public void onSharedPreferenceChanged(SharedPreferences paramSharedPreferences, String paramString)
  {
    onContentChanged();
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
 * Qualified Name:     com.commonsware.cwac.loaderex.SharedPreferencesLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */