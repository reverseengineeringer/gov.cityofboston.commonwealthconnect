package com.seeclickfix.ma.android.dialogs.launchers;

import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import com.seeclickfix.ma.android.dialogs.DialogInstance.ClickListener;
import com.seeclickfix.ma.android.dialogs.DialogManager;
import com.seeclickfix.ma.android.dialogs.DialogOptions;
import com.seeclickfix.ma.android.dialogs.PreBakedDialogs;
import com.seeclickfix.ma.android.events.Event;
import javax.inject.Inject;

public class LocationDisableDialogLauncher
  implements DialogInstance.ClickListener<Void>
{
  @Inject
  DialogManager dialogManager;
  private FragmentActivity fa;
  
  private DialogOptions getOptions()
  {
    return PreBakedDialogs.getDialogOptions("PreBakedDialogs::LOCATION_OFF");
  }
  
  public void onNegativeClick()
  {
    fa.finish();
  }
  
  public void onPositiveClick(Void paramVoid)
  {
    paramVoid = new Intent("android.settings.LOCATION_SOURCE_SETTINGS");
    paramVoid.setFlags(268435456);
    fa.startActivity(paramVoid);
  }
  
  public void showDialog(Event paramEvent, FragmentActivity paramFragmentActivity)
  {
    fa = paramFragmentActivity;
    paramEvent = getOptions();
    DialogManager localDialogManager = dialogManager;
    DialogManager.showDialog(paramEvent, this, paramFragmentActivity);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */