package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorListenerAdapter;
import com.nineoldandroids.view.ViewHelper;
import java.util.List;

class PlacesFrag$12
  extends AnimatorListenerAdapter
{
  PlacesFrag$12(PlacesFrag paramPlacesFrag, View paramView, ViewGroup.LayoutParams paramLayoutParams, int paramInt) {}
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    PlacesFrag.access$700(this$0);
    ViewHelper.setAlpha(val$v, 1.0F);
    ViewHelper.setTranslationX(val$v, 0.0F);
    val$lp.height = val$originalHeight;
    val$v.setLayoutParams(val$lp);
    PlacesFrag.access$900(this$0).removeView(val$v);
    PlacesFrag.access$500(this$0).remove(val$v.getTag());
    PlacesFrag.access$900(this$0).post(this$0.delayedUpdatePositions);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */