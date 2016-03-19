package com.viewpagerindicator;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Typeface;
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
import java.util.ArrayList;

public class TitlePageIndicator
  extends View
  implements PageIndicator
{
  private static final float BOLD_FADE_PERCENTAGE = 0.05F;
  private static final String EMPTY_TITLE = "";
  private static final int INVALID_POINTER = -1;
  private static final float SELECTION_FADE_PERCENTAGE = 0.25F;
  private int mActivePointerId = -1;
  private boolean mBoldText;
  private final Rect mBounds = new Rect();
  private OnCenterItemClickListener mCenterItemClickListener;
  private float mClipPadding;
  private int mColorSelected;
  private int mColorText;
  private int mCurrentPage = -1;
  private float mFooterIndicatorHeight;
  private IndicatorStyle mFooterIndicatorStyle;
  private float mFooterIndicatorUnderlinePadding;
  private float mFooterLineHeight;
  private float mFooterPadding;
  private boolean mIsDragging;
  private float mLastMotionX = -1.0F;
  private LinePosition mLinePosition;
  private ViewPager.OnPageChangeListener mListener;
  private float mPageOffset;
  private final Paint mPaintFooterIndicator = new Paint();
  private final Paint mPaintFooterLine = new Paint();
  private final Paint mPaintText = new Paint();
  private Path mPath = new Path();
  private int mScrollState;
  private float mTitlePadding;
  private float mTopPadding;
  private int mTouchSlop;
  private ViewPager mViewPager;
  
  public TitlePageIndicator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public TitlePageIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.vpiTitlePageIndicatorStyle);
  }
  
  public TitlePageIndicator(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    if (isInEditMode()) {
      return;
    }
    Object localObject = getResources();
    int i = ((Resources)localObject).getColor(R.color.default_title_indicator_footer_color);
    float f1 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_footer_line_height);
    int j = ((Resources)localObject).getInteger(R.integer.default_title_indicator_footer_indicator_style);
    float f2 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_footer_indicator_height);
    float f3 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_footer_indicator_underline_padding);
    float f4 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_footer_padding);
    int k = ((Resources)localObject).getInteger(R.integer.default_title_indicator_line_position);
    int m = ((Resources)localObject).getColor(R.color.default_title_indicator_selected_color);
    boolean bool = ((Resources)localObject).getBoolean(R.bool.default_title_indicator_selected_bold);
    int n = ((Resources)localObject).getColor(R.color.default_title_indicator_text_color);
    float f5 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_text_size);
    float f6 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_title_padding);
    float f7 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_clip_padding);
    float f8 = ((Resources)localObject).getDimension(R.dimen.default_title_indicator_top_padding);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.TitlePageIndicator, paramInt, 0);
    mFooterLineHeight = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_footerLineHeight, f1);
    mFooterIndicatorStyle = IndicatorStyle.fromValue(paramAttributeSet.getInteger(R.styleable.TitlePageIndicator_footerIndicatorStyle, j));
    mFooterIndicatorHeight = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_footerIndicatorHeight, f2);
    mFooterIndicatorUnderlinePadding = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_footerIndicatorUnderlinePadding, f3);
    mFooterPadding = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_footerPadding, f4);
    mLinePosition = LinePosition.fromValue(paramAttributeSet.getInteger(R.styleable.TitlePageIndicator_linePosition, k));
    mTopPadding = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_topPadding, f8);
    mTitlePadding = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_titlePadding, f6);
    mClipPadding = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_clipPadding, f7);
    mColorSelected = paramAttributeSet.getColor(R.styleable.TitlePageIndicator_selectedColor, m);
    mColorText = paramAttributeSet.getColor(R.styleable.TitlePageIndicator_android_textColor, n);
    mBoldText = paramAttributeSet.getBoolean(R.styleable.TitlePageIndicator_selectedBold, bool);
    f1 = paramAttributeSet.getDimension(R.styleable.TitlePageIndicator_android_textSize, f5);
    paramInt = paramAttributeSet.getColor(R.styleable.TitlePageIndicator_footerColor, i);
    mPaintText.setTextSize(f1);
    mPaintText.setAntiAlias(true);
    mPaintFooterLine.setStyle(Paint.Style.FILL_AND_STROKE);
    mPaintFooterLine.setStrokeWidth(mFooterLineHeight);
    mPaintFooterLine.setColor(paramInt);
    mPaintFooterIndicator.setStyle(Paint.Style.FILL_AND_STROKE);
    mPaintFooterIndicator.setColor(paramInt);
    localObject = paramAttributeSet.getDrawable(R.styleable.TitlePageIndicator_android_background);
    if (localObject != null) {
      setBackgroundDrawable((Drawable)localObject);
    }
    paramAttributeSet.recycle();
    mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(ViewConfiguration.get(paramContext));
  }
  
  private Rect calcBounds(int paramInt, Paint paramPaint)
  {
    Rect localRect = new Rect();
    CharSequence localCharSequence = getTitle(paramInt);
    right = ((int)paramPaint.measureText(localCharSequence, 0, localCharSequence.length()));
    bottom = ((int)(paramPaint.descent() - paramPaint.ascent()));
    return localRect;
  }
  
  private ArrayList<Rect> calculateAllBounds(Paint paramPaint)
  {
    ArrayList localArrayList = new ArrayList();
    int j = mViewPager.getAdapter().getCount();
    int k = getWidth();
    int m = k / 2;
    int i = 0;
    while (i < j)
    {
      Rect localRect = calcBounds(i, paramPaint);
      int n = right - left;
      int i1 = bottom;
      int i2 = top;
      left = ((int)(m - n / 2.0F + (i - mCurrentPage - mPageOffset) * k));
      right = (left + n);
      top = 0;
      bottom = (i1 - i2);
      localArrayList.add(localRect);
      i += 1;
    }
    return localArrayList;
  }
  
  private void clipViewOnTheLeft(Rect paramRect, float paramFloat, int paramInt)
  {
    left = ((int)(paramInt + mClipPadding));
    right = ((int)(mClipPadding + paramFloat));
  }
  
  private void clipViewOnTheRight(Rect paramRect, float paramFloat, int paramInt)
  {
    right = ((int)(paramInt - mClipPadding));
    left = ((int)(right - paramFloat));
  }
  
  private CharSequence getTitle(int paramInt)
  {
    CharSequence localCharSequence = mViewPager.getAdapter().getPageTitle(paramInt);
    Object localObject = localCharSequence;
    if (localCharSequence == null) {
      localObject = "";
    }
    return (CharSequence)localObject;
  }
  
  public float getClipPadding()
  {
    return mClipPadding;
  }
  
  public int getFooterColor()
  {
    return mPaintFooterLine.getColor();
  }
  
  public float getFooterIndicatorHeight()
  {
    return mFooterIndicatorHeight;
  }
  
  public float getFooterIndicatorPadding()
  {
    return mFooterPadding;
  }
  
  public IndicatorStyle getFooterIndicatorStyle()
  {
    return mFooterIndicatorStyle;
  }
  
  public float getFooterLineHeight()
  {
    return mFooterLineHeight;
  }
  
  public LinePosition getLinePosition()
  {
    return mLinePosition;
  }
  
  public int getSelectedColor()
  {
    return mColorSelected;
  }
  
  public int getTextColor()
  {
    return mColorText;
  }
  
  public float getTextSize()
  {
    return mPaintText.getTextSize();
  }
  
  public float getTitlePadding()
  {
    return mTitlePadding;
  }
  
  public float getTopPadding()
  {
    return mTopPadding;
  }
  
  public Typeface getTypeface()
  {
    return mPaintText.getTypeface();
  }
  
  public boolean isSelectedBold()
  {
    return mBoldText;
  }
  
  public void notifyDataSetChanged()
  {
    invalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (mViewPager == null) {}
    int i2;
    float f2;
    int i;
    int j;
    label177:
    float f6;
    label424:
    label430:
    label436:
    label665:
    label969:
    label975:
    do
    {
      int i4;
      do
      {
        return;
        i4 = mViewPager.getAdapter().getCount();
      } while (i4 == 0);
      if ((mCurrentPage == -1) && (mViewPager != null)) {
        mCurrentPage = mViewPager.getCurrentItem();
      }
      localObject1 = calculateAllBounds(mPaintText);
      i2 = ((ArrayList)localObject1).size();
      if (mCurrentPage >= i2)
      {
        setCurrentItem(i2 - 1);
        return;
      }
      float f5 = getWidth() / 2.0F;
      int i5 = getLeft();
      f2 = i5 + mClipPadding;
      int i3 = getWidth();
      int i1 = getHeight();
      int i6 = i5 + i3;
      f3 = i6 - mClipPadding;
      i = mCurrentPage;
      if (mPageOffset <= 0.5D)
      {
        f1 = mPageOffset;
        if (f1 > 0.25F) {
          break label424;
        }
        j = 1;
        if (f1 > 0.05F) {
          break label430;
        }
      }
      Rect localRect;
      int n;
      Object localObject2;
      for (int k = 1;; k = 0)
      {
        f6 = (0.25F - f1) / 0.25F;
        localRect = (Rect)((ArrayList)localObject1).get(mCurrentPage);
        f1 = right - left;
        if (left < f2) {
          clipViewOnTheLeft(localRect, f1, i5);
        }
        if (right > f3) {
          clipViewOnTheRight(localRect, f1, i6);
        }
        if (mCurrentPage <= 0) {
          break label436;
        }
        m = mCurrentPage - 1;
        while (m >= 0)
        {
          localRect = (Rect)((ArrayList)localObject1).get(m);
          if (left < f2)
          {
            n = right - left;
            clipViewOnTheLeft(localRect, n, i5);
            localObject2 = (Rect)((ArrayList)localObject1).get(m + 1);
            if (right + mTitlePadding > left)
            {
              left = ((int)(left - n - mTitlePadding));
              right = (left + n);
            }
          }
          m -= 1;
        }
        i += 1;
        f1 = 1.0F - mPageOffset;
        break;
        j = 0;
        break label177;
      }
      if (mCurrentPage < i4 - 1)
      {
        m = mCurrentPage + 1;
        while (m < i4)
        {
          localRect = (Rect)((ArrayList)localObject1).get(m);
          if (right > f3)
          {
            n = right - left;
            clipViewOnTheRight(localRect, n, i6);
            localObject2 = (Rect)((ArrayList)localObject1).get(m - 1);
            if (left - mTitlePadding < right)
            {
              left = ((int)(right + mTitlePadding));
              right = (left + n);
            }
          }
          m += 1;
        }
      }
      int i7 = mColorText >>> 24;
      int m = 0;
      if (m < i4)
      {
        localRect = (Rect)((ArrayList)localObject1).get(m);
        Object localObject3;
        if (((left > i5) && (left < i6)) || ((right > i5) && (right < i6)))
        {
          if (m != i) {
            break label969;
          }
          n = 1;
          localObject2 = getTitle(m);
          localObject3 = mPaintText;
          if ((n == 0) || (k == 0) || (!mBoldText)) {
            break label975;
          }
        }
        for (boolean bool = true;; bool = false)
        {
          ((Paint)localObject3).setFakeBoldText(bool);
          mPaintText.setColor(mColorText);
          if ((n != 0) && (j != 0)) {
            mPaintText.setAlpha(i7 - (int)(i7 * f6));
          }
          if (m < i2 - 1)
          {
            localObject3 = (Rect)((ArrayList)localObject1).get(m + 1);
            if (right + mTitlePadding > left)
            {
              i8 = right - left;
              left = ((int)(left - i8 - mTitlePadding));
              right = (left + i8);
            }
          }
          int i8 = ((CharSequence)localObject2).length();
          f1 = left;
          f2 = bottom;
          paramCanvas.drawText((CharSequence)localObject2, 0, i8, f1, mTopPadding + f2, mPaintText);
          if ((n != 0) && (j != 0))
          {
            mPaintText.setColor(mColorSelected);
            mPaintText.setAlpha((int)((mColorSelected >>> 24) * f6));
            n = ((CharSequence)localObject2).length();
            f1 = left;
            f2 = bottom;
            paramCanvas.drawText((CharSequence)localObject2, 0, n, f1, mTopPadding + f2, mPaintText);
          }
          m += 1;
          break;
          n = 0;
          break label665;
        }
      }
      f4 = mFooterLineHeight;
      f3 = mFooterIndicatorHeight;
      f1 = f3;
      f2 = f4;
      k = i1;
      if (mLinePosition == LinePosition.Top)
      {
        k = 0;
        f2 = -f4;
        f1 = -f3;
      }
      mPath.reset();
      mPath.moveTo(0.0F, k - f2 / 2.0F);
      mPath.lineTo(i3, k - f2 / 2.0F);
      mPath.close();
      paramCanvas.drawPath(mPath, mPaintFooterLine);
      f2 = k - f2;
      switch (mFooterIndicatorStyle)
      {
      default: 
        return;
      case ???: 
        mPath.reset();
        mPath.moveTo(f5, f2 - f1);
        mPath.lineTo(f5 + f1, f2);
        mPath.lineTo(f5 - f1, f2);
        mPath.close();
        paramCanvas.drawPath(mPath, mPaintFooterIndicator);
        return;
      }
    } while ((j == 0) || (i >= i2));
    Object localObject1 = (Rect)((ArrayList)localObject1).get(i);
    float f3 = right + mFooterIndicatorUnderlinePadding;
    float f4 = left - mFooterIndicatorUnderlinePadding;
    float f1 = f2 - f1;
    mPath.reset();
    mPath.moveTo(f4, f2);
    mPath.lineTo(f3, f2);
    mPath.lineTo(f3, f1);
    mPath.lineTo(f4, f1);
    mPath.close();
    mPaintFooterIndicator.setAlpha((int)(255.0F * f6));
    paramCanvas.drawPath(mPath, mPaintFooterIndicator);
    mPaintFooterIndicator.setAlpha(255);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    float f1;
    if (View.MeasureSpec.getMode(paramInt2) == 1073741824) {
      f1 = View.MeasureSpec.getSize(paramInt2);
    }
    for (;;)
    {
      setMeasuredDimension(paramInt1, (int)f1);
      return;
      mBounds.setEmpty();
      mBounds.bottom = ((int)(mPaintText.descent() - mPaintText.ascent()));
      float f2 = mBounds.bottom - mBounds.top + mFooterLineHeight + mFooterPadding + mTopPadding;
      f1 = f2;
      if (mFooterIndicatorStyle != IndicatorStyle.None) {
        f1 = f2 + mFooterIndicatorHeight;
      }
    }
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
    if (mScrollState == 0)
    {
      mCurrentPage = paramInt;
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
              float f3 = paramMotionEvent.getX();
              if (f3 < f1 - f2)
              {
                if (mCurrentPage > 0)
                {
                  if (i != 3) {
                    mViewPager.setCurrentItem(mCurrentPage - 1);
                  }
                  return true;
                }
              }
              else if (f3 > f1 + f2)
              {
                if (mCurrentPage < j - 1)
                {
                  if (i != 3) {
                    mViewPager.setCurrentItem(mCurrentPage + 1);
                  }
                  return true;
                }
              }
              else if ((mCenterItemClickListener != null) && (i != 3)) {
                mCenterItemClickListener.onCenterItemClick(mCurrentPage);
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
        break label462;
      }
    }
    label462:
    for (i = 1;; i = 0)
    {
      mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      mLastMotionX = MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId));
      break;
    }
  }
  
  public void setClipPadding(float paramFloat)
  {
    mClipPadding = paramFloat;
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
  
  public void setFooterColor(int paramInt)
  {
    mPaintFooterLine.setColor(paramInt);
    mPaintFooterIndicator.setColor(paramInt);
    invalidate();
  }
  
  public void setFooterIndicatorHeight(float paramFloat)
  {
    mFooterIndicatorHeight = paramFloat;
    invalidate();
  }
  
  public void setFooterIndicatorPadding(float paramFloat)
  {
    mFooterPadding = paramFloat;
    invalidate();
  }
  
  public void setFooterIndicatorStyle(IndicatorStyle paramIndicatorStyle)
  {
    mFooterIndicatorStyle = paramIndicatorStyle;
    invalidate();
  }
  
  public void setFooterLineHeight(float paramFloat)
  {
    mFooterLineHeight = paramFloat;
    mPaintFooterLine.setStrokeWidth(mFooterLineHeight);
    invalidate();
  }
  
  public void setLinePosition(LinePosition paramLinePosition)
  {
    mLinePosition = paramLinePosition;
    invalidate();
  }
  
  public void setOnCenterItemClickListener(OnCenterItemClickListener paramOnCenterItemClickListener)
  {
    mCenterItemClickListener = paramOnCenterItemClickListener;
  }
  
  public void setOnPageChangeListener(ViewPager.OnPageChangeListener paramOnPageChangeListener)
  {
    mListener = paramOnPageChangeListener;
  }
  
  public void setSelectedBold(boolean paramBoolean)
  {
    mBoldText = paramBoolean;
    invalidate();
  }
  
  public void setSelectedColor(int paramInt)
  {
    mColorSelected = paramInt;
    invalidate();
  }
  
  public void setTextColor(int paramInt)
  {
    mPaintText.setColor(paramInt);
    mColorText = paramInt;
    invalidate();
  }
  
  public void setTextSize(float paramFloat)
  {
    mPaintText.setTextSize(paramFloat);
    invalidate();
  }
  
  public void setTitlePadding(float paramFloat)
  {
    mTitlePadding = paramFloat;
    invalidate();
  }
  
  public void setTopPadding(float paramFloat)
  {
    mTopPadding = paramFloat;
    invalidate();
  }
  
  public void setTypeface(Typeface paramTypeface)
  {
    mPaintText.setTypeface(paramTypeface);
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
  
  public static enum IndicatorStyle
  {
    None(0),  Triangle(1),  Underline(2);
    
    public final int value;
    
    private IndicatorStyle(int paramInt)
    {
      value = paramInt;
    }
    
    public static IndicatorStyle fromValue(int paramInt)
    {
      IndicatorStyle[] arrayOfIndicatorStyle = values();
      int j = arrayOfIndicatorStyle.length;
      int i = 0;
      while (i < j)
      {
        IndicatorStyle localIndicatorStyle = arrayOfIndicatorStyle[i];
        if (value == paramInt) {
          return localIndicatorStyle;
        }
        i += 1;
      }
      return null;
    }
  }
  
  public static enum LinePosition
  {
    Bottom(0),  Top(1);
    
    public final int value;
    
    private LinePosition(int paramInt)
    {
      value = paramInt;
    }
    
    public static LinePosition fromValue(int paramInt)
    {
      LinePosition[] arrayOfLinePosition = values();
      int j = arrayOfLinePosition.length;
      int i = 0;
      while (i < j)
      {
        LinePosition localLinePosition = arrayOfLinePosition[i];
        if (value == paramInt) {
          return localLinePosition;
        }
        i += 1;
      }
      return null;
    }
  }
  
  public static abstract interface OnCenterItemClickListener
  {
    public abstract void onCenterItemClick(int paramInt);
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public TitlePageIndicator.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new TitlePageIndicator.SavedState(paramAnonymousParcel, null);
      }
      
      public TitlePageIndicator.SavedState[] newArray(int paramAnonymousInt)
      {
        return new TitlePageIndicator.SavedState[paramAnonymousInt];
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
 * Qualified Name:     com.viewpagerindicator.TitlePageIndicator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */