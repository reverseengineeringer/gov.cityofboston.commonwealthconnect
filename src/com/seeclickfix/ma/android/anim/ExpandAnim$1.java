package com.seeclickfix.ma.android.anim;

import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;

final class ExpandAnim$1
  extends Animation
{
  ExpandAnim$1(View paramView, int paramInt) {}
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    paramTransformation = val$v.getLayoutParams();
    if (paramFloat == 1.0F) {}
    for (int i = -2;; i = (int)(val$targtetHeight * paramFloat))
    {
      height = i;
      val$v.requestLayout();
      return;
    }
  }
  
  public boolean willChangeBounds()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.anim.ExpandAnim.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */