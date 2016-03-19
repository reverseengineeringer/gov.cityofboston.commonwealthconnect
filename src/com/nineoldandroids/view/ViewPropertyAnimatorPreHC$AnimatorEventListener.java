package com.nineoldandroids.view;

import android.view.View;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.Animator.AnimatorListener;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

class ViewPropertyAnimatorPreHC$AnimatorEventListener
  implements Animator.AnimatorListener, ValueAnimator.AnimatorUpdateListener
{
  private ViewPropertyAnimatorPreHC$AnimatorEventListener(ViewPropertyAnimatorPreHC paramViewPropertyAnimatorPreHC) {}
  
  public void onAnimationCancel(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorPreHC.access$200(this$0) != null) {
      ViewPropertyAnimatorPreHC.access$200(this$0).onAnimationCancel(paramAnimator);
    }
  }
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorPreHC.access$200(this$0) != null) {
      ViewPropertyAnimatorPreHC.access$200(this$0).onAnimationEnd(paramAnimator);
    }
    ViewPropertyAnimatorPreHC.access$300(this$0).remove(paramAnimator);
    if (ViewPropertyAnimatorPreHC.access$300(this$0).isEmpty()) {
      ViewPropertyAnimatorPreHC.access$202(this$0, null);
    }
  }
  
  public void onAnimationRepeat(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorPreHC.access$200(this$0) != null) {
      ViewPropertyAnimatorPreHC.access$200(this$0).onAnimationRepeat(paramAnimator);
    }
  }
  
  public void onAnimationStart(Animator paramAnimator)
  {
    if (ViewPropertyAnimatorPreHC.access$200(this$0) != null) {
      ViewPropertyAnimatorPreHC.access$200(this$0).onAnimationStart(paramAnimator);
    }
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    float f1 = paramValueAnimator.getAnimatedFraction();
    paramValueAnimator = (ViewPropertyAnimatorPreHC.PropertyBundle)ViewPropertyAnimatorPreHC.access$300(this$0).get(paramValueAnimator);
    Object localObject;
    if ((mPropertyMask & 0x1FF) != 0)
    {
      localObject = (View)ViewPropertyAnimatorPreHC.access$400(this$0).get();
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
        localObject = (ViewPropertyAnimatorPreHC.NameValuesHolder)paramValueAnimator.get(i);
        float f2 = mFromValue;
        float f3 = mDeltaValue;
        ViewPropertyAnimatorPreHC.access$500(this$0, mNameConstant, f2 + f3 * f1);
        i += 1;
      }
    }
    paramValueAnimator = (View)ViewPropertyAnimatorPreHC.access$400(this$0).get();
    if (paramValueAnimator != null) {
      paramValueAnimator.invalidate();
    }
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.view.ViewPropertyAnimatorPreHC.AnimatorEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */