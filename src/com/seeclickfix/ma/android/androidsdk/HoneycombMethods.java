package com.seeclickfix.ma.android.androidsdk;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;

@TargetApi(11)
public class HoneycombMethods
  implements HoneycombMethodInterface
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_HoneycombMethods";
  
  public boolean handleOptionClick(MenuItem paramMenuItem, Activity paramActivity)
  {
    return false;
  }
  
  public void hideActionBar(Activity paramActivity)
  {
    paramActivity.getActionBar().hide();
  }
  
  public void requestActionBar(Activity paramActivity)
  {
    paramActivity.requestWindowFeature(8);
  }
  
  public Object setupActionBar(Activity paramActivity)
  {
    paramActivity = paramActivity.getActionBar();
    paramActivity.setDisplayUseLogoEnabled(true);
    paramActivity.setDisplayShowTitleEnabled(false);
    return paramActivity;
  }
  
  public void setupHoneycombSearch(Activity paramActivity, Menu paramMenu) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.androidsdk.HoneycombMethods
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */