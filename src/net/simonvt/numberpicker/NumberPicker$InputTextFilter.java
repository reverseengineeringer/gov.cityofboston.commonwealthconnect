package net.simonvt.numberpicker;

import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.NumberKeyListener;

class NumberPicker$InputTextFilter
  extends NumberKeyListener
{
  NumberPicker$InputTextFilter(NumberPicker paramNumberPicker) {}
  
  public CharSequence filter(CharSequence paramCharSequence, int paramInt1, int paramInt2, Spanned paramSpanned, int paramInt3, int paramInt4)
  {
    CharSequence localCharSequence;
    if (NumberPicker.access$1000(this$0) == null)
    {
      localCharSequence = super.filter(paramCharSequence, paramInt1, paramInt2, paramSpanned, paramInt3, paramInt4);
      localObject = localCharSequence;
      if (localCharSequence == null) {
        localObject = paramCharSequence.subSequence(paramInt1, paramInt2);
      }
      paramCharSequence = String.valueOf(paramSpanned.subSequence(0, paramInt3)) + localObject + paramSpanned.subSequence(paramInt4, paramSpanned.length());
      if ("".equals(paramCharSequence)) {
        return paramCharSequence;
      }
      if (NumberPicker.access$1100(this$0, paramCharSequence) > NumberPicker.access$1200(this$0)) {
        return "";
      }
      return (CharSequence)localObject;
    }
    paramCharSequence = String.valueOf(paramCharSequence.subSequence(paramInt1, paramInt2));
    if (TextUtils.isEmpty(paramCharSequence)) {
      return "";
    }
    paramCharSequence = String.valueOf(paramSpanned.subSequence(0, paramInt3)) + paramCharSequence + paramSpanned.subSequence(paramInt4, paramSpanned.length());
    paramSpanned = String.valueOf(paramCharSequence).toLowerCase();
    Object localObject = NumberPicker.access$1000(this$0);
    paramInt2 = localObject.length;
    paramInt1 = 0;
    while (paramInt1 < paramInt2)
    {
      localCharSequence = localObject[paramInt1];
      if (localCharSequence.toLowerCase().startsWith(paramSpanned))
      {
        NumberPicker.access$1300(this$0, paramCharSequence.length(), localCharSequence.length());
        return localCharSequence.subSequence(paramInt3, localCharSequence.length());
      }
      paramInt1 += 1;
    }
    return "";
  }
  
  protected char[] getAcceptedChars()
  {
    return NumberPicker.access$900();
  }
  
  public int getInputType()
  {
    return 1;
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.InputTextFilter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */