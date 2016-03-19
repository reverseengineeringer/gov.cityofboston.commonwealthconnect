package net.simonvt.timepicker;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;

public class TimePickerDialog
  extends AlertDialog
  implements DialogInterface.OnClickListener, TimePicker.OnTimeChangedListener
{
  private static final String HOUR = "hour";
  private static final String IS_24_HOUR = "is24hour";
  private static final String MINUTE = "minute";
  private final OnTimeSetListener mCallback;
  int mInitialHourOfDay;
  int mInitialMinute;
  boolean mIs24HourView;
  private final TimePicker mTimePicker;
  
  public TimePickerDialog(Context paramContext, int paramInt1, OnTimeSetListener paramOnTimeSetListener, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    super(paramContext, paramInt1);
    mCallback = paramOnTimeSetListener;
    mInitialHourOfDay = paramInt2;
    mInitialMinute = paramInt3;
    mIs24HourView = paramBoolean;
    setIcon(0);
    setTitle(R.string.time_picker_dialog_title);
    paramContext = getContext();
    setButton(-1, paramContext.getText(R.string.date_time_done), this);
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.time_picker_dialog, null);
    setView(paramContext);
    mTimePicker = ((TimePicker)paramContext.findViewById(R.id.timePicker));
    mTimePicker.setIs24HourView(Boolean.valueOf(mIs24HourView));
    mTimePicker.setCurrentHour(Integer.valueOf(mInitialHourOfDay));
    mTimePicker.setCurrentMinute(Integer.valueOf(mInitialMinute));
    mTimePicker.setOnTimeChangedListener(this);
  }
  
  public TimePickerDialog(Context paramContext, OnTimeSetListener paramOnTimeSetListener, int paramInt1, int paramInt2, boolean paramBoolean) {}
  
  private void tryNotifyTimeSet()
  {
    if (mCallback != null)
    {
      mTimePicker.clearFocus();
      mCallback.onTimeSet(mTimePicker, mTimePicker.getCurrentHour().intValue(), mTimePicker.getCurrentMinute().intValue());
    }
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    tryNotifyTimeSet();
  }
  
  public void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
    int i = paramBundle.getInt("hour");
    int j = paramBundle.getInt("minute");
    mTimePicker.setIs24HourView(Boolean.valueOf(paramBundle.getBoolean("is24hour")));
    mTimePicker.setCurrentHour(Integer.valueOf(i));
    mTimePicker.setCurrentMinute(Integer.valueOf(j));
  }
  
  public Bundle onSaveInstanceState()
  {
    Bundle localBundle = super.onSaveInstanceState();
    localBundle.putInt("hour", mTimePicker.getCurrentHour().intValue());
    localBundle.putInt("minute", mTimePicker.getCurrentMinute().intValue());
    localBundle.putBoolean("is24hour", mTimePicker.is24HourView());
    return localBundle;
  }
  
  protected void onStop()
  {
    tryNotifyTimeSet();
    super.onStop();
  }
  
  public void onTimeChanged(TimePicker paramTimePicker, int paramInt1, int paramInt2) {}
  
  public void updateTime(int paramInt1, int paramInt2)
  {
    mTimePicker.setCurrentHour(Integer.valueOf(paramInt1));
    mTimePicker.setCurrentMinute(Integer.valueOf(paramInt2));
  }
  
  public static abstract interface OnTimeSetListener
  {
    public abstract void onTimeSet(TimePicker paramTimePicker, int paramInt1, int paramInt2);
  }
}

/* Location:
 * Qualified Name:     net.simonvt.timepicker.TimePickerDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */