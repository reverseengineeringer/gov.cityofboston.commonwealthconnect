package com.seeclickfix.ma.android.fragments;

import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;

class UnboxingPagerFrag$MyGestureDetector
  extends GestureDetector.SimpleOnGestureListener
{
  UnboxingPagerFrag$MyGestureDetector(UnboxingPagerFrag paramUnboxingPagerFrag) {}
  
  public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    try
    {
      if (Math.abs(paramMotionEvent1.getY() - paramMotionEvent2.getY()) > 250.0F) {
        return false;
      }
      if ((paramMotionEvent1.getX() - paramMotionEvent2.getX() > 120.0F) && (Math.abs(paramFloat1) > 200.0F))
      {
        this$0.checkForFinishSwipe();
        return false;
      }
      if (paramMotionEvent2.getX() - paramMotionEvent1.getX() > 120.0F)
      {
        paramFloat1 = Math.abs(paramFloat1);
        if (paramFloat1 <= 200.0F) {}
      }
      return false;
    }
    catch (Exception paramMotionEvent1) {}
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.UnboxingPagerFrag.MyGestureDetector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */