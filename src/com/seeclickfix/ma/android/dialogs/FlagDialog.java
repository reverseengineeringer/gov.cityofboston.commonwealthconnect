package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.FlagContentEvent;
import com.squareup.otto.Bus;

public class FlagDialog
  extends DialogFragment
{
  EditText dialogInput = null;
  
  public static FlagDialog newInstance(String paramString, int paramInt)
  {
    FlagDialog localFlagDialog = new FlagDialog();
    Bundle localBundle = new Bundle();
    localBundle.putString("resource_type", paramString);
    localBundle.putInt("resource_id", paramInt);
    localFlagDialog.setArguments(localBundle);
    return localFlagDialog;
  }
  
  public String getMessage()
  {
    return dialogInput.getText().toString();
  }
  
  public int getResourceId()
  {
    return getArguments().getInt("resource_id");
  }
  
  public String getResourceType()
  {
    return getArguments().getString("resource_type");
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = getActivity().getLayoutInflater().inflate(2130903068, null);
    dialogInput = ((EditText)paramBundle.findViewById(2131361873));
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(getActivity());
    localBuilder.setView(paramBundle).setTitle(2131492994).setMessage(2131492992).setPositiveButton(2131492883, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        MyApplication.getEventBus().post(new FlagContentEvent(getResourceType(), getResourceId(), getMessage()));
        paramAnonymousDialogInterface.dismiss();
      }
    }).setNegativeButton(2131492882, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.dismiss();
      }
    });
    return localBuilder.create();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.FlagDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */