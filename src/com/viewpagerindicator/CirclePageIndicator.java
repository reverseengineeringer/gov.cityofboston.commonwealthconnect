package com.viewpagerindicator;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
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
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;

public class CirclePageIndicator
  extends View
  implements PageIndicator
{
  private static final int INVALID_POINTER = -1;
  private int mActivePointerId = -1;
  private boolean mCentered;
  private int mCurrentPage;
  private boolean mIsDragging;
  private float mLastMotionX = -1.0F;
  private ViewPager.OnPageChangeListener mListener;
  private int mOrientation;
  private float mPageOffset;
  private final Paint mPaintFill = new Paint(1);
  private final Paint mPaintPageFill = new Paint(1);
  private final Paint mPaintStroke = new Paint(1);
  private float mRadius;
  private int mScrollState;
  private boolean mSnap;
  private int mSnapPage;
  private int mTouchSlop;
  private ViewPager mViewPager;
  
  public CirclePageIndicator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public CirclePageIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.vpiCirclePageIndicatorStyle);
  }
  
  public CirclePageIndicator(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    if (isInEditMode()) {
      return;
    }
    Object localObject = getResources();
    int i = ((Resources)localObject).getColor(R.color.default_circle_indicator_page_color);
    int j = ((Resources)localObject).getColor(R.color.default_circle_indicator_fill_color);
    int k = ((Resources)localObject).getInteger(R.integer.default_circle_indicator_orientation);
    int m = ((Resources)localObject).getColor(R.color.default_circle_indicator_stroke_color);
    float f1 = ((Resources)localObject).getDimension(R.dimen.default_circle_indicator_stroke_width);
    float f2 = ((Resources)localObject).getDimension(R.dimen.default_circle_indicator_radius);
    boolean bool1 = ((Resources)localObject).getBoolean(R.bool.default_circle_indicator_centered);
    boolean bool2 = ((Resources)localObject).getBoolean(R.bool.default_circle_indicator_snap);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.CirclePageIndicator, paramInt, 0);
    mCentered = paramAttributeSet.getBoolean(R.styleable.CirclePageIndicator_centered, bool1);
    mOrientation = paramAttributeSet.getInt(R.styleable.CirclePageIndicator_android_orientation, k);
    mPaintPageFill.setStyle(Paint.Style.FILL);
    mPaintPageFill.setColor(paramAttributeSet.getColor(R.styleable.CirclePageIndicator_pageColor, i));
    mPaintStroke.setStyle(Paint.Style.STROKE);
    mPaintStroke.setColor(paramAttributeSet.getColor(R.styleable.CirclePageIndicator_strokeColor, m));
    mPaintStroke.setStrokeWidth(paramAttributeSet.getDimension(R.styleable.CirclePageIndicator_strokeWidth, f1));
    mPaintFill.setStyle(Paint.Style.FILL);
    mPaintFill.setColor(paramAttributeSet.getColor(R.styleable.CirclePageIndicator_fillColor, j));
    mRadius = paramAttributeSet.getDimension(R.styleable.CirclePageIndicator_radius, f2);
    mSnap = paramAttributeSet.getBoolean(R.styleable.CirclePageIndicator_snap, bool2);
    localObject = paramAttributeSet.getDrawable(R.styleable.CirclePageIndicator_android_background);
    if (localObject != null) {
      setBackgroundDrawable((Drawable)localObject);
    }
    paramAttributeSet.recycle();
    mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(ViewConfiguration.get(paramContext));
  }
  
  private int measureLong(int paramInt)
  {
    int k = View.MeasureSpec.getMode(paramInt);
    int i = View.MeasureSpec.getSize(paramInt);
    if ((k == 1073741824) || (mViewPager == null)) {
      paramInt = i;
    }
    int j;
    do
    {
      return paramInt;
      paramInt = mViewPager.getAdapter().getCount();
      j = (int)(getPaddingLeft() + getPaddingRight() + paramInt * 2 * mRadius + (paramInt - 1) * mRadius + 1.0F);
      paramInt = j;
    } while (k != Integer.MIN_VALUE);
    return Math.min(j, i);
  }
  
  private int measureShort(int paramInt)
  {
    int k = View.MeasureSpec.getMode(paramInt);
    int i = View.MeasureSpec.getSize(paramInt);
    if (k == 1073741824) {
      paramInt = i;
    }
    int j;
    do
    {
      return paramInt;
      j = (int)(2.0F * mRadius + getPaddingTop() + getPaddingBottom() + 1.0F);
      paramInt = j;
    } while (k != Integer.MIN_VALUE);
    return Math.min(j, i);
  }
  
  public int getFillColor()
  {
    return mPaintFill.getColor();
  }
  
  public int getOrientation()
  {
    return mOrientation;
  }
  
  public int getPageColor()
  {
    return mPaintPageFill.getColor();
  }
  
  public float getRadius()
  {
    return mRadius;
  }
  
  public int getStrokeColor()
  {
    return mPaintStroke.getColor();
  }
  
  public float getStrokeWidth()
  {
    return mPaintStroke.getStrokeWidth();
  }
  
  public boolean isCentered()
  {
    return mCentered;
  }
  
  public boolean isSnap()
  {
    return mSnap;
  }
  
  public void notifyDataSetChanged()
  {
    invalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (mViewPager == null) {}
    int n;
    do
    {
      return;
      n = mViewPager.getAdapter().getCount();
    } while (n == 0);
    if (mCurrentPage >= n)
    {
      setCurrentItem(n - 1);
      return;
    }
    int k;
    int j;
    int i;
    int m;
    float f6;
    float f1;
    float f3;
    float f2;
    float f4;
    label181:
    float f5;
    if (mOrientation == 0)
    {
      k = getWidth();
      j = getPaddingLeft();
      i = getPaddingRight();
      m = getPaddingTop();
      f6 = mRadius * 3.0F;
      f1 = m + mRadius;
      f3 = j + mRadius;
      f2 = f3;
      if (mCentered) {
        f2 = f3 + ((k - j - i) / 2.0F - n * f6 / 2.0F);
      }
      f4 = mRadius;
      f3 = f4;
      if (mPaintStroke.getStrokeWidth() > 0.0F) {
        f3 = f4 - mPaintStroke.getStrokeWidth() / 2.0F;
      }
      i = 0;
      if (i >= n) {
        break label304;
      }
      f5 = f2 + i * f6;
      if (mOrientation != 0) {
        break label298;
      }
      f4 = f5;
      f5 = f1;
    }
    for (;;)
    {
      if (mPaintPageFill.getAlpha() > 0) {
        paramCanvas.drawCircle(f4, f5, f3, mPaintPageFill);
      }
      if (f3 != mRadius) {
        paramCanvas.drawCircle(f4, f5, mRadius, mPaintStroke);
      }
      i += 1;
      break label181;
      k = getHeight();
      j = getPaddingTop();
      i = getPaddingBottom();
      m = getPaddingLeft();
      break;
      label298:
      f4 = f1;
    }
    label304:
    if (mSnap)
    {
      i = mSnapPage;
      f4 = i * f6;
      f3 = f4;
      if (!mSnap) {
        f3 = f4 + mPageOffset * f6;
      }
      if (mOrientation != 0) {
        break label390;
      }
      f3 = f2 + f3;
      f2 = f1;
      f1 = f3;
    }
    for (;;)
    {
      paramCanvas.drawCircle(f1, f2, mRadius, mPaintFill);
      return;
      i = mCurrentPage;
      break;
      label390:
      f2 += f3;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (mOrientation == 0)
    {
      setMeasuredDimension(measureLong(paramInt1), measureShort(paramInt2));
      return;
    }
    setMeasuredDimension(measureShort(paramInt1), measureLong(paramInt2));
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
    mPageOffset = paramFloat;
    invalidate();
    if (mListener != null) {
      mListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
    }
  }
  
  public void onPageSelected(int paramInt)
  {
    if ((mSnap) || (mScrollState == 0))
    {
      mCurrentPage = paramInt;
      mSnapPage = paramInt;
      invalidate();
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
    mSnapPage = currentPage;
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
  
  public void setCentered(boolean paramBoolean)
  {
    mCentered = paramBoolean;
    invalidate();
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
  
  public void setFillColor(int paramInt)
  {
    mPaintFill.setColor(paramInt);
    invalidate();
  }
  
  public void setOnPageChangeListener(ViewPager.OnPageChangeListener paramOnPageChangeListener)
  {
    mListener = paramOnPageChangeListener;
  }
  
  public void setOrientation(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("Orientation must be either HORIZONTAL or VERTICAL.");
    }
    mOrientation = paramInt;
    requestLayout();
  }
  
  public void setPageColor(int paramInt)
  {
    mPaintPageFill.setColor(paramInt);
    invalidate();
  }
  
  public void setRadius(float paramFloat)
  {
    mRadius = paramFloat;
    invalidate();
  }
  
  public void setSnap(boolean paramBoolean)
  {
    mSnap = paramBoolean;
    invalidate();
  }
  
  public void setStrokeColor(int paramInt)
  {
    mPaintStroke.setColor(paramInt);
    invalidate();
  }
  
  public void setStrokeWidth(float paramFloat)
  {
    mPaintStroke.setStrokeWidth(paramFloat);
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
      public CirclePageIndicator.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new CirclePageIndicator.SavedState(paramAnonymousParcel, null);
      }
      
      public CirclePageIndicator.SavedState[] newArray(int paramAnonymousInt)
      {
        return new CirclePageIndicator.SavedState[paramAnonymousInt];
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
 * Qualified Name:     com.viewpagerindicator.CirclePageIndicator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */