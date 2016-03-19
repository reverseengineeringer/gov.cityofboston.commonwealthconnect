package com.seeclickfix.ma.android.dialogs;

import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;

class OneTimeWarnDialog$1
  implements DialogInterface.OnCancelListener
{
  OneTimeWarnDialog$1(OneTimeWarnDialog paramOneTimeWarnDialog) {}
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    this$0.doNegativeClick();
    paramDialogInterface.dismiss();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */