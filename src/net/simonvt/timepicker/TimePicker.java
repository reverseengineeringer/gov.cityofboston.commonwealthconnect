package net.simonvt.timepicker;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.OnClickListener;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

public class TimePicker
  extends FrameLayout
{
  private static final boolean DEFAULT_ENABLED_STATE = true;
  private static final int HOURS_IN_HALF_DAY = 12;
  private static final OnTimeChangedListener NO_OP_CHANGE_LISTENER = new OnTimeChangedListener()
  {
    public void onTimeChanged(TimePicker paramAnonymousTimePicker, int paramAnonymousInt1, int paramAnonymousInt2) {}
  };
  private final Button mAmPmButton;
  private final NumberPicker mAmPmSpinner;
  private final EditText mAmPmSpinnerInput;
  private final String[] mAmPmStrings;
  private Locale mCurrentLocale;
  private final TextView mDivider;
  private final NumberPicker mHourSpinner;
  private final EditText mHourSpinnerInput;
  private boolean mIs24HourView;
  private boolean mIsAm;
  private boolean mIsEnabled = true;
  private final NumberPicker mMinuteSpinner;
  private final EditText mMinuteSpinnerInput;
  private OnTimeChangedListener mOnTimeChangedListener;
  private Calendar mTempCalendar;
  
  public TimePicker(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public TimePicker(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.timePickerStyle);
  }
  
  public TimePicker(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setCurrentLocale(Locale.getDefault());
    paramInt = R.layout.time_picker_holo;
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(paramInt, this, true);
    mHourSpinner = ((NumberPicker)findViewById(R.id.hour));
    mHourSpinner.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
    {
      public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        TimePicker.this.updateInputState();
        if ((!is24HourView()) && (((paramAnonymousInt1 == 11) && (paramAnonymousInt2 == 12)) || ((paramAnonymousInt1 == 12) && (paramAnonymousInt2 == 11))))
        {
          paramAnonymousNumberPicker = TimePicker.this;
          if (mIsAm) {
            break label81;
          }
        }
        label81:
        for (boolean bool = true;; bool = false)
        {
          TimePicker.access$102(paramAnonymousNumberPicker, bool);
          TimePicker.this.updateAmPmControl();
          TimePicker.this.onTimeChanged();
          return;
        }
      }
    });
    mHourSpinnerInput = ((EditText)mHourSpinner.findViewById(R.id.np__numberpicker_input));
    mHourSpinnerInput.setImeOptions(5);
    mDivider = ((TextView)findViewById(R.id.divider));
    if (mDivider != null) {
      mDivider.setText(R.string.time_picker_separator);
    }
    mMinuteSpinner = ((NumberPicker)findViewById(R.id.minute));
    mMinuteSpinner.setMinValue(0);
    mMinuteSpinner.setMaxValue(59);
    mMinuteSpinner.setOnLongPressUpdateInterval(100L);
    mMinuteSpinner.setFormatter(NumberPicker.getTwoDigitFormatter());
    mMinuteSpinner.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
    {
      public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        boolean bool2 = true;
        boolean bool1 = true;
        TimePicker.this.updateInputState();
        int i = mMinuteSpinner.getMinValue();
        int j = mMinuteSpinner.getMaxValue();
        if ((paramAnonymousInt1 == j) && (paramAnonymousInt2 == i))
        {
          paramAnonymousInt1 = mHourSpinner.getValue() + 1;
          if ((!is24HourView()) && (paramAnonymousInt1 == 12))
          {
            paramAnonymousNumberPicker = TimePicker.this;
            if (!mIsAm)
            {
              TimePicker.access$102(paramAnonymousNumberPicker, bool1);
              TimePicker.this.updateAmPmControl();
            }
          }
          else
          {
            mHourSpinner.setValue(paramAnonymousInt1);
          }
        }
        while ((paramAnonymousInt1 != i) || (paramAnonymousInt2 != j)) {
          for (;;)
          {
            TimePicker.this.onTimeChanged();
            return;
            bool1 = false;
          }
        }
        paramAnonymousInt1 = mHourSpinner.getValue() - 1;
        if ((!is24HourView()) && (paramAnonymousInt1 == 11))
        {
          paramAnonymousNumberPicker = TimePicker.this;
          if (mIsAm) {
            break label220;
          }
        }
        label220:
        for (bool1 = bool2;; bool1 = false)
        {
          TimePicker.access$102(paramAnonymousNumberPicker, bool1);
          TimePicker.this.updateAmPmControl();
          mHourSpinner.setValue(paramAnonymousInt1);
          break;
        }
      }
    });
    mMinuteSpinnerInput = ((EditText)mMinuteSpinner.findViewById(R.id.np__numberpicker_input));
    mMinuteSpinnerInput.setImeOptions(5);
    mAmPmStrings = new DateFormatSymbols().getAmPmStrings();
    paramContext = findViewById(R.id.amPm);
    if ((paramContext instanceof Button))
    {
      mAmPmSpinner = null;
      mAmPmSpinnerInput = null;
      mAmPmButton = ((Button)paramContext);
      mAmPmButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramAnonymousView.requestFocus();
          paramAnonymousView = TimePicker.this;
          if (!mIsAm) {}
          for (boolean bool = true;; bool = false)
          {
            TimePicker.access$102(paramAnonymousView, bool);
            TimePicker.this.updateAmPmControl();
            TimePicker.this.onTimeChanged();
            return;
          }
        }
      });
    }
    for (;;)
    {
      updateHourControl();
      updateAmPmControl();
      setOnTimeChangedListener(NO_OP_CHANGE_LISTENER);
      setCurrentHour(Integer.valueOf(mTempCalendar.get(11)));
      setCurrentMinute(Integer.valueOf(mTempCalendar.get(12)));
      if (!isEnabled()) {
        setEnabled(false);
      }
      setContentDescriptions();
      if ((Build.VERSION.SDK_INT >= 16) && (getImportantForAccessibility() == 0)) {
        setImportantForAccessibility(1);
      }
      return;
      mAmPmButton = null;
      mAmPmSpinner = ((NumberPicker)paramContext);
      mAmPmSpinner.setMinValue(0);
      mAmPmSpinner.setMaxValue(1);
      mAmPmSpinner.setDisplayedValues(mAmPmStrings);
      mAmPmSpinner.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
      {
        public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2)
        {
          TimePicker.this.updateInputState();
          paramAnonymousNumberPicker.requestFocus();
          paramAnonymousNumberPicker = TimePicker.this;
          if (!mIsAm) {}
          for (boolean bool = true;; bool = false)
          {
            TimePicker.access$102(paramAnonymousNumberPicker, bool);
            TimePicker.this.updateAmPmControl();
            TimePicker.this.onTimeChanged();
            return;
          }
        }
      });
      mAmPmSpinnerInput = ((EditText)mAmPmSpinner.findViewById(R.id.np__numberpicker_input));
      mAmPmSpinnerInput.setImeOptions(6);
    }
  }
  
  private void onTimeChanged()
  {
    sendAccessibilityEvent(4);
    if (mOnTimeChangedListener != null) {
      mOnTimeChangedListener.onTimeChanged(this, getCurrentHour().intValue(), getCurrentMinute().intValue());
    }
  }
  
  private void setContentDescriptions() {}
  
  private void setCurrentLocale(Locale paramLocale)
  {
    if (paramLocale.equals(mCurrentLocale)) {
      return;
    }
    mCurrentLocale = paramLocale;
    mTempCalendar = Calendar.getInstance(paramLocale);
  }
  
  private void trySetContentDescription(View paramView, int paramInt1, int paramInt2)
  {
    paramView = paramView.findViewById(paramInt1);
    if (paramView != null) {
      paramView.setContentDescription(getContext().getString(paramInt2));
    }
  }
  
  private void updateAmPmControl()
  {
    if (is24HourView()) {
      if (mAmPmSpinner != null) {
        mAmPmSpinner.setVisibility(8);
      }
    }
    for (;;)
    {
      sendAccessibilityEvent(4);
      return;
      mAmPmButton.setVisibility(8);
      continue;
      if (mIsAm) {}
      for (int i = 0;; i = 1)
      {
        if (mAmPmSpinner == null) {
          break label81;
        }
        mAmPmSpinner.setValue(i);
        mAmPmSpinner.setVisibility(0);
        break;
      }
      label81:
      mAmPmButton.setText(mAmPmStrings[i]);
      mAmPmButton.setVisibility(0);
    }
  }
  
  private void updateHourControl()
  {
    if (is24HourView())
    {
      mHourSpinner.setMinValue(0);
      mHourSpinner.setMaxValue(23);
      mHourSpinner.setFormatter(NumberPicker.getTwoDigitFormatter());
      return;
    }
    mHourSpinner.setMinValue(1);
    mHourSpinner.setMaxValue(12);
    mHourSpinner.setFormatter(null);
  }
  
  private void updateInputState()
  {
    InputMethodManager localInputMethodManager = (InputMethodManager)getContext().getSystemService("input_method");
    if (localInputMethodManager != null)
    {
      if (!localInputMethodManager.isActive(mHourSpinnerInput)) {
        break label47;
      }
      mHourSpinnerInput.clearFocus();
      localInputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
    }
    label47:
    do
    {
      return;
      if (localInputMethodManager.isActive(mMinuteSpinnerInput))
      {
        mMinuteSpinnerInput.clearFocus();
        localInputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
        return;
      }
    } while (!localInputMethodManager.isActive(mAmPmSpinnerInput));
    mAmPmSpinnerInput.clearFocus();
    localInputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    onPopulateAccessibilityEvent(paramAccessibilityEvent);
    return true;
  }
  
  public int getBaseline()
  {
    return mHourSpinner.getBaseline();
  }
  
  public Integer getCurrentHour()
  {
    int i = mHourSpinner.getValue();
    if (is24HourView()) {
      return Integer.valueOf(i);
    }
    if (mIsAm) {
      return Integer.valueOf(i % 12);
    }
    return Integer.valueOf(i % 12 + 12);
  }
  
  public Integer getCurrentMinute()
  {
    return Integer.valueOf(mMinuteSpinner.getValue());
  }
  
  public boolean is24HourView()
  {
    return mIs24HourView;
  }
  
  public boolean isEnabled()
  {
    return mIsEnabled;
  }
  
  protected void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    setCurrentLocale(locale);
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(TimePicker.class.getName());
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
    paramAccessibilityNodeInfo.setClassName(TimePicker.class.getName());
  }
  
  public void onPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onPopulateAccessibilityEvent(paramAccessibilityEvent);
    if (mIs24HourView) {}
    for (int i = 0x1 | 0x80;; i = 0x1 | 0x40)
    {
      mTempCalendar.set(11, getCurrentHour().intValue());
      mTempCalendar.set(12, getCurrentMinute().intValue());
      String str = DateUtils.formatDateTime(getContext(), mTempCalendar.getTimeInMillis(), i);
      paramAccessibilityEvent.getText().add(str);
      return;
    }
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    setCurrentHour(Integer.valueOf(paramParcelable.getHour()));
    setCurrentMinute(Integer.valueOf(paramParcelable.getMinute()));
  }
  
  protected Parcelable onSaveInstanceState()
  {
    return new SavedState(super.onSaveInstanceState(), getCurrentHour().intValue(), getCurrentMinute().intValue(), null);
  }
  
  public void setCurrentHour(Integer paramInteger)
  {
    if ((paramInteger == null) || (paramInteger == getCurrentHour())) {
      return;
    }
    Integer localInteger = paramInteger;
    if (!is24HourView())
    {
      if (paramInteger.intValue() < 12) {
        break label78;
      }
      mIsAm = false;
      localInteger = paramInteger;
      if (paramInteger.intValue() > 12) {
        localInteger = Integer.valueOf(paramInteger.intValue() - 12);
      }
    }
    for (;;)
    {
      updateAmPmControl();
      mHourSpinner.setValue(localInteger.intValue());
      onTimeChanged();
      return;
      label78:
      mIsAm = true;
      localInteger = paramInteger;
      if (paramInteger.intValue() == 0) {
        localInteger = Integer.valueOf(12);
      }
    }
  }
  
  public void setCurrentMinute(Integer paramInteger)
  {
    if (paramInteger == getCurrentMinute()) {
      return;
    }
    mMinuteSpinner.setValue(paramInteger.intValue());
    onTimeChanged();
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    if (mIsEnabled == paramBoolean) {
      return;
    }
    super.setEnabled(paramBoolean);
    mMinuteSpinner.setEnabled(paramBoolean);
    if (mDivider != null) {
      mDivider.setEnabled(paramBoolean);
    }
    mHourSpinner.setEnabled(paramBoolean);
    if (mAmPmSpinner != null) {
      mAmPmSpinner.setEnabled(paramBoolean);
    }
    for (;;)
    {
      mIsEnabled = paramBoolean;
      return;
      mAmPmButton.setEnabled(paramBoolean);
    }
  }
  
  public void setIs24HourView(Boolean paramBoolean)
  {
    if (mIs24HourView == paramBoolean.booleanValue()) {
      return;
    }
    mIs24HourView = paramBoolean.booleanValue();
    int i = getCurrentHour().intValue();
    updateHourControl();
    setCurrentHour(Integer.valueOf(i));
    updateAmPmControl();
  }
  
  public void setOnTimeChangedListener(OnTimeChangedListener paramOnTimeChangedListener)
  {
    mOnTimeChangedListener = paramOnTimeChangedListener;
  }
  
  public static abstract interface OnTimeChangedListener
  {
    public abstract void onTimeChanged(TimePicker paramTimePicker, int paramInt1, int paramInt2);
  }
  
  private static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public TimePicker.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new TimePicker.SavedState(paramAnonymousParcel, null);
      }
      
      public TimePicker.SavedState[] newArray(int paramAnonymousInt)
      {
        return new TimePicker.SavedState[paramAnonymousInt];
      }
    };
    private final int mHour;
    private final int mMinute;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      mHour = paramParcel.readInt();
      mMinute = paramParcel.readInt();
    }
    
    private SavedState(Parcelable paramParcelable, int paramInt1, int paramInt2)
    {
      super();
      mHour = paramInt1;
      mMinute = paramInt2;
    }
    
    public int getHour()
    {
      return mHour;
    }
    
    public int getMinute()
    {
      return mMinute;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(mHour);
      paramParcel.writeInt(mMinute);
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.timepicker.TimePicker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */