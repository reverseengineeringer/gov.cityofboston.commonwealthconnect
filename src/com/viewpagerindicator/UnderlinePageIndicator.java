package com.viewpagerindicator;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.ViewConfiguration;

public class UnderlinePageIndicator
  extends View
  implements PageIndicator
{
  private static final int FADE_FRAME_MS = 30;
  private static final int INVALID_POINTER = -1;
  private int mActivePointerId = -1;
  private int mCurrentPage;
  private int mFadeBy;
  private int mFadeDelay;
  private int mFadeLength;
  private final Runnable mFadeRunnable = new Runnable()
  {
    public void run()
    {
      if (!mFades) {}
      int i;
      do
      {
        return;
        i = Math.max(mPaint.getAlpha() - mFadeBy, 0);
        mPaint.setAlpha(i);
        invalidate();
      } while (i <= 0);
      postDelayed(this, 30L);
    }
  };
  private boolean mFades;
  private boolean mIsDragging;
  private float mLastMotionX = -1.0F;
  private ViewPager.OnPageChangeListener mListener;
  private final Paint mPaint = new Paint(1);
  private float mPositionOffset;
  private int mScrollState;
  private int mTouchSlop;
  private ViewPager mViewPager;
  
  public UnderlinePageIndicator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public UnderlinePageIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.vpiUnderlinePageIndicatorStyle);
  }
  
  public UnderlinePageIndicator(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    if (isInEditMode()) {
      return;
    }
    Object localObject = getResources();
    boolean bool = ((Resources)localObject).getBoolean(R.bool.default_underline_indicator_fades);
    int i = ((Resources)localObject).getInteger(R.integer.default_underline_indicator_fade_delay);
    int j = ((Resources)localObject).getInteger(R.integer.default_underline_indicator_fade_length);
    int k = ((Resources)localObject).getColor(R.color.default_underline_indicator_selected_color);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.UnderlinePageIndicator, paramInt, 0);
    setFades(paramAttributeSet.getBoolean(R.styleable.UnderlinePageIndicator_fades, bool));
    setSelectedColor(paramAttributeSet.getColor(R.styleable.UnderlinePageIndicator_selectedColor, k));
    setFadeDelay(paramAttributeSet.getInteger(R.styleable.UnderlinePageIndicator_fadeDelay, i));
    setFadeLength(paramAttributeSet.getInteger(R.styleable.UnderlinePageIndicator_fadeLength, j));
    localObject = paramAttributeSet.getDrawable(R.styleable.UnderlinePageIndicator_android_background);
    if (localObject != null) {
      setBackgroundDrawable((Drawable)localObject);
    }
    paramAttributeSet.recycle();
    mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(ViewConfiguration.get(paramContext));
  }
  
  public int getFadeDelay()
  {
    return mFadeDelay;
  }
  
  public int getFadeLength()
  {
    return mFadeLength;
  }
  
  public boolean getFades()
  {
    return mFades;
  }
  
  public int getSelectedColor()
  {
    return mPaint.getColor();
  }
  
  public void notifyDataSetChanged()
  {
    invalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (mViewPager == null) {}
    int i;
    do
    {
      return;
      i = mViewPager.getAdapter().getCount();
    } while (i == 0);
    if (mCurrentPage >= i)
    {
      setCurrentItem(i - 1);
      return;
    }
    int j = getPaddingLeft();
    float f1 = (getWidth() - j - getPaddingRight()) / (1.0F * i);
    float f2 = j + (mCurrentPage + mPositionOffset) * f1;
    paramCanvas.drawRect(f2, getPaddingTop(), f2 + f1, getHeight() - getPaddingBottom(), mPaint);
  }
  
  public void onPageScrollStateChanged(int paramInt)
  {
    mScrollState = paramInt;
    if (mListener != null) {
      mListener.onPageScrollStateChanged(paramInt);
    }
  }
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
  {
    mCurrentPage = paramInt1;
    mPositionOffset = paramFloat;
    if (mFades)
    {
      if (paramInt2 <= 0) {
        break label64;
      }
      removeCallbacks(mFadeRunnable);
      mPaint.setAlpha(255);
    }
    for (;;)
    {
      invalidate();
      if (mListener != null) {
        mListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
      }
      return;
      label64:
      if (mScrollState != 1) {
        postDelayed(mFadeRunnable, mFadeDelay);
      }
    }
  }
  
  public void onPageSelected(int paramInt)
  {
    if (mScrollState == 0)
    {
      mCurrentPage = paramInt;
      mPositionOffset = 0.0F;
      invalidate();
      mFadeRunnable.run();
    }
    if (mListener != null) {
      mListener.onPageSelected(paramInt);
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    mCurrentPage = currentPage;
    requestLayout();
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    currentPage = mCurrentPage;
    return localSavedState;
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (super.onTouchEvent(paramMotionEvent)) {
      return true;
    }
    if ((mViewPager == null) || (mViewPager.getAdapter().getCount() == 0)) {
      return false;
    }
    int i = paramMotionEvent.getAction() & 0xFF;
    switch (i)
    {
    case 4: 
    default: 
    case 0: 
    case 2: 
    case 1: 
    case 3: 
    case 5: 
      for (;;)
      {
        return true;
        mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
        mLastMotionX = paramMotionEvent.getX();
        continue;
        float f1 = MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId));
        float f2 = f1 - mLastMotionX;
        if ((!mIsDragging) && (Math.abs(f2) > mTouchSlop)) {
          mIsDragging = true;
        }
        if (mIsDragging)
        {
          mLastMotionX = f1;
          if ((mViewPager.isFakeDragging()) || (mViewPager.beginFakeDrag()))
          {
            mViewPager.fakeDragBy(f2);
            continue;
            if (!mIsDragging)
            {
              int j = mViewPager.getAdapter().getCount();
              int k = getWidth();
              f1 = k / 2.0F;
              f2 = k / 6.0F;
              if ((mCurrentPage > 0) && (paramMotionEvent.getX() < f1 - f2))
              {
                if (i != 3) {
                  mViewPager.setCurrentItem(mCurrentPage - 1);
                }
                return true;
              }
              if ((mCurrentPage < j - 1) && (paramMotionEvent.getX() > f1 + f2))
              {
                if (i != 3) {
                  mViewPager.setCurrentItem(mCurrentPage + 1);
                }
                return true;
              }
            }
            mIsDragging = false;
            mActivePointerId = -1;
            if (mViewPager.isFakeDragging())
            {
              mViewPager.endFakeDrag();
              continue;
              i = MotionEventCompat.getActionIndex(paramMotionEvent);
              mLastMotionX = MotionEventCompat.getX(paramMotionEvent, i);
              mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
            }
          }
        }
      }
    }
    i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (MotionEventCompat.getPointerId(paramMotionEvent, i) == mActivePointerId) {
      if (i != 0) {
        break label434;
      }
    }
    label434:
    for (i = 1;; i = 0)
    {
      mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      mLastMotionX = MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId));
      break;
    }
  }
  
  public void setCurrentItem(int paramInt)
  {
    if (mViewPager == null) {
      throw new IllegalStateException("ViewPager has not been bound.");
    }
    mViewPager.setCurrentItem(paramInt);
    mCurrentPage = paramInt;
    invalidate();
  }
  
  public void setFadeDelay(int paramInt)
  {
    mFadeDelay = paramInt;
  }
  
  public void setFadeLength(int paramInt)
  {
    mFadeLength = paramInt;
    mFadeBy = (255 / (mFadeLength / 30));
  }
  
  public void setFades(boolean paramBoolean)
  {
    if (paramBoolean != mFades)
    {
      mFades = paramBoolean;
      if (paramBoolean) {
        post(mFadeRunnable);
      }
    }
    else
    {
      return;
    }
    removeCallbacks(mFadeRunnable);
    mPaint.setAlpha(255);
    invalidate();
  }
  
  public void setOnPageChangeListener(ViewPager.OnPageChangeListener paramOnPageChangeListener)
  {
    mListener = paramOnPageChangeListener;
  }
  
  public void setSelectedColor(int paramInt)
  {
    mPaint.setColor(paramInt);
    invalidate();
  }
  
  public void setViewPager(ViewPager paramViewPager)
  {
    if (mViewPager == paramViewPager) {
      return;
    }
    if (mViewPager != null) {
      mViewPager.setOnPageChangeListener(null);
    }
    if (paramViewPager.getAdapter() == null) {
      throw new IllegalStateException("ViewPager does not have adapter instance.");
    }
    mViewPager = paramViewPager;
    mViewPager.setOnPageChangeListener(this);
    invalidate();
    post(new Runnable()
    {
      public void run()
      {
        if (mFades) {
          post(mFadeRunnable);
        }
      }
    });
  }
  
  public void setViewPager(ViewPager paramViewPager, int paramInt)
  {
    setViewPager(paramViewPager);
    setCurrentItem(paramInt);
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public UnderlinePageIndicator.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new UnderlinePageIndicator.SavedState(paramAnonymousParcel, null);
      }
      
      public UnderlinePageIndicator.SavedState[] newArray(int paramAnonymousInt)
      {
        return new UnderlinePageIndicator.SavedState[paramAnonymousInt];
      }
    };
    int currentPage;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      currentPage = paramParcel.readInt();
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(currentPage);
    }
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.UnderlinePageIndicator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */