package com.seeclickfix.ma.android.dialogs;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.support.v4.app.DialogFragment;

abstract class AbsDialog<T>
  extends DialogFragment
  implements DialogInstance, DialogInterface.OnClickListener
{
  protected DialogInstance.ClickListener listener;
  T val;
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    switch (paramInt)
    {
    default: 
      onPositiveClick();
    }
    for (;;)
    {
      dismiss();
      return;
      onPositiveClick();
      continue;
      onNegativeClick();
      continue;
      onPositiveClick();
    }
  }
  
  public void onNegativeClick()
  {
    if (listener != null) {
      listener.onNegativeClick();
    }
  }
  
  public void onPositiveClick()
  {
    if (listener != null) {
      listener.onPositiveClick(val);
    }
  }
  
  public void setClickListener(DialogInstance.ClickListener paramClickListener)
  {
    listener = paramClickListener;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.AbsDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */