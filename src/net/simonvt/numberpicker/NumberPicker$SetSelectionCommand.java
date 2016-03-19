package net.simonvt.numberpicker;

import android.widget.EditText;

class NumberPicker$SetSelectionCommand
  implements Runnable
{
  private int mSelectionEnd;
  private int mSelectionStart;
  
  NumberPicker$SetSelectionCommand(NumberPicker paramNumberPicker) {}
  
  public void run()
  {
    NumberPicker.access$100(this$0).setSelection(mSelectionStart, mSelectionEnd);
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.SetSelectionCommand
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */