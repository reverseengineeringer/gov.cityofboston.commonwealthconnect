package com.viewpagerindicator;

import android.content.Context;
import android.view.View.MeasureSpec;
import android.widget.TextView;

class TabPageIndicator$TabView
  extends TextView
{
  private int mIndex;
  
  public TabPageIndicator$TabView(TabPageIndicator paramTabPageIndicator, Context paramContext)
  {
    super(paramContext, null, R.attr.vpiTabPageIndicatorStyle);
  }
  
  public int getIndex()
  {
    return mIndex;
  }
  
  public void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if ((TabPageIndicator.access$400(this$0) > 0) && (getMeasuredWidth() > TabPageIndicator.access$400(this$0))) {
      super.onMeasure(View.MeasureSpec.makeMeasureSpec(TabPageIndicator.access$400(this$0), 0), paramInt2);
    }
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.TabPageIndicator.TabView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */