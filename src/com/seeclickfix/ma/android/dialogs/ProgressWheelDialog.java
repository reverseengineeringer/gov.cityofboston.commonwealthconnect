package com.seeclickfix.ma.android.dialogs;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;

public class ProgressWheelDialog
  extends DialogFragment
{
  private String message;
  
  public String getMessage()
  {
    return message;
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = new ProgressDialog(getActivity());
    paramBundle.setMessage(message);
    paramBundle.setIndeterminate(true);
    paramBundle.setCanceledOnTouchOutside(false);
    return paramBundle;
  }
  
  public void setMessage(String paramString)
  {
    message = paramString;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.ProgressWheelDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */