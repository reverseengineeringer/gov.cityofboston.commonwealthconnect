package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.GridView;

public class ResizableGridView
  extends GridView
{
  boolean expanded = false;
  
  public ResizableGridView(Context paramContext)
  {
    super(paramContext);
  }
  
  public ResizableGridView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public ResizableGridView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public boolean isExpanded()
  {
    return expanded;
  }
  
  public void onMeasure(int paramInt1, int paramInt2)
  {
    if (isExpanded())
    {
      super.onMeasure(paramInt1, View.MeasureSpec.makeMeasureSpec(536870911, Integer.MIN_VALUE));
      getLayoutParamsheight = getMeasuredHeight();
      return;
    }
    super.onMeasure(paramInt1, paramInt2);
  }
  
  public void setExpanded(boolean paramBoolean)
  {
    expanded = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ResizableGridView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */