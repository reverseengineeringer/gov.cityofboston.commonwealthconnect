package com.seeclickfix.ma.android.views.swipe;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.ListView;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorListenerAdapter;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import com.nineoldandroids.view.ViewHelper;
import com.nineoldandroids.view.ViewPropertyAnimator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class SwipeDismissListViewTouchListener
  implements View.OnTouchListener
{
  private long mAnimationTime;
  private OnDismissCallback mCallback;
  private int mDismissAnimationRefCount = 0;
  private int mDownPosition;
  private View mDownView;
  private float mDownX;
  private ListView mListView;
  private int mMaxFlingVelocity;
  private int mMinFlingVelocity;
  private boolean mPaused;
  private List<PendingDismissData> mPendingDismisses = new ArrayList();
  private int mSlop;
  private boolean mSwiping;
  private VelocityTracker mVelocityTracker;
  private int mViewWidth = 1;
  
  public SwipeDismissListViewTouchListener(ListView paramListView, OnDismissCallback paramOnDismissCallback)
  {
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(paramListView.getContext());
    mSlop = localViewConfiguration.getScaledTouchSlop();
    mMinFlingVelocity = localViewConfiguration.getScaledMinimumFlingVelocity();
    mMaxFlingVelocity = localViewConfiguration.getScaledMaximumFlingVelocity();
    mAnimationTime = paramListView.getContext().getResources().getInteger(17694720);
    mListView = paramListView;
    mCallback = paramOnDismissCallback;
  }
  
  private void performDismiss(final View paramView, int paramInt)
  {
    final ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    final int i = paramView.getHeight();
    ValueAnimator localValueAnimator = ValueAnimator.ofInt(new int[] { i, 1 }).setDuration(mAnimationTime);
    localValueAnimator.addListener(new AnimatorListenerAdapter()
    {
      public void onAnimationEnd(Animator paramAnonymousAnimator)
      {
        SwipeDismissListViewTouchListener.access$106(SwipeDismissListViewTouchListener.this);
        if (mDismissAnimationRefCount == 0)
        {
          Collections.sort(mPendingDismisses);
          paramAnonymousAnimator = new int[mPendingDismisses.size()];
          int i = mPendingDismisses.size() - 1;
          while (i >= 0)
          {
            paramAnonymousAnimator[i] = mPendingDismisses.get(i)).position;
            i -= 1;
          }
          mCallback.onDismiss(mListView, paramAnonymousAnimator);
          paramAnonymousAnimator = mPendingDismisses.iterator();
          while (paramAnonymousAnimator.hasNext())
          {
            SwipeDismissListViewTouchListener.PendingDismissData localPendingDismissData = (SwipeDismissListViewTouchListener.PendingDismissData)paramAnonymousAnimator.next();
            ViewHelper.setAlpha(view, 1.0F);
            ViewHelper.setTranslationX(view, 0.0F);
            ViewGroup.LayoutParams localLayoutParams = view.getLayoutParams();
            height = i;
            view.setLayoutParams(localLayoutParams);
          }
          mPendingDismisses.clear();
        }
      }
    });
    localValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
    {
      public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
      {
        localLayoutParamsheight = ((Integer)paramAnonymousValueAnimator.getAnimatedValue()).intValue();
        paramView.setLayoutParams(localLayoutParams);
      }
    });
    mPendingDismisses.add(new PendingDismissData(paramInt, paramView));
    localValueAnimator.start();
  }
  
  public AbsListView.OnScrollListener makeScrollListener()
  {
    new AbsListView.OnScrollListener()
    {
      public void onScroll(AbsListView paramAnonymousAbsListView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onScrollStateChanged(AbsListView paramAnonymousAbsListView, int paramAnonymousInt)
      {
        boolean bool = true;
        paramAnonymousAbsListView = SwipeDismissListViewTouchListener.this;
        if (paramAnonymousInt != 1) {}
        for (;;)
        {
          paramAnonymousAbsListView.setEnabled(bool);
          return;
          bool = false;
        }
      }
    };
  }
  
  public boolean onTouch(final View paramView, MotionEvent paramMotionEvent)
  {
    if (mViewWidth < 2) {
      mViewWidth = mListView.getWidth();
    }
    switch (paramMotionEvent.getActionMasked())
    {
    }
    float f1;
    label323:
    label368:
    label514:
    label524:
    do
    {
      do
      {
        final int j;
        int i;
        do
        {
          return false;
          if (mPaused) {
            return false;
          }
          Rect localRect = new Rect();
          j = mListView.getChildCount();
          Object localObject = new int[2];
          mListView.getLocationOnScreen((int[])localObject);
          k = (int)paramMotionEvent.getRawX();
          m = localObject[0];
          int n = (int)paramMotionEvent.getRawY();
          int i1 = localObject[1];
          i = 0;
          for (;;)
          {
            if (i < j)
            {
              localObject = mListView.getChildAt(i);
              ((View)localObject).getHitRect(localRect);
              if (localRect.contains(k - m, n - i1)) {
                mDownView = ((View)localObject);
              }
            }
            else
            {
              if (mDownView != null)
              {
                mDownX = paramMotionEvent.getRawX();
                mDownPosition = mListView.getPositionForView(mDownView);
                mVelocityTracker = VelocityTracker.obtain();
                mVelocityTracker.addMovement(paramMotionEvent);
              }
              paramView.onTouchEvent(paramMotionEvent);
              return true;
            }
            i += 1;
          }
        } while (mVelocityTracker == null);
        f1 = paramMotionEvent.getRawX() - mDownX;
        mVelocityTracker.addMovement(paramMotionEvent);
        mVelocityTracker.computeCurrentVelocity(1000);
        float f2 = Math.abs(mVelocityTracker.getXVelocity());
        float f3 = Math.abs(mVelocityTracker.getYVelocity());
        int k = 0;
        int m = 0;
        if (Math.abs(f1) > mViewWidth / 2)
        {
          j = 1;
          if (f1 > 0.0F)
          {
            i = 1;
            if (j == 0) {
              break label524;
            }
            paramView = mDownView;
            j = mDownPosition;
            mDismissAnimationRefCount += 1;
            paramMotionEvent = ViewPropertyAnimator.animate(mDownView);
            if (i == 0) {
              break label514;
            }
            f1 = mViewWidth;
            paramMotionEvent.translationX(f1).alpha(0.0F).setDuration(mAnimationTime).setListener(new AnimatorListenerAdapter()
            {
              public void onAnimationEnd(Animator paramAnonymousAnimator)
              {
                SwipeDismissListViewTouchListener.this.performDismiss(paramView, j);
              }
            });
          }
        }
        for (;;)
        {
          mVelocityTracker = null;
          mDownX = 0.0F;
          mDownView = null;
          mDownPosition = -1;
          mSwiping = false;
          break;
          i = 0;
          break label323;
          j = k;
          i = m;
          if (mMinFlingVelocity > f2) {
            break label323;
          }
          j = k;
          i = m;
          if (f2 > mMaxFlingVelocity) {
            break label323;
          }
          j = k;
          i = m;
          if (f3 >= f2) {
            break label323;
          }
          j = 1;
          if (mVelocityTracker.getXVelocity() > 0.0F) {}
          for (i = 1;; i = 0) {
            break;
          }
          f1 = -mViewWidth;
          break label368;
          ViewPropertyAnimator.animate(mDownView).translationX(0.0F).alpha(1.0F).setDuration(mAnimationTime).setListener(null);
        }
      } while ((mVelocityTracker == null) || (mPaused));
      mVelocityTracker.addMovement(paramMotionEvent);
      f1 = paramMotionEvent.getRawX() - mDownX;
      if (Math.abs(f1) > mSlop)
      {
        mSwiping = true;
        mListView.requestDisallowInterceptTouchEvent(true);
        paramView = MotionEvent.obtain(paramMotionEvent);
        paramView.setAction(paramMotionEvent.getActionIndex() << 8 | 0x3);
        mListView.onTouchEvent(paramView);
      }
    } while (!mSwiping);
    ViewHelper.setTranslationX(mDownView, f1);
    ViewHelper.setAlpha(mDownView, Math.max(0.0F, Math.min(1.0F, 1.0F - 2.0F * Math.abs(f1) / mViewWidth)));
    return true;
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    if (!paramBoolean) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      mPaused = paramBoolean;
      return;
    }
  }
  
  public static abstract interface OnDismissCallback
  {
    public abstract void onDismiss(ListView paramListView, int[] paramArrayOfInt);
  }
  
  class PendingDismissData
    implements Comparable<PendingDismissData>
  {
    public int position;
    public View view;
    
    public PendingDismissData(int paramInt, View paramView)
    {
      position = paramInt;
      view = paramView;
    }
    
    public int compareTo(PendingDismissData paramPendingDismissData)
    {
      return position - position;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissListViewTouchListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */