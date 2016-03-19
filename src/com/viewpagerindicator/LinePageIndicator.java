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
import android.util.FloatMath;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;

public class LinePageIndicator
  extends View
  implements PageIndicator
{
  private static final int INVALID_POINTER = -1;
  private int mActivePointerId = -1;
  private boolean mCentered;
  private int mCurrentPage;
  private float mGapWidth;
  private boolean mIsDragging;
  private float mLastMotionX = -1.0F;
  private float mLineWidth;
  private ViewPager.OnPageChangeListener mListener;
  private final Paint mPaintSelected = new Paint(1);
  private final Paint mPaintUnselected = new Paint(1);
  private int mTouchSlop;
  private ViewPager mViewPager;
  
  public LinePageIndicator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public LinePageIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.vpiLinePageIndicatorStyle);
  }
  
  public LinePageIndicator(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    if (isInEditMode()) {
      return;
    }
    Object localObject = getResources();
    int i = ((Resources)localObject).getColor(R.color.default_line_indicator_selected_color);
    int j = ((Resources)localObject).getColor(R.color.default_line_indicator_unselected_color);
    float f1 = ((Resources)localObject).getDimension(R.dimen.default_line_indicator_line_width);
    float f2 = ((Resources)localObject).getDimension(R.dimen.default_line_indicator_gap_width);
    float f3 = ((Resources)localObject).getDimension(R.dimen.default_line_indicator_stroke_width);
    boolean bool = ((Resources)localObject).getBoolean(R.bool.default_line_indicator_centered);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.LinePageIndicator, paramInt, 0);
    mCentered = paramAttributeSet.getBoolean(R.styleable.LinePageIndicator_centered, bool);
    mLineWidth = paramAttributeSet.getDimension(R.styleable.LinePageIndicator_lineWidth, f1);
    mGapWidth = paramAttributeSet.getDimension(R.styleable.LinePageIndicator_gapWidth, f2);
    setStrokeWidth(paramAttributeSet.getDimension(R.styleable.LinePageIndicator_strokeWidth, f3));
    mPaintUnselected.setColor(paramAttributeSet.getColor(R.styleable.LinePageIndicator_unselectedColor, j));
    mPaintSelected.setColor(paramAttributeSet.getColor(R.styleable.LinePageIndicator_selectedColor, i));
    localObject = paramAttributeSet.getDrawable(R.styleable.LinePageIndicator_android_background);
    if (localObject != null) {
      setBackgroundDrawable((Drawable)localObject);
    }
    paramAttributeSet.recycle();
    mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(ViewConfiguration.get(paramContext));
  }
  
  private int measureHeight(int paramInt)
  {
    int i = View.MeasureSpec.getMode(paramInt);
    paramInt = View.MeasureSpec.getSize(paramInt);
    float f1;
    if (i == 1073741824) {
      f1 = paramInt;
    }
    for (;;)
    {
      return (int)FloatMath.ceil(f1);
      float f2 = mPaintSelected.getStrokeWidth() + getPaddingTop() + getPaddingBottom();
      f1 = f2;
      if (i == Integer.MIN_VALUE) {
        f1 = Math.min(f2, paramInt);
      }
    }
  }
  
  private int measureWidth(int paramInt)
  {
    int i = View.MeasureSpec.getMode(paramInt);
    paramInt = View.MeasureSpec.getSize(paramInt);
    float f1;
    if ((i == 1073741824) || (mViewPager == null)) {
      f1 = paramInt;
    }
    for (;;)
    {
      return (int)FloatMath.ceil(f1);
      int j = mViewPager.getAdapter().getCount();
      float f2 = getPaddingLeft() + getPaddingRight() + j * mLineWidth + (j - 1) * mGapWidth;
      f1 = f2;
      if (i == Integer.MIN_VALUE) {
        f1 = Math.min(f2, paramInt);
      }
    }
  }
  
  public float getGapWidth()
  {
    return mGapWidth;
  }
  
  public float getLineWidth()
  {
    return mLineWidth;
  }
  
  public int getSelectedColor()
  {
    return mPaintSelected.getColor();
  }
  
  public float getStrokeWidth()
  {
    return mPaintSelected.getStrokeWidth();
  }
  
  public int getUnselectedColor()
  {
    return mPaintUnselected.getColor();
  }
  
  public boolean isCentered()
  {
    return mCentered;
  }
  
  public void notifyDataSetChanged()
  {
    invalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (mViewPager == null) {}
    int j;
    do
    {
      return;
      j = mViewPager.getAdapter().getCount();
    } while (j == 0);
    if (mCurrentPage >= j)
    {
      setCurrentItem(j - 1);
      return;
    }
    float f4 = mLineWidth + mGapWidth;
    float f6 = j;
    float f7 = mGapWidth;
    float f1 = getPaddingTop();
    float f3 = getPaddingLeft();
    float f8 = getPaddingRight();
    float f5 = f1 + (getHeight() - f1 - getPaddingBottom()) / 2.0F;
    float f2 = f3;
    f1 = f2;
    if (mCentered) {
      f1 = f2 + ((getWidth() - f3 - f8) / 2.0F - (f6 * f4 - f7) / 2.0F);
    }
    int i = 0;
    label151:
    if (i < j)
    {
      f2 = f1 + i * f4;
      f3 = mLineWidth;
      if (i != mCurrentPage) {
        break label212;
      }
    }
    label212:
    for (Paint localPaint = mPaintSelected;; localPaint = mPaintUnselected)
    {
      paramCanvas.drawLine(f2, f5, f2 + f3, f5, localPaint);
      i += 1;
      break label151;
      break;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    setMeasuredDimension(measureWidth(paramInt1), measureHeight(paramInt2));
  }
  
  public void onPageScrollStateChanged(int paramInt)
  {
    if (mListener != null) {
      mListener.onPageScrollStateChanged(paramInt);
    }
  }
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
  {
    if (mListener != null) {
      mListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
    }
  }
  
  public void onPageSelected(int paramInt)
  {
    mCurrentPage = paramInt;
    invalidate();
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
  
  public void setGapWidth(float paramFloat)
  {
    mGapWidth = paramFloat;
    invalidate();
  }
  
  public void setLineWidth(float paramFloat)
  {
    mLineWidth = paramFloat;
    invalidate();
  }
  
  public void setOnPageChangeListener(ViewPager.OnPageChangeListener paramOnPageChangeListener)
  {
    mListener = paramOnPageChangeListener;
  }
  
  public void setSelectedColor(int paramInt)
  {
    mPaintSelected.setColor(paramInt);
    invalidate();
  }
  
  public void setStrokeWidth(float paramFloat)
  {
    mPaintSelected.setStrokeWidth(paramFloat);
    mPaintUnselected.setStrokeWidth(paramFloat);
    invalidate();
  }
  
  public void setUnselectedColor(int paramInt)
  {
    mPaintUnselected.setColor(paramInt);
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
      public LinePageIndicator.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new LinePageIndicator.SavedState(paramAnonymousParcel, null);
      }
      
      public LinePageIndicator.SavedState[] newArray(int paramAnonymousInt)
      {
        return new LinePageIndicator.SavedState[paramAnonymousInt];
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
 * Qualified Name:     com.viewpagerindicator.LinePageIndicator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */