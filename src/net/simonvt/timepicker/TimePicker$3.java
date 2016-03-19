package net.simonvt.timepicker;

import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

class TimePicker$3
  implements NumberPicker.OnValueChangeListener
{
  TimePicker$3(TimePicker paramTimePicker) {}
  
  public void onValueChange(NumberPicker paramNumberPicker, int paramInt1, int paramInt2)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    TimePicker.access$000(this$0);
    int i = TimePicker.access$400(this$0).getMinValue();
    int j = TimePicker.access$400(this$0).getMaxValue();
    if ((paramInt1 == j) && (paramInt2 == i))
    {
      paramInt1 = TimePicker.access$500(this$0).getValue() + 1;
      if ((!this$0.is24HourView()) && (paramInt1 == 12))
      {
        paramNumberPicker = this$0;
        if (!TimePicker.access$100(this$0))
        {
          TimePicker.access$102(paramNumberPicker, bool1);
          TimePicker.access$200(this$0);
        }
      }
      else
      {
        TimePicker.access$500(this$0).setValue(paramInt1);
      }
    }
    while ((paramInt1 != i) || (paramInt2 != j)) {
      for (;;)
      {
        TimePicker.access$300(this$0);
        return;
        bool1 = false;
      }
    }
    paramInt1 = TimePicker.access$500(this$0).getValue() - 1;
    if ((!this$0.is24HourView()) && (paramInt1 == 11))
    {
      paramNumberPicker = this$0;
      if (TimePicker.access$100(this$0)) {
        break label220;
      }
    }
    label220:
    for (bool1 = bool2;; bool1 = false)
    {
      TimePicker.access$102(paramNumberPicker, bool1);
      TimePicker.access$200(this$0);
      TimePicker.access$500(this$0).setValue(paramInt1);
      break;
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.timepicker.TimePicker.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */