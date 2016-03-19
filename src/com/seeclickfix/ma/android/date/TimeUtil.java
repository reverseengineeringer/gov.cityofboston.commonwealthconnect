package com.seeclickfix.ma.android.date;

public class TimeUtil
{
  public static final String AM = "AM";
  public static final String PM = "PM";
  
  public static String getMeridian(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 23)) {
      throw new IllegalArgumentException("hourOfDay was not in range 0-23");
    }
    if (paramInt < 11) {
      return "AM";
    }
    return "PM";
  }
  
  public static String getTwelveHour(int paramInt)
  {
    int i = 12;
    if ((paramInt < 0) || (paramInt > 23)) {
      throw new IllegalArgumentException("hourOfDay was not in range 0-23");
    }
    if (paramInt < 11)
    {
      i = paramInt;
      if (paramInt == 0) {
        i = 12;
      }
      return String.valueOf(i);
    }
    if (paramInt - 11 == 0) {
      paramInt = i;
    }
    for (;;)
    {
      return String.valueOf(paramInt);
      paramInt -= 11;
    }
  }
  
  public static String padZeroIfSingleDigit(int paramInt)
  {
    if (paramInt >= 10) {
      return String.valueOf(paramInt);
    }
    return "0" + String.valueOf(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.date.TimeUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */