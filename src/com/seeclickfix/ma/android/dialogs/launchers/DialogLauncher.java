package com.seeclickfix.ma.android.dialogs.launchers;

import android.support.v4.app.FragmentActivity;
import com.seeclickfix.ma.android.events.Event;

public abstract interface DialogLauncher
{
  public abstract void showDialog(Event paramEvent, FragmentActivity paramFragmentActivity);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.launchers.DialogLauncher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */