package net.simonvt.numberpicker;

import java.text.DecimalFormatSymbols;
import java.util.Formatter;
import java.util.Locale;

class NumberPicker$TwoDigitFormatter
  implements NumberPicker.Formatter
{
  final Object[] mArgs = new Object[1];
  final StringBuilder mBuilder = new StringBuilder();
  Formatter mFmt;
  char mZeroDigit;
  
  NumberPicker$TwoDigitFormatter()
  {
    init(Locale.getDefault());
  }
  
  private Formatter createFormatter(Locale paramLocale)
  {
    return new Formatter(mBuilder, paramLocale);
  }
  
  private static char getZeroDigit(Locale paramLocale)
  {
    return new DecimalFormatSymbols(paramLocale).getZeroDigit();
  }
  
  private void init(Locale paramLocale)
  {
    mFmt = createFormatter(paramLocale);
    mZeroDigit = getZeroDigit(paramLocale);
  }
  
  public String format(int paramInt)
  {
    Locale localLocale = Locale.getDefault();
    if (mZeroDigit != getZeroDigit(localLocale)) {
      init(localLocale);
    }
    mArgs[0] = Integer.valueOf(paramInt);
    mBuilder.delete(0, mBuilder.length());
    mFmt.format("%02d", mArgs);
    return mFmt.toString();
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.TwoDigitFormatter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */