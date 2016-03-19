package com.seeclickfix.ma.android.db;

import android.os.Handler;
import android.os.Message;

class DbUpgradeHelper$1
  extends Handler
{
  DbUpgradeHelper$1(DbUpgradeHelper paramDbUpgradeHelper) {}
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    case 55: 
      DbUpgradeHelper.access$000(this$0);
      return;
    }
    this$0.showUpgradingDialog();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DbUpgradeHelper.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */