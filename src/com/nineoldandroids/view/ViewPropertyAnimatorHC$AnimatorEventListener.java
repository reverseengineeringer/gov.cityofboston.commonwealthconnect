package com.nineoldandroids.view;

import android.view.View;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.Animator.AnimatorListener;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

class ViewPropertyAnimatorHC$AnimatorEventListener
  implements Animator.AnimatorListener, ValueAnimator.AnimatorUpdateListener
{
  private ViewPropertyAnimatorHC$AnimatorEventListener(ViewPropertyAnimatorHC paramViewPropertyAnimatorHC) {}
  
  public void onAnimationCancel(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorHC.access$200(this$0) != null) {
      ViewPropertyAnimatorHC.access$200(this$0).onAnimationCancel(paramAnimator);
    }
  }
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorHC.access$200(this$0) != null) {
      ViewPropertyAnimatorHC.access$200(this$0).onAnimationEnd(paramAnimator);
    }
    ViewPropertyAnimatorHC.access$300(this$0).remove(paramAnimator);
    if (ViewPropertyAnimatorHC.access$300(this$0).isEmpty()) {
      ViewPropertyAnimatorHC.access$202(this$0, null);
    }
  }
  
  public void onAnimationRepeat(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorHC.access$200(this$0) != null) {
      ViewPropertyAnimatorHC.access$200(this$0).onAnimationRepeat(paramAnimator);
    }
  }
  
  public void onAnimationStart(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorHC.access$200(this$0) != null) {
      ViewPropertyAnimatorHC.access$200(this$0).onAnimationStart(paramAnimator);
    }
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    float f1 = paramValueAnimator.getAnimatedFraction();
    paramValueAnimator = (ViewPropertyAnimatorHC.PropertyBundle)ViewPropertyAnimatorHC.access$300(this$0).get(paramValueAnimator);
    Object localObject;
    if ((mPropertyMask & 0x1FF) != 0)
    {
      localObject = (View)ViewPropertyAnimatorHC.access$400(this$0).get();
      if (localObject != null) {
        ((View)localObject).invalidate();
      }
    }
    paramValueAnimator = mNameValuesHolder;
    if (paramValueAnimator != null)
    {
      int j = paramValueAnimator.size();
      int i = 0;
      while (i < j)
      {
        localObject = (ViewPropertyAnimatorHC.NameValuesHolder)paramValueAnimator.get(i);
        float f2 = mFromValue;
        float f3 = mDeltaValue;
        ViewPropertyAnimatorHC.access$500(this$0, mNameConstant, f2 + f3 * f1);
        i += 1;
      }
    }
    paramValueAnimator = (View)ViewPropertyAnimatorHC.access$400(this$0).get();
    if (paramValueAnimator != null) {
      paramValueAnimator.invalidate();
    }
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.view.ViewPropertyAnimatorHC.AnimatorEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */