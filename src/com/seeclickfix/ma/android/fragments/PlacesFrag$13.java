package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.ViewGroup.LayoutParams;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;

class PlacesFrag$13
  implements ValueAnimator.AnimatorUpdateListener
{
  PlacesFrag$13(PlacesFrag paramPlacesFrag, ViewGroup.LayoutParams paramLayoutParams, View paramView) {}
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    val$lp.height = ((Integer)paramValueAnimator.getAnimatedValue()).intValue();
    val$v.setLayoutParams(val$lp);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */