package com.seeclickfix.ma.android.dialogs;

import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;

public class DialogManager
{
  public static void showDialog(DialogOptions paramDialogOptions, DialogInstance.ClickListener<?> paramClickListener, FragmentActivity paramFragmentActivity)
  {
    FragmentManager localFragmentManager = paramFragmentActivity.getSupportFragmentManager();
    WarnDialog localWarnDialog = (WarnDialog)localFragmentManager.findFragmentByTag(fragmentTag);
    paramFragmentActivity = localWarnDialog;
    if (localWarnDialog == null)
    {
      paramFragmentActivity = WarnDialog.newInstance(paramDialogOptions);
      paramFragmentActivity.setRetainInstance(retainInstance);
    }
    paramFragmentActivity.setClickListener(paramClickListener);
    if (!paramFragmentActivity.isAdded()) {
      paramFragmentActivity.show(localFragmentManager, fragmentTag);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.DialogManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */