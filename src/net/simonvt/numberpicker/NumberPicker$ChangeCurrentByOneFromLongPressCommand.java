package net.simonvt.numberpicker;

class NumberPicker$ChangeCurrentByOneFromLongPressCommand
  implements Runnable
{
  private boolean mIncrement;
  
  NumberPicker$ChangeCurrentByOneFromLongPressCommand(NumberPicker paramNumberPicker) {}
  
  private void setStep(boolean paramBoolean)
  {
    mIncrement = paramBoolean;
  }
  
  public void run()
  {
    NumberPicker.access$200(this$0, mIncrement);
    this$0.postDelayed(this, NumberPicker.access$1800(this$0));
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.ChangeCurrentByOneFromLongPressCommand
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */