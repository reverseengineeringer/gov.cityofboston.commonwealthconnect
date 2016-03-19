package com.seeclickfix.ma.android;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;

public class SimpleAlertDialog
  extends DialogFragment
{
  public static SimpleAlertDialog create(int paramInt)
  {
    return create(0, paramInt, 0, 0, 0);
  }
  
  public static SimpleAlertDialog create(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    Bundle localBundle = new Bundle();
    if (paramInt1 != 0) {
      localBundle.putInt("title_id", paramInt1);
    }
    if (paramInt2 != 0) {
      localBundle.putInt("message_id", paramInt1);
    }
    if (paramInt3 != 0) {
      localBundle.putInt("positiveButton_id", paramInt1);
    }
    if (paramInt4 != 0) {
      localBundle.putInt("negativeButton_id", paramInt1);
    }
    if (paramInt5 != 0) {
      localBundle.putInt("neutralButton_id", paramInt1);
    }
    return create(localBundle);
  }
  
  public static SimpleAlertDialog create(Bundle paramBundle)
  {
    SimpleAlertDialog localSimpleAlertDialog = new SimpleAlertDialog();
    localSimpleAlertDialog.setArguments(paramBundle);
    return localSimpleAlertDialog;
  }
  
  public static SimpleAlertDialog create(String paramString)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("message", paramString);
    return create(localBundle);
  }
  
  public static SimpleAlertDialog create(String paramString1, String paramString2)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("message", paramString1);
    localBundle.putString("button", paramString2);
    return create(localBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = new AlertDialog.Builder(getActivity());
    Object localObject;
    if (getArguments().containsKey("message"))
    {
      localObject = paramBundle.setMessage(getArguments().getString("message"));
      paramBundle = getArguments().getString("button");
    }
    for (;;)
    {
      ((AlertDialog.Builder)localObject).setPositiveButton(paramBundle, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {}
      });
      return ((AlertDialog.Builder)localObject).create();
      AlertDialog.Builder localBuilder = paramBundle.setMessage(getArguments().getInt("message_id"));
      String str = getArguments().getString("button");
      localObject = localBuilder;
      paramBundle = str;
      if (str == null)
      {
        paramBundle = getActivity().getString(getArguments().getInt("positiveButton_id"));
        localObject = localBuilder;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SimpleAlertDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */