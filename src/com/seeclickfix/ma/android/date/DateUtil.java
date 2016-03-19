package com.seeclickfix.ma.android.date;

import android.annotation.SuppressLint;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class DateUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DateUtil";
  
  public static String formatDateString(String paramString)
  {
    DateFormat localDateFormat = SimpleDateFormat.getDateInstance(3, Locale.getDefault());
    try
    {
      paramString = localDateFormat.format(toCalendar(paramString).getTime());
      return paramString;
    }
    catch (ParseException paramString) {}
    return "";
  }
  
  @SuppressLint({"SimpleDateFormat"})
  public static String formatMilliDateToISO(Long paramLong)
  {
    return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ").format(new Date(paramLong.longValue()));
  }
  
  public static String getAPIFormattedDate(long paramLong)
  {
    return "TODO";
  }
  
  public static String getDateDisplayStringFromMSEpoch(long paramLong)
  {
    if (paramLong <= 0L) {
      return "";
    }
    return SimpleDateFormat.getDateInstance(3, Locale.getDefault()).format(new Date(paramLong));
  }
  
  public static String getDateTimeDisplayStringFromMSEpoch(long paramLong)
  {
    return SimpleDateFormat.getDateTimeInstance(3, 3, Locale.getDefault()).format(new Date(paramLong));
  }
  
  public static String getTextFromMinsSince(int paramInt)
  {
    long l = paramInt * 1000;
    Date localDate = new Date(System.currentTimeMillis() - l);
    return SimpleDateFormat.getDateInstance(1).format(localDate);
  }
  
  @SuppressLint({"SimpleDateFormat"})
  public static Calendar toCalendar(String paramString)
    throws ParseException
  {
    Calendar localCalendar = GregorianCalendar.getInstance();
    paramString = paramString.replace("Z", "+00:00");
    try
    {
      paramString = paramString.substring(0, 22) + paramString.substring(23);
      localCalendar.setTime(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(paramString));
      return localCalendar;
    }
    catch (IndexOutOfBoundsException paramString)
    {
      throw new ParseException("Invalid length", 0);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.date.DateUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */