package com.seeclickfix.ma.android.dialogs;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class ConfirmationDialog$3
  implements DialogInterface.OnClickListener
{
  ConfirmationDialog$3(ConfirmationDialog paramConfirmationDialog) {}
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    this$0.afterConfirm().run();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.ConfirmationDialog.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */