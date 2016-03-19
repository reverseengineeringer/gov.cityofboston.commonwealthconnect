package com.seeclickfix.ma.android.dialogs;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;

public class ErrorDialogFragment
  extends DialogFragment
{
  private Dialog mDialog;
  
  public ErrorDialogFragment()
  {
    setRetainInstance(true);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    return mDialog;
  }
  
  public void setDialog(Dialog paramDialog)
  {
    mDialog = paramDialog;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.ErrorDialogFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */