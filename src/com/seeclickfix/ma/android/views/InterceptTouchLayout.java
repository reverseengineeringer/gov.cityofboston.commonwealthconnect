package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;

public class InterceptTouchLayout
  extends LinearLayout
{
  public InterceptTouchLayout(Context paramContext)
  {
    super(paramContext);
  }
  
  public InterceptTouchLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.InterceptTouchLayout
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */