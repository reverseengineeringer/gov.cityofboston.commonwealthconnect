package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

public class NumDialog
  extends DialogFragment
  implements DialogInterface.OnDismissListener, DialogInterface.OnClickListener, NumberPicker.OnValueChangeListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_NumDialog";
  private AlertDialog ad;
  private OnNumCompleteListener listener;
  private NumberPicker np;
  
  public int getValue()
  {
    return np.getValue();
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt) {}
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = new AlertDialog.Builder(getActivity());
    View localView = getActivity().getLayoutInflater().inflate(2130903070, null);
    paramBundle.setView(localView);
    paramBundle.setPositiveButton(17039370, this);
    np = ((NumberPicker)localView.findViewById(2131361879));
    np.setMaxValue(100);
    np.setMinValue(0);
    np.setFocusable(true);
    np.setFocusableInTouchMode(true);
    np.setOnValueChangedListener(this);
    ad = paramBundle.create();
    return ad;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    super.onDismiss(paramDialogInterface);
    listener.onComplete(this);
  }
  
  public void onValueChange(NumberPicker paramNumberPicker, int paramInt1, int paramInt2) {}
  
  public void setListener(OnNumCompleteListener paramOnNumCompleteListener)
  {
    listener = paramOnNumCompleteListener;
  }
  
  public static abstract interface OnNumCompleteListener
  {
    public abstract void onComplete(NumDialog paramNumDialog);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.NumDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */