package com.seeclickfix.ma.android.views.swipe;

import android.view.View;
import android.view.ViewGroup.LayoutParams;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;

class SwipeDismissListViewTouchListener$4
  implements ValueAnimator.AnimatorUpdateListener
{
  SwipeDismissListViewTouchListener$4(SwipeDismissListViewTouchListener paramSwipeDismissListViewTouchListener, ViewGroup.LayoutParams paramLayoutParams, View paramView) {}
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    val$lp.height = ((Integer)paramValueAnimator.getAnimatedValue()).intValue();
    val$dismissView.setLayoutParams(val$lp);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissListViewTouchListener.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */