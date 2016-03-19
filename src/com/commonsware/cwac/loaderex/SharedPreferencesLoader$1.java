package com.commonsware.cwac.loaderex;

import android.content.SharedPreferences.Editor;

final class SharedPreferencesLoader$1
  extends Thread
{
  SharedPreferencesLoader$1(SharedPreferences.Editor paramEditor) {}
  
  public void run()
  {
    val$editor.commit();
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SharedPreferencesLoader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */