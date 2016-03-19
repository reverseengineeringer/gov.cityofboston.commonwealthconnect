package net.simonvt.numberpicker;

import android.view.ViewConfiguration;

class NumberPicker$PressedStateHelper
  implements Runnable
{
  public static final int BUTTON_DECREMENT = 2;
  public static final int BUTTON_INCREMENT = 1;
  private final int MODE_PRESS = 1;
  private final int MODE_TAPPED = 2;
  private int mManagedButton;
  private int mMode;
  
  NumberPicker$PressedStateHelper(NumberPicker paramNumberPicker) {}
  
  public void buttonPressDelayed(int paramInt)
  {
    cancel();
    mMode = 1;
    mManagedButton = paramInt;
    this$0.postDelayed(this, ViewConfiguration.getTapTimeout());
  }
  
  public void buttonTapped(int paramInt)
  {
    cancel();
    mMode = 2;
    mManagedButton = paramInt;
    this$0.post(this);
  }
  
  public void cancel()
  {
    mMode = 0;
    mManagedButton = 0;
    this$0.removeCallbacks(this);
    if (NumberPicker.access$1400(this$0))
    {
      NumberPicker.access$1402(this$0, false);
      this$0.invalidate(0, NumberPicker.access$1500(this$0), this$0.getRight(), this$0.getBottom());
    }
    NumberPicker.access$1602(this$0, false);
    if (NumberPicker.access$1600(this$0)) {
      this$0.invalidate(0, 0, this$0.getRight(), NumberPicker.access$1700(this$0));
    }
  }
  
  public void run()
  {
    switch (mMode)
    {
    default: 
      return;
    case 1: 
      switch (mManagedButton)
      {
      default: 
        return;
      case 1: 
        NumberPicker.access$1402(this$0, true);
        this$0.invalidate(0, NumberPicker.access$1500(this$0), this$0.getRight(), this$0.getBottom());
        return;
      }
      NumberPicker.access$1602(this$0, true);
      this$0.invalidate(0, 0, this$0.getRight(), NumberPicker.access$1700(this$0));
      return;
    }
    switch (mManagedButton)
    {
    default: 
      return;
    case 1: 
      if (!NumberPicker.access$1400(this$0)) {
        this$0.postDelayed(this, ViewConfiguration.getPressedStateDuration());
      }
      NumberPicker.access$1480(this$0, 1);
      this$0.invalidate(0, NumberPicker.access$1500(this$0), this$0.getRight(), this$0.getBottom());
      return;
    }
    if (!NumberPicker.access$1600(this$0)) {
      this$0.postDelayed(this, ViewConfiguration.getPressedStateDuration());
    }
    NumberPicker.access$1680(this$0, 1);
    this$0.invalidate(0, 0, this$0.getRight(), NumberPicker.access$1700(this$0));
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.PressedStateHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */