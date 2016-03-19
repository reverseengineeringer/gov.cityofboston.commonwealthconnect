package com.seeclickfix.ma.android.dialogs;

import android.app.DatePickerDialog;
import android.app.DatePickerDialog.OnDateSetListener;
import android.app.Dialog;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.widget.DatePicker;
import java.util.Calendar;

public class DateDialog
  extends DialogFragment
  implements DatePickerDialog.OnDateSetListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_DateDialog";
  private Calendar cal = Calendar.getInstance();
  private boolean isSet = false;
  private OnCompleteListener listener;
  
  public Calendar getCalendar()
  {
    return cal;
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    int i = cal.get(1);
    int j = cal.get(2);
    int k = cal.get(5);
    return new DatePickerDialog(getActivity(), this, i, j, k);
  }
  
  public void onDateSet(DatePicker paramDatePicker, int paramInt1, int paramInt2, int paramInt3)
  {
    if (!isSet)
    {
      cal.set(1, paramInt1);
      cal.set(2, paramInt2);
      cal.set(5, paramInt3);
      if (listener != null) {
        listener.onComplete(this);
      }
      isSet = true;
    }
  }
  
  public void setListener(OnCompleteListener paramOnCompleteListener)
  {
    listener = paramOnCompleteListener;
  }
  
  public static abstract interface OnCompleteListener
  {
    public abstract void onComplete(DateDialog paramDateDialog);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.DateDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */