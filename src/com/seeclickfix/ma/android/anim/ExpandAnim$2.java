package com.seeclickfix.ma.android.anim;

import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;

final class ExpandAnim$2
  extends Animation
{
  ExpandAnim$2(View paramView, int paramInt) {}
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    if (paramFloat == 1.0F)
    {
      val$v.setVisibility(8);
      return;
    }
    val$v.getLayoutParams().height = (val$initialHeight - (int)(val$initialHeight * paramFloat));
    val$v.requestLayout();
  }
  
  public boolean willChangeBounds()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.anim.ExpandAnim.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */