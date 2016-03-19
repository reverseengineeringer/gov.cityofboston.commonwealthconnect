package com.seeclickfix.ma.android.anim;

import android.content.Context;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;

public class Transitions
{
  public static Animation dropDown(Context paramContext, View paramView, int paramInt, boolean paramBoolean)
  {
    paramContext = new DropDownAnim(paramView, paramInt, paramBoolean);
    paramContext.setInterpolator(new DecelerateInterpolator());
    paramContext.setDuration(300L);
    paramContext.setFillBefore(true);
    paramContext.setFillEnabled(true);
    paramContext.setFillAfter(true);
    return paramContext;
  }
  
  public static Animation fadeIn(Context paramContext)
  {
    paramContext = AnimationUtils.loadAnimation(paramContext, 2130968582);
    paramContext.setFillBefore(true);
    paramContext.setFillEnabled(true);
    paramContext.setFillAfter(true);
    return paramContext;
  }
  
  public static Animation fadeOut(Context paramContext)
  {
    paramContext = AnimationUtils.loadAnimation(paramContext, 2130968583);
    paramContext.setFillBefore(true);
    paramContext.setFillEnabled(true);
    paramContext.setFillAfter(true);
    return paramContext;
  }
  
  public static void setFragTransAnim(FragmentTransaction paramFragmentTransaction)
  {
    paramFragmentTransaction.setCustomAnimations(2130968582, 2130968583, 2130968582, 2130968583);
  }
  
  public static Animation slideDown(Context paramContext)
  {
    return AnimationUtils.loadAnimation(paramContext, 2130968584);
  }
  
  public static Animation slideUp(Context paramContext)
  {
    return AnimationUtils.loadAnimation(paramContext, 2130968585);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.anim.Transitions
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */