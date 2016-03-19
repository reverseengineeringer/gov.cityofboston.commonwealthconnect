package org.apache.commons.lang3.time;

import java.util.Calendar;

class FastDatePrinter$TextField
  implements FastDatePrinter.Rule
{
  private final int mField;
  private final String[] mValues;
  
  FastDatePrinter$TextField(int paramInt, String[] paramArrayOfString)
  {
    mField = paramInt;
    mValues = paramArrayOfString;
  }
  
  public void appendTo(StringBuffer paramStringBuffer, Calendar paramCalendar)
  {
    paramStringBuffer.append(mValues[paramCalendar.get(mField)]);
  }
  
  public int estimateLength()
  {
    int j = 0;
    int i = mValues.length;
    for (;;)
    {
      int k = i - 1;
      if (k < 0) {
        break;
      }
      int m = mValues[k].length();
      i = k;
      if (m > j)
      {
        j = m;
        i = k;
      }
    }
    return j;
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.time.FastDatePrinter.TextField
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */