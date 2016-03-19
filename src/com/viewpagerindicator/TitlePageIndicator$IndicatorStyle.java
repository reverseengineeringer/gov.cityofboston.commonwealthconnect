package com.viewpagerindicator;

public enum TitlePageIndicator$IndicatorStyle
{
  None(0),  Triangle(1),  Underline(2);
  
  public final int value;
  
  private TitlePageIndicator$IndicatorStyle(int paramInt)
  {
    value = paramInt;
  }
  
  public static IndicatorStyle fromValue(int paramInt)
  {
    IndicatorStyle[] arrayOfIndicatorStyle = values();
    int j = arrayOfIndicatorStyle.length;
    int i = 0;
    while (i < j)
    {
      IndicatorStyle localIndicatorStyle = arrayOfIndicatorStyle[i];
      if (value == paramInt) {
        return localIndicatorStyle;
      }
      i += 1;
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.TitlePageIndicator.IndicatorStyle
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */