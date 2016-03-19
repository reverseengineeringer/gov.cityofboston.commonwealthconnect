package net.simonvt.timepicker;

import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

class TimePicker$2
  implements NumberPicker.OnValueChangeListener
{
  TimePicker$2(TimePicker paramTimePicker) {}
  
  public void onValueChange(NumberPicker paramNumberPicker, int paramInt1, int paramInt2)
  {
    TimePicker.access$000(this$0);
    if ((!this$0.is24HourView()) && (((paramInt1 == 11) && (paramInt2 == 12)) || ((paramInt1 == 12) && (paramInt2 == 11))))
    {
      paramNumberPicker = this$0;
      if (TimePicker.access$100(this$0)) {
        break label81;
      }
    }
    label81:
    for (boolean bool = true;; bool = false)
    {
      TimePicker.access$102(paramNumberPicker, bool);
      TimePicker.access$200(this$0);
      TimePicker.access$300(this$0);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.timepicker.TimePicker.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */