package net.simonvt.timepicker;

import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

class TimePicker$5
  implements NumberPicker.OnValueChangeListener
{
  TimePicker$5(TimePicker paramTimePicker) {}
  
  public void onValueChange(NumberPicker paramNumberPicker, int paramInt1, int paramInt2)
  {
    TimePicker.access$000(this$0);
    paramNumberPicker.requestFocus();
    paramNumberPicker = this$0;
    if (!TimePicker.access$100(this$0)) {}
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
 * Qualified Name:     net.simonvt.timepicker.TimePicker.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */