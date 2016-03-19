package com.seeclickfix.ma.android.views.swipe;

import android.view.View;
import android.view.ViewGroup.LayoutParams;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorListenerAdapter;
import com.nineoldandroids.view.ViewHelper;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

class SwipeDismissListViewTouchListener$3
  extends AnimatorListenerAdapter
{
  SwipeDismissListViewTouchListener$3(SwipeDismissListViewTouchListener paramSwipeDismissListViewTouchListener, int paramInt) {}
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    SwipeDismissListViewTouchListener.access$106(this$0);
    if (SwipeDismissListViewTouchListener.access$100(this$0) == 0)
    {
      Collections.sort(SwipeDismissListViewTouchListener.access$200(this$0));
      paramAnimator = new int[SwipeDismissListViewTouchListener.access$200(this$0).size()];
      int i = SwipeDismissListViewTouchListener.access$200(this$0).size() - 1;
      while (i >= 0)
      {
        paramAnimator[i] = access$200this$0).get(i)).position;
        i -= 1;
      }
      SwipeDismissListViewTouchListener.access$400(this$0).onDismiss(SwipeDismissListViewTouchListener.access$300(this$0), paramAnimator);
      paramAnimator = SwipeDismissListViewTouchListener.access$200(this$0).iterator();
      while (paramAnimator.hasNext())
      {
        SwipeDismissListViewTouchListener.PendingDismissData localPendingDismissData = (SwipeDismissListViewTouchListener.PendingDismissData)paramAnimator.next();
        ViewHelper.setAlpha(view, 1.0F);
        ViewHelper.setTranslationX(view, 0.0F);
        ViewGroup.LayoutParams localLayoutParams = view.getLayoutParams();
        height = val$originalHeight;
        view.setLayoutParams(localLayoutParams);
      }
      SwipeDismissListViewTouchListener.access$200(this$0).clear();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissListViewTouchListener.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */