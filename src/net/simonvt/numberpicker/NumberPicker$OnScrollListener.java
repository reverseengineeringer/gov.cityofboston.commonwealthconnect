package net.simonvt.numberpicker;

public abstract interface NumberPicker$OnScrollListener
{
  public static final int SCROLL_STATE_FLING = 2;
  public static final int SCROLL_STATE_IDLE = 0;
  public static final int SCROLL_STATE_TOUCH_SCROLL = 1;
  
  public abstract void onScrollStateChange(NumberPicker paramNumberPicker, int paramInt);
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.OnScrollListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */