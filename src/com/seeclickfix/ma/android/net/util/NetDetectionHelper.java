package com.seeclickfix.ma.android.net.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.support.v4.app.FragmentManager;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.seeclickfix.ma.android.dialogs.DialogInstance.ClickListener;
import com.seeclickfix.ma.android.dialogs.PreBakedDialogs;
import com.seeclickfix.ma.android.dialogs.WarnDialog;

public class NetDetectionHelper
  implements DialogInstance.ClickListener<Void>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "NetDetectionHelper";
  private NetDetectDialogCallback callback;
  
  private void showDialog(FragmentManager paramFragmentManager, SherlockFragmentActivity paramSherlockFragmentActivity)
  {
    paramSherlockFragmentActivity = WarnDialog.newInstance(PreBakedDialogs.getDialogOptions("PreBakedDialogs::NO_NETWORK"));
    paramSherlockFragmentActivity.setClickListener(this);
    paramSherlockFragmentActivity.show(paramFragmentManager, "FragmentTags:DIALOG_WARN_NO_NETWORK");
  }
  
  public boolean getIsNetConnectedOrShowDialog(SherlockFragmentActivity paramSherlockFragmentActivity, NetDetectDialogCallback paramNetDetectDialogCallback)
  {
    callback = paramNetDetectDialogCallback;
    boolean bool = isNetworkOnline(paramSherlockFragmentActivity);
    paramNetDetectDialogCallback = paramSherlockFragmentActivity.getSupportFragmentManager();
    if (!bool) {
      showDialog(paramNetDetectDialogCallback, paramSherlockFragmentActivity);
    }
    return bool;
  }
  
  public boolean isNetworkOnline(Context paramContext)
  {
    boolean bool = false;
    try
    {
      paramContext = (ConnectivityManager)paramContext.getSystemService("connectivity");
      NetworkInfo localNetworkInfo2 = paramContext.getNetworkInfo(1);
      NetworkInfo localNetworkInfo1 = paramContext.getNetworkInfo(0);
      paramContext = null;
      NetworkInfo.State localState = null;
      if (localNetworkInfo2 != null) {
        paramContext = localNetworkInfo2.getState();
      }
      if (localNetworkInfo1 != null) {
        localState = localNetworkInfo1.getState();
      }
      if ((localState != NetworkInfo.State.CONNECTED) && (paramContext != NetworkInfo.State.CONNECTED))
      {
        if (localState != NetworkInfo.State.CONNECTING)
        {
          localState = NetworkInfo.State.CONNECTING;
          if (paramContext != localState) {
            return bool;
          }
        }
        return false;
      }
    }
    catch (Exception paramContext)
    {
      return false;
    }
    bool = true;
    return bool;
  }
  
  public void onNegativeClick()
  {
    if (callback != null) {
      callback.onUserClickCancel();
    }
  }
  
  public void onPositiveClick(Void paramVoid)
  {
    if (callback != null) {
      callback.onUserClickRetry();
    }
  }
  
  public static abstract interface NetDetectDialogCallback
  {
    public abstract void onUserClickCancel();
    
    public abstract void onUserClickRetry();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.util.NetDetectionHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */