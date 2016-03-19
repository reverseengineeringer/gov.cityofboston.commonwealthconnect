package com.seeclickfix.ma.android.activities;

import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.view.Menu;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.seeclickfix.ma.android.androidsdk.SDKManager;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;

public class BaseFragActivity
  extends SherlockFragmentActivity
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_BaseFragActivity";
  protected FragmentManager fm = getSupportFragmentManager();
  protected BaseFrag myFrag;
  protected boolean useMultiplePanes;
  
  protected boolean checkIfUseMultiplePanes()
  {
    return false;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setupWindowFeatures();
    setupActionBar();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
  
  protected void onStart()
  {
    super.onStart();
  }
  
  protected void onStop()
  {
    super.onStop();
  }
  
  protected void setupActionBar()
  {
    if (SDKManager.isHoneycombOrAbove()) {
      SDKManager.setupActionBar(this);
    }
  }
  
  protected void setupHCSearch(Menu paramMenu)
  {
    if (SDKManager.isHoneycombOrAbove()) {
      SDKManager.setupHoneycombSearch(this, paramMenu);
    }
  }
  
  protected void setupSingleFragment() {}
  
  protected void setupWindowFeatures()
  {
    if (SDKManager.isHoneycombOrAbove())
    {
      SDKManager.requestActionBar(this);
      return;
    }
    requestWindowFeature(1);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.activities.BaseFragActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */