package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.j256.ormlite.android.apptools.OpenHelperManager;

class DbUpgradeHelper$CheckDbUpgradedThread
  extends Thread
{
  private Context c;
  private int numTimesCheckedDb = 0;
  
  DbUpgradeHelper$CheckDbUpgradedThread(DbUpgradeHelper paramDbUpgradeHelper, Context paramContext)
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
        DbUpgradeHelper.access$100(this$0).obtainMessage(56).sendToTarget();
      }
      else
      {
        DbUpgradeHelper.access$100(this$0).obtainMessage(55).sendToTarget();
        return;
      }
    }
    label131:
    numTimesCheckedDb = 0;
    DbUpgradeHelper.access$100(this$0).obtainMessage(55).sendToTarget();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DbUpgradeHelper.CheckDbUpgradedThread
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */