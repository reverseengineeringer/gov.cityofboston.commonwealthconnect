package com.seeclickfix.ma.android.dialogs;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.FlagContentEvent;
import com.squareup.otto.Bus;

class FlagDialog$2
  implements DialogInterface.OnClickListener
{
  FlagDialog$2(FlagDialog paramFlagDialog) {}
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    MyApplication.getEventBus().post(new FlagContentEvent(this$0.getResourceType(), this$0.getResourceId(), this$0.getMessage()));
    paramDialogInterface.dismiss();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.FlagDialog.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */