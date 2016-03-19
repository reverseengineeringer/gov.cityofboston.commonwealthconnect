package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

public class TouchParentView
  extends View
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "TouchParentView";
  
  public TouchParentView(Context paramContext)
  {
    super(paramContext);
  }
  
  public TouchParentView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public TouchParentView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    return ((ViewGroup)getParent()).onTouchEvent(paramMotionEvent);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.TouchParentView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */