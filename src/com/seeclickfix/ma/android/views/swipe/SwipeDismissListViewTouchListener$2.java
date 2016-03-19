package com.seeclickfix.ma.android.views.swipe;

import android.view.View;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorListenerAdapter;

class SwipeDismissListViewTouchListener$2
  extends AnimatorListenerAdapter
{
  SwipeDismissListViewTouchListener$2(SwipeDismissListViewTouchListener paramSwipeDismissListViewTouchListener, View paramView, int paramInt) {}
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    SwipeDismissListViewTouchListener.access$000(this$0, val$downView, val$downPosition);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissListViewTouchListener.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */