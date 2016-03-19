package com.seeclickfix.ma.android.dialogs.launchers;

import android.content.IntentSender.SendIntentException;
import android.support.v4.app.FragmentActivity;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.seeclickfix.ma.android.dialogs.ErrorDialogFragment;
import com.seeclickfix.ma.android.events.Event;
import com.seeclickfix.ma.android.events.GooglePlayErrorEvent;

public class GooglePlayErrorDialogLauncher
  implements DialogLauncher
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GooglePlayErrorDialogLauncher";
  
  private void attempAutoResolution(ConnectionResult paramConnectionResult, FragmentActivity paramFragmentActivity)
  {
    if ((paramConnectionResult != null) && (paramConnectionResult.hasResolution())) {}
    try
    {
      paramConnectionResult.startResolutionForResult(paramFragmentActivity, 2600);
      return;
    }
    catch (IntentSender.SendIntentException paramConnectionResult) {}
    show(paramFragmentActivity, paramConnectionResult);
    return;
  }
  
  private void show(FragmentActivity paramFragmentActivity, ConnectionResult paramConnectionResult)
  {
    if (paramConnectionResult == null) {}
    for (int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramFragmentActivity);; i = paramConnectionResult.getErrorCode())
    {
      paramConnectionResult = GooglePlayServicesUtil.getErrorDialog(i, paramFragmentActivity, 2600);
      if (paramConnectionResult != null)
      {
        ErrorDialogFragment localErrorDialogFragment = new ErrorDialogFragment();
        localErrorDialogFragment.setDialog(paramConnectionResult);
        localErrorDialogFragment.show(paramFragmentActivity.getSupportFragmentManager(), "LocationErrorDialog");
      }
      return;
    }
  }
  
  public void showDialog(Event paramEvent, FragmentActivity paramFragmentActivity)
  {
    attempAutoResolution(((GooglePlayErrorEvent)paramEvent).getConnectionResult(), paramFragmentActivity);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.launchers.GooglePlayErrorDialogLauncher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */