package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.seeclickfix.ma.android.style.StyleUtil;

public class LogoTextView
  extends TextView
{
  public LogoTextView(Context paramContext)
  {
    super(paramContext);
    setTypeface(StyleUtil.getLogoTypeFace(paramContext));
  }
  
  public LogoTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    if (!isInEditMode()) {
      setCustomFont(paramContext, paramAttributeSet);
    }
  }
  
  public LogoTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setCustomFont(paramContext, paramAttributeSet);
  }
  
  private void setCustomFont(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
    {
      setTypeface(StyleUtil.getLogoTypeFace(paramContext));
      return;
    }
    paramAttributeSet = paramAttributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "textStyle");
    if (paramAttributeSet != null)
    {
      if (paramAttributeSet.equals("0x1"))
      {
        setTypeface(StyleUtil.getLogoTypeFace(paramContext));
        return;
      }
      setTypeface(StyleUtil.getLogoTypeFace(paramContext));
      return;
    }
    setTypeface(StyleUtil.getLogoTypeFace(paramContext));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.LogoTextView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */