package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.TextView;
import com.seeclickfix.ma.android.style.StyleUtil;

public class StyledBackgroundTextView
  extends TextView
{
  public StyledBackgroundTextView(Context paramContext)
  {
    super(paramContext);
    setTypeface(StyleUtil.getTypeFace(paramContext));
  }
  
  public StyledBackgroundTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setCustomFont(paramContext, paramAttributeSet);
  }
  
  public StyledBackgroundTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setCustomFont(paramContext, paramAttributeSet);
  }
  
  private void setCustomFont(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
    {
      setTypeface(StyleUtil.getTypeFace(paramContext));
      return;
    }
    paramAttributeSet = paramAttributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "textStyle");
    if (paramAttributeSet != null)
    {
      if (paramAttributeSet.equals("0x1"))
      {
        setTypeface(StyleUtil.getTypeFaceBold(paramContext));
        return;
      }
      setTypeface(StyleUtil.getTypeFace(paramContext));
      return;
    }
    setTypeface(StyleUtil.getTypeFace(paramContext));
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.StyledBackgroundTextView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */