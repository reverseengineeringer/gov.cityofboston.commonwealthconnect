package com.seeclickfix.ma.android.anim;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;

public class ExpandAnim
{
  public static void collapse(View paramView)
  {
    final int i = paramView.getMeasuredHeight();
    Animation local2 = new Animation()
    {
      protected void applyTransformation(float paramAnonymousFloat, Transformation paramAnonymousTransformation)
      {
        if (paramAnonymousFloat == 1.0F)
        {
          val$v.setVisibility(8);
          return;
        }
        val$v.getLayoutParams().height = (i - (int)(i * paramAnonymousFloat));
        val$v.requestLayout();
      }
      
      public boolean willChangeBounds()
      {
        return true;
      }
    };
    local2.setDuration((int)(i / getContextgetResourcesgetDisplayMetricsdensity));
    paramView.startAnimation(local2);
  }
  
  public static void expand(View paramView)
  {
    paramView.measure(-1, -2);
    final int i = paramView.getMeasuredHeight();
    getLayoutParamsheight = 0;
    paramView.setVisibility(0);
    Animation local1 = new Animation()
    {
      protected void applyTransformation(float paramAnonymousFloat, Transformation paramAnonymousTransformation)
      {
        paramAnonymousTransformation = val$v.getLayoutParams();
        if (paramAnonymousFloat == 1.0F) {}
        for (int i = -2;; i = (int)(i * paramAnonymousFloat))
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
    };
    local1.setDuration((int)(i / getContextgetResourcesgetDisplayMetricsdensity));
    paramView.startAnimation(local1);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.anim.ExpandAnim
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */