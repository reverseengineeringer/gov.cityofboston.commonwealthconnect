package com.seeclickfix.ma.android.views.swipe;

import android.content.Context;
import android.content.res.Resources;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorListenerAdapter;
import com.nineoldandroids.view.ViewHelper;
import com.nineoldandroids.view.ViewPropertyAnimator;

public class SwipeDismissTouchListener
  implements View.OnTouchListener
{
  private long mAnimationTime;
  private OnDismissCallback mCallback;
  private float mDownX;
  private int mMaxFlingVelocity;
  private int mMinFlingVelocity;
  private int mSlop;
  private boolean mSwiping;
  private Object mToken;
  private float mTranslationX;
  private View mUndoView;
  private VelocityTracker mVelocityTracker;
  private View mView;
  private int mViewWidth = 1;
  
  public SwipeDismissTouchListener(View paramView, Object paramObject, OnDismissCallback paramOnDismissCallback)
  {
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(paramView.getContext());
    mSlop = localViewConfiguration.getScaledTouchSlop();
    mMinFlingVelocity = (localViewConfiguration.getScaledMinimumFlingVelocity() * 10);
    mMaxFlingVelocity = localViewConfiguration.getScaledMaximumFlingVelocity();
    mAnimationTime = paramView.getContext().getResources().getInteger(17694720);
    mView = paramView;
    mToken = paramObject;
    mCallback = paramOnDismissCallback;
  }
  
  private void performDismiss()
  {
    mCallback.onDismiss(mView, mToken);
  }
  
  private void showUndoRow()
  {
    if (mUndoView != null) {}
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    paramMotionEvent.offsetLocation(mTranslationX, 0.0F);
    if (mViewWidth < 2) {
      mViewWidth = mView.getWidth();
    }
    switch (paramMotionEvent.getActionMasked())
    {
    }
    float f1;
    label209:
    label346:
    label356:
    do
    {
      do
      {
        do
        {
          return false;
          mDownX = paramMotionEvent.getRawX();
          mVelocityTracker = VelocityTracker.obtain();
          mVelocityTracker.addMovement(paramMotionEvent);
          paramView.onTouchEvent(paramMotionEvent);
          return false;
        } while (mVelocityTracker == null);
        f1 = paramMotionEvent.getRawX() - mDownX;
        mVelocityTracker.addMovement(paramMotionEvent);
        mVelocityTracker.computeCurrentVelocity(1000);
        float f2 = Math.abs(mVelocityTracker.getXVelocity());
        float f3 = Math.abs(mVelocityTracker.getYVelocity());
        int k = 0;
        int m = 0;
        int j;
        int i;
        if (Math.abs(f1) > mViewWidth / 2)
        {
          j = 1;
          if (f1 > 0.0F)
          {
            i = 1;
            if (j == 0) {
              break label356;
            }
            paramView = ViewPropertyAnimator.animate(mView);
            if (i == 0) {
              break label346;
            }
            f1 = mViewWidth;
            paramView.translationX(f1).alpha(0.0F).setDuration(mAnimationTime).setListener(new AnimatorListenerAdapter()
            {
              public void onAnimationEnd(Animator paramAnonymousAnimator)
              {
                SwipeDismissTouchListener.this.performDismiss();
              }
            });
          }
        }
        for (;;)
        {
          mVelocityTracker = null;
          mTranslationX = 0.0F;
          mDownX = 0.0F;
          mSwiping = false;
          return false;
          i = 0;
          break;
          j = k;
          i = m;
          if (mMinFlingVelocity > f2) {
            break;
          }
          j = k;
          i = m;
          if (f2 > mMaxFlingVelocity) {
            break;
          }
          j = k;
          i = m;
          if (f3 >= f2) {
            break;
          }
          j = 1;
          if (mVelocityTracker.getXVelocity() > 0.0F) {}
          for (i = 1;; i = 0) {
            break;
          }
          f1 = -mViewWidth;
          break label209;
          ViewPropertyAnimator.animate(mView).translationX(0.0F).alpha(1.0F).setDuration(mAnimationTime).setListener(null);
        }
      } while (mVelocityTracker == null);
      mVelocityTracker.addMovement(paramMotionEvent);
      f1 = paramMotionEvent.getRawX() - mDownX;
      if (Math.abs(f1) > mSlop)
      {
        mSwiping = true;
        mView.getParent().requestDisallowInterceptTouchEvent(true);
        paramView = MotionEvent.obtain(paramMotionEvent);
        paramView.setAction(paramMotionEvent.getActionIndex() << 8 | 0x3);
        mView.onTouchEvent(paramView);
      }
    } while (!mSwiping);
    mTranslationX = f1;
    ViewHelper.setTranslationX(mView, f1);
    ViewHelper.setAlpha(mView, Math.max(0.0F, Math.min(1.0F, 1.0F - 2.0F * Math.abs(f1) / mViewWidth)));
    return true;
  }
  
  public void setUndoResId(int paramInt, ViewGroup paramViewGroup)
  {
    mUndoView = ViewUtil.inflate(paramViewGroup.getContext(), paramInt, paramViewGroup);
  }
  
  public static abstract interface OnDismissCallback
  {
    public abstract void onDismiss(View paramView, Object paramObject);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissTouchListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */