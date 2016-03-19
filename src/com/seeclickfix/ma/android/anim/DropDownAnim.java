package com.seeclickfix.ma.android.anim;

import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;

public class DropDownAnim
  extends Animation
{
  boolean down;
  int targetHeight;
  View view;
  
  public DropDownAnim(View paramView, int paramInt, boolean paramBoolean)
  {
    view = paramView;
    targetHeight = paramInt;
    down = paramBoolean;
  }
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    if (down) {}
    for (int i = (int)(targetHeight * paramFloat);; i = (int)(targetHeight * (1.0F - paramFloat)))
    {
      view.getLayoutParams().height = i;
      view.requestLayout();
      return;
    }
  }
  
  public void initialize(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.initialize(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public boolean willChangeBounds()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.anim.DropDownAnim
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */