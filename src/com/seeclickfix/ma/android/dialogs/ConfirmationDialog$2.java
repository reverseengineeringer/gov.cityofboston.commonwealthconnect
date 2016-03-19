package com.seeclickfix.ma.android.dialogs;

import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;

class ConfirmationDialog$2
  implements DialogInterface.OnCancelListener
{
  ConfirmationDialog$2(ConfirmationDialog paramConfirmationDialog) {}
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    paramDialogInterface.dismiss();
    this$0.afterConfirm().run();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.ConfirmationDialog.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */