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
import net.simonvt.calendarview.CalendarView;
import net.simonvt.calendarview.CalendarView.OnDateChangeListener;

public class CalendarDialog
  extends DialogFragment
  implements DialogInterface.OnDismissListener, DialogInterface.OnClickListener, CalendarView.OnDateChangeListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_CalendarView";
  private AlertDialog ad;
  private CalendarView calView;
  private long dateMs = -1L;
  private String formattedDate;
  private OnCalendarSetListener listener;
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    dateMs = calView.getDate();
    if (listener != null) {
      listener.onDateSet(dateMs);
    }
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = new AlertDialog.Builder(getActivity());
    View localView = getActivity().getLayoutInflater().inflate(2130903066, null);
    paramBundle.setView(localView);
    paramBundle.setPositiveButton(17039370, this);
    calView = ((CalendarView)localView.findViewById(2131361869));
    calView.setShowWeekNumber(false);
    calView.setOnDateChangeListener(this);
    if (dateMs > 0L) {
      calView.setDate(dateMs, true, true);
    }
    ad = paramBundle.create();
    dateMs = calView.getDate();
    return ad;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    super.onDismiss(paramDialogInterface);
  }
  
  public void onSelectedDayChange(CalendarView paramCalendarView, int paramInt1, int paramInt2, int paramInt3)
  {
    dateMs = paramCalendarView.getDate();
  }
  
  public void setDateSelectedListener(OnCalendarSetListener paramOnCalendarSetListener)
  {
    listener = paramOnCalendarSetListener;
  }
  
  public void setPreviousDate(long paramLong)
  {
    dateMs = paramLong;
  }
  
  public static abstract interface OnCalendarSetListener
  {
    public abstract void onDateSet(long paramLong);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.CalendarDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */