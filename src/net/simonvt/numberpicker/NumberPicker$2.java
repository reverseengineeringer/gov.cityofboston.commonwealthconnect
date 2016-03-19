package net.simonvt.numberpicker;

import android.view.View;
import android.view.View.OnLongClickListener;
import android.widget.EditText;

class NumberPicker$2
  implements View.OnLongClickListener
{
  NumberPicker$2(NumberPicker paramNumberPicker) {}
  
  public boolean onLongClick(View paramView)
  {
    NumberPicker.access$000(this$0);
    NumberPicker.access$100(this$0).clearFocus();
    if (paramView.getId() == R.id.np__increment)
    {
      NumberPicker.access$300(this$0, true, 0L);
      return true;
    }
    NumberPicker.access$300(this$0, false, 0L);
    return true;
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */