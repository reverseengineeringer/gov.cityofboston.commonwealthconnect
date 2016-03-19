package net.simonvt.numberpicker;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;

class NumberPicker$1
  implements View.OnClickListener
{
  NumberPicker$1(NumberPicker paramNumberPicker) {}
  
  public void onClick(View paramView)
  {
    NumberPicker.access$000(this$0);
    NumberPicker.access$100(this$0).clearFocus();
    if (paramView.getId() == R.id.np__increment)
    {
      NumberPicker.access$200(this$0, true);
      return;
    }
    NumberPicker.access$200(this$0, false);
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */