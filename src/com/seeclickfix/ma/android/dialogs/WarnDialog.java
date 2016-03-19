package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

public class WarnDialog
  extends AbsDialog<Void>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "WarnDialog";
  
  public static WarnDialog newInstance(DialogOptions paramDialogOptions)
  {
    WarnDialog localWarnDialog = new WarnDialog();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("dialog_options", paramDialogOptions);
    localWarnDialog.setArguments(localBundle);
    localWarnDialog.setRetainInstance(retainInstance);
    localWarnDialog.setCancelable(false);
    return localWarnDialog;
  }
  
  public void cancel() {}
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = (DialogOptions)getArguments().getParcelable("dialog_options");
    FrameLayout localFrameLayout = new FrameLayout(getActivity());
    AlertDialog localAlertDialog = new AlertDialog.Builder(getActivity()).setTitle(titleTextId).setView(localFrameLayout).setPositiveButton(positiveButtonTextId, this).setNegativeButton(negativeButtonTextId, this).setCancelable(false).create();
    ((TextView)((ViewGroup)localAlertDialog.getLayoutInflater().inflate(2130903073, localFrameLayout)).findViewById(2131361880)).setText(msgTextId);
    return localAlertDialog;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.WarnDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */