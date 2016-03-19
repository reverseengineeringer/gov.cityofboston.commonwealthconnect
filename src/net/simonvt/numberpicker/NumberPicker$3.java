package net.simonvt.numberpicker;

import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.widget.EditText;

class NumberPicker$3
  implements View.OnFocusChangeListener
{
  NumberPicker$3(NumberPicker paramNumberPicker) {}
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      NumberPicker.access$100(this$0).selectAll();
      return;
    }
    NumberPicker.access$100(this$0).setSelection(0, 0);
    NumberPicker.access$400(this$0, paramView);
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */