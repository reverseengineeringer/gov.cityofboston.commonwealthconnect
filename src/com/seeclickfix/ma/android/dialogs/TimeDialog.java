package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.View;
import com.seeclickfix.ma.android.date.TimeUtil;
import java.util.Calendar;
import net.simonvt.timepicker.TimePicker;
import net.simonvt.timepicker.TimePicker.OnTimeChangedListener;

public class TimeDialog
  extends DialogFragment
  implements DialogInterface.OnClickListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "TimeDialog";
  Calendar cal = Calendar.getInstance();
  private String formattedTime;
  private OnTimeValueSetListener listener;
  private int mHour;
  private boolean mIs24Time;
  private int mMinute;
  private TimePicker.OnTimeChangedListener mTimeChangedListener;
  private TimePicker picker;
  
  public TimeDialog()
  {
    setupListeners();
  }
  
  public static TimeDialog newInstance(Context paramContext)
  {
    TimeDialog localTimeDialog = new TimeDialog();
    localTimeDialog.setContext(paramContext);
    return localTimeDialog;
  }
  
  private void setContext(Context paramContext)
  {
    mIs24Time = DateFormat.is24HourFormat(paramContext);
  }
  
  private void setCurrentTime(TimePicker paramTimePicker)
  {
    mHour = cal.get(11);
    mMinute = cal.get(12);
  }
  
  private void setPreviousTime(TimePicker paramTimePicker)
  {
    int i = formattedTime.indexOf(":");
    int j = formattedTime.indexOf(" ");
    int k = formattedTime.length();
    String str3 = formattedTime.substring(0, i);
    String str2 = formattedTime.substring(i + 1, k);
    String str1 = "..";
    if (!mIs24Time)
    {
      str2 = formattedTime.substring(i + 1, j);
      str1 = formattedTime.substring(j + 1, k);
    }
    j = Integer.valueOf(str3).intValue();
    k = Integer.valueOf(str2).intValue();
    i = j;
    if (mIs24Time)
    {
      if (!str1.equalsIgnoreCase("PM")) {
        break label153;
      }
      i = j + 12;
    }
    for (;;)
    {
      paramTimePicker.setCurrentHour(Integer.valueOf(i));
      paramTimePicker.setCurrentMinute(Integer.valueOf(k));
      return;
      label153:
      i = j;
      if (str1.equalsIgnoreCase("AM"))
      {
        i = j;
        if (j == 12) {
          i = 0;
        }
      }
    }
  }
  
  private void setupListeners()
  {
    mTimeChangedListener = new TimePicker.OnTimeChangedListener()
    {
      public void onTimeChanged(TimePicker paramAnonymousTimePicker, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        TimeDialog.access$002(TimeDialog.this, paramAnonymousInt1);
        TimeDialog.access$102(TimeDialog.this, paramAnonymousInt2);
      }
    };
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (listener != null)
    {
      new StringBuilder().append(mHour).append(":").append(TimeUtil.padZeroIfSingleDigit(mMinute)).toString();
      cal.set(11, mHour);
      cal.set(12, mMinute);
      listener.onTimeSet((Calendar)cal.clone());
    }
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    paramBundle = new AlertDialog.Builder(getActivity());
    View localView = getActivity().getLayoutInflater().inflate(2130903072, null);
    paramBundle.setView(localView);
    paramBundle.setPositiveButton(17039370, this);
    picker = ((TimePicker)localView.findViewById(2131361881));
    picker.setIs24HourView(Boolean.valueOf(mIs24Time));
    picker.setOnTimeChangedListener(mTimeChangedListener);
    if (formattedTime != null) {
      setPreviousTime(picker);
    }
    for (;;)
    {
      return paramBundle.create();
      setCurrentTime(picker);
    }
  }
  
  public void setOnTimeValueSetListener(OnTimeValueSetListener paramOnTimeValueSetListener)
  {
    listener = paramOnTimeValueSetListener;
  }
  
  public void setPreviousTime(String paramString)
  {
    formattedTime = paramString;
  }
  
  public static abstract interface OnTimeValueSetListener
  {
    public abstract void onTimeSet(Calendar paramCalendar);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.TimeDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */