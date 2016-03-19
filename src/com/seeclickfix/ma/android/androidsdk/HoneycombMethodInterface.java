package com.seeclickfix.ma.android.androidsdk;

import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;

public abstract interface HoneycombMethodInterface
{
  public abstract boolean handleOptionClick(MenuItem paramMenuItem, Activity paramActivity);
  
  public abstract void hideActionBar(Activity paramActivity);
  
  public abstract void requestActionBar(Activity paramActivity);
  
  public abstract Object setupActionBar(Activity paramActivity);
  
  public abstract void setupHoneycombSearch(Activity paramActivity, Menu paramMenu);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.androidsdk.HoneycombMethodInterface
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */