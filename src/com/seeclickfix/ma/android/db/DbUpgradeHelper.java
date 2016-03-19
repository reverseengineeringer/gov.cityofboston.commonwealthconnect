package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.seeclickfix.ma.android.dialogs.ProgressWheelDialog;

public class DbUpgradeHelper
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  protected static final int SHOW_UPGRADING = 56;
  private static final String TAG = "DbUpgradeHelper";
  protected static final int UPGRADE_COMPLETE = 55;
  private FragmentActivity a;
  private Context c;
  private CheckDbUpgradedThread checkUpgradeThread;
  private Handler handler;
  private OnDbReadyListener listener;
  private ProgressWheelDialog progWheelDiag;
  
  public DbUpgradeHelper(FragmentActivity paramFragmentActivity)
  {
    a = paramFragmentActivity;
    c = paramFragmentActivity.getApplicationContext();
    setupHandler();
  }
  
  private void runCallbacksAndCleanup()
  {
    handler.removeCallbacksAndMessages(null);
    handler = null;
    hideUpgradingDialog();
    listener.onDbReady();
    listener = null;
    a = null;
  }
  
  private void setupHandler()
  {
    handler = new Handler()
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        switch (what)
        {
        default: 
          return;
        case 55: 
          DbUpgradeHelper.this.runCallbacksAndCleanup();
          return;
        }
        showUpgradingDialog();
      }
    };
  }
  
  protected void hideUpgradingDialog()
  {
    if ((progWheelDiag != null) && (!progWheelDiag.isDetached())) {
      progWheelDiag.dismiss();
    }
  }
  
  public void setOnDbReadyListner(OnDbReadyListener paramOnDbReadyListener)
  {
    listener = paramOnDbReadyListener;
  }
  
  protected void showUpgradingDialog()
  {
    String str = c.getResources().getString(2131493205);
    progWheelDiag = new ProgressWheelDialog();
    progWheelDiag.setMessage(str);
    progWheelDiag.show(a.getSupportFragmentManager(), null);
  }
  
  public void start()
  {
    if ((checkUpgradeThread != null) && (checkUpgradeThread.isAlive())) {
      checkUpgradeThread.interrupt();
    }
    checkUpgradeThread = new CheckDbUpgradedThread(c);
    checkUpgradeThread.start();
  }
  
  class CheckDbUpgradedThread
    extends Thread
  {
    private Context c;
    private int numTimesCheckedDb = 0;
    
    CheckDbUpgradedThread(Context paramContext)
    {
      c = paramContext;
    }
    
    public void run()
    {
      int k = PrefsUtil.getInt("Pref:DB_VERSION", 0, c);
      int j = 0;
      int i = 0;
      if (k == 0) {
        i = 1;
      }
      while ((j != 0) || (i != 0))
      {
        OrmDbHelper localOrmDbHelper = (OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class);
        localOrmDbHelper.getReadableDatabase();
        for (;;)
        {
          if ((!localOrmDbHelper.isUpgrading()) || (numTimesCheckedDb >= 100)) {
            break label131;
          }
          try
          {
            sleep(30L);
            numTimesCheckedDb += 1;
          }
          catch (InterruptedException localInterruptedException)
          {
            return;
          }
        }
        if (k < DatabaseConfig.DB_VERSION)
        {
          j = 1;
          handler.obtainMessage(56).sendToTarget();
        }
        else
        {
          handler.obtainMessage(55).sendToTarget();
          return;
        }
      }
      label131:
      numTimesCheckedDb = 0;
      handler.obtainMessage(55).sendToTarget();
    }
  }
  
  public static abstract interface OnDbReadyListener
  {
    public abstract void onDbReady();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DbUpgradeHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */