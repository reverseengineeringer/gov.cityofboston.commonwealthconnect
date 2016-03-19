package com.viewpagerindicator;

public enum TitlePageIndicator$LinePosition
{
  Bottom(0),  Top(1);
  
  public final int value;
  
  private TitlePageIndicator$LinePosition(int paramInt)
  {
    value = paramInt;
  }
  
  public static LinePosition fromValue(int paramInt)
  {
    LinePosition[] arrayOfLinePosition = values();
    int j = arrayOfLinePosition.length;
    int i = 0;
    while (i < j)
    {
      LinePosition localLinePosition = arrayOfLinePosition[i];
      if (value == paramInt) {
        return localLinePosition;
      }
      i += 1;
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.TitlePageIndicator.LinePosition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */