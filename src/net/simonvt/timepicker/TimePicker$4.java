package net.simonvt.timepicker;

import android.view.View;
import android.view.View.OnClickListener;

class TimePicker$4
  implements View.OnClickListener
{
  TimePicker$4(TimePicker paramTimePicker) {}
  
  public void onClick(View paramView)
  {
    paramView.requestFocus();
    paramView = this$0;
    if (!TimePicker.access$100(this$0)) {}
    for (boolean bool = true;; bool = false)
    {
      TimePicker.access$102(paramView, bool);
      TimePicker.access$200(this$0);
      TimePicker.access$300(this$0);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.timepicker.TimePicker.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */