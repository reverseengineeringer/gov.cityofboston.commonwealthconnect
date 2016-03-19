package net.simonvt.numberpicker;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnLongClickListener;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;

public class NumberPicker
  extends LinearLayout
{
  private static final int DEFAULT_LAYOUT_RESOURCE_ID = 0;
  private static final long DEFAULT_LONG_PRESS_UPDATE_INTERVAL = 300L;
  private static final char[] DIGIT_CHARACTERS = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 1632, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785 };
  private static final int SELECTOR_ADJUSTMENT_DURATION_MILLIS = 800;
  private static final int SELECTOR_MAX_FLING_VELOCITY_ADJUSTMENT = 8;
  private static final int SELECTOR_MIDDLE_ITEM_INDEX = 1;
  private static final int SELECTOR_WHEEL_ITEM_COUNT = 3;
  private static final int SIZE_UNSPECIFIED = -1;
  private static final int SNAP_SCROLL_DURATION = 300;
  private static final float TOP_AND_BOTTOM_FADING_EDGE_STRENGTH = 0.9F;
  private static final int UNSCALED_DEFAULT_SELECTION_DIVIDERS_DISTANCE = 48;
  private static final int UNSCALED_DEFAULT_SELECTION_DIVIDER_HEIGHT = 2;
  private static final TwoDigitFormatter sTwoDigitFormatter = new TwoDigitFormatter();
  private SupportAccessibilityNodeProvider mAccessibilityNodeProvider;
  private final Scroller mAdjustScroller;
  private BeginSoftInputOnLongPressCommand mBeginSoftInputOnLongPressCommand;
  private int mBottomSelectionDividerBottom;
  private ChangeCurrentByOneFromLongPressCommand mChangeCurrentByOneFromLongPressCommand;
  private final boolean mComputeMaxWidth;
  private int mCurrentScrollOffset;
  private final ImageButton mDecrementButton;
  private boolean mDecrementVirtualButtonPressed;
  private String[] mDisplayedValues;
  private final Scroller mFlingScroller;
  private Formatter mFormatter;
  private final boolean mHasSelectorWheel;
  private final ImageButton mIncrementButton;
  private boolean mIncrementVirtualButtonPressed;
  private boolean mIngonreMoveEvents;
  private int mInitialScrollOffset = Integer.MIN_VALUE;
  private final EditText mInputText;
  private long mLastDownEventTime;
  private float mLastDownEventY;
  private float mLastDownOrMoveEventY;
  private int mLastHandledDownDpadKeyCode = -1;
  private int mLastHoveredChildVirtualViewId;
  private long mLongPressUpdateInterval = 300L;
  private final int mMaxHeight;
  private int mMaxValue;
  private int mMaxWidth;
  private int mMaximumFlingVelocity;
  private final int mMinHeight;
  private int mMinValue;
  private final int mMinWidth;
  private int mMinimumFlingVelocity;
  private OnScrollListener mOnScrollListener;
  private OnValueChangeListener mOnValueChangeListener;
  private final PressedStateHelper mPressedStateHelper;
  private int mPreviousScrollerY;
  private int mScrollState = 0;
  private final Drawable mSelectionDivider;
  private final int mSelectionDividerHeight;
  private final int mSelectionDividersDistance;
  private int mSelectorElementHeight;
  private final SparseArray<String> mSelectorIndexToStringCache = new SparseArray();
  private final int[] mSelectorIndices = new int[3];
  private int mSelectorTextGapHeight;
  private final Paint mSelectorWheelPaint;
  private SetSelectionCommand mSetSelectionCommand;
  private boolean mShowSoftInputOnTap;
  private final int mSolidColor;
  private final int mTextSize;
  private int mTopSelectionDividerTop;
  private int mTouchSlop;
  private int mValue;
  private VelocityTracker mVelocityTracker;
  private final Drawable mVirtualButtonPressedDrawable;
  private boolean mWrapSelectorWheel;
  
  public NumberPicker(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NumberPicker(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.numberPickerStyle);
  }
  
  public NumberPicker(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.NumberPicker, paramInt, 0);
    paramInt = paramAttributeSet.getResourceId(R.styleable.NumberPicker_internalLayout, 0);
    if (paramInt != 0) {}
    for (boolean bool = true;; bool = false)
    {
      mHasSelectorWheel = bool;
      mSolidColor = paramAttributeSet.getColor(R.styleable.NumberPicker_solidColor, 0);
      mSelectionDivider = paramAttributeSet.getDrawable(R.styleable.NumberPicker_selectionDivider);
      int i = (int)TypedValue.applyDimension(1, 2.0F, getResources().getDisplayMetrics());
      mSelectionDividerHeight = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_selectionDividerHeight, i);
      i = (int)TypedValue.applyDimension(1, 48.0F, getResources().getDisplayMetrics());
      mSelectionDividersDistance = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_selectionDividersDistance, i);
      mMinHeight = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMinHeight, -1);
      mMaxHeight = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMaxHeight, -1);
      if ((mMinHeight == -1) || (mMaxHeight == -1) || (mMinHeight <= mMaxHeight)) {
        break;
      }
      throw new IllegalArgumentException("minHeight > maxHeight");
    }
    mMinWidth = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMinWidth, -1);
    mMaxWidth = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMaxWidth, -1);
    if ((mMinWidth != -1) && (mMaxWidth != -1) && (mMinWidth > mMaxWidth)) {
      throw new IllegalArgumentException("minWidth > maxWidth");
    }
    if (mMaxWidth == -1)
    {
      bool = true;
      mComputeMaxWidth = bool;
      mVirtualButtonPressedDrawable = paramAttributeSet.getDrawable(R.styleable.NumberPicker_virtualButtonPressedDrawable);
      paramAttributeSet.recycle();
      mPressedStateHelper = new PressedStateHelper();
      if (mHasSelectorWheel) {
        break label716;
      }
      bool = true;
      label345:
      setWillNotDraw(bool);
      ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(paramInt, this, true);
      paramAttributeSet = new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          NumberPicker.this.hideSoftInput();
          mInputText.clearFocus();
          if (paramAnonymousView.getId() == R.id.np__increment)
          {
            NumberPicker.this.changeValueByOne(true);
            return;
          }
          NumberPicker.this.changeValueByOne(false);
        }
      };
      View.OnLongClickListener local2 = new View.OnLongClickListener()
      {
        public boolean onLongClick(View paramAnonymousView)
        {
          NumberPicker.this.hideSoftInput();
          mInputText.clearFocus();
          if (paramAnonymousView.getId() == R.id.np__increment)
          {
            NumberPicker.this.postChangeCurrentByOneFromLongPress(true, 0L);
            return true;
          }
          NumberPicker.this.postChangeCurrentByOneFromLongPress(false, 0L);
          return true;
        }
      };
      if (mHasSelectorWheel) {
        break label722;
      }
      mIncrementButton = ((ImageButton)findViewById(R.id.np__increment));
      mIncrementButton.setOnClickListener(paramAttributeSet);
      mIncrementButton.setOnLongClickListener(local2);
      label428:
      if (mHasSelectorWheel) {
        break label730;
      }
      mDecrementButton = ((ImageButton)findViewById(R.id.np__decrement));
      mDecrementButton.setOnClickListener(paramAttributeSet);
      mDecrementButton.setOnLongClickListener(local2);
    }
    for (;;)
    {
      mInputText = ((EditText)findViewById(R.id.np__numberpicker_input));
      mInputText.setOnFocusChangeListener(new View.OnFocusChangeListener()
      {
        public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
        {
          if (paramAnonymousBoolean)
          {
            mInputText.selectAll();
            return;
          }
          mInputText.setSelection(0, 0);
          NumberPicker.this.validateInputTextView(paramAnonymousView);
        }
      });
      mInputText.setFilters(new InputFilter[] { new InputTextFilter() });
      mInputText.setRawInputType(2);
      mInputText.setImeOptions(6);
      paramContext = ViewConfiguration.get(paramContext);
      mTouchSlop = paramContext.getScaledTouchSlop();
      mMinimumFlingVelocity = paramContext.getScaledMinimumFlingVelocity();
      mMaximumFlingVelocity = (paramContext.getScaledMaximumFlingVelocity() / 8);
      mTextSize = ((int)mInputText.getTextSize());
      paramContext = new Paint();
      paramContext.setAntiAlias(true);
      paramContext.setTextAlign(Paint.Align.CENTER);
      paramContext.setTextSize(mTextSize);
      paramContext.setTypeface(mInputText.getTypeface());
      paramContext.setColor(mInputText.getTextColors().getColorForState(ENABLED_STATE_SET, -1));
      mSelectorWheelPaint = paramContext;
      mFlingScroller = new Scroller(getContext(), null, true);
      mAdjustScroller = new Scroller(getContext(), new DecelerateInterpolator(2.5F));
      updateInputTextView();
      if ((Build.VERSION.SDK_INT >= 16) && (getImportantForAccessibility() == 0)) {
        setImportantForAccessibility(1);
      }
      return;
      bool = false;
      break;
      label716:
      bool = false;
      break label345;
      label722:
      mIncrementButton = null;
      break label428;
      label730:
      mDecrementButton = null;
    }
  }
  
  private void changeValueByOne(boolean paramBoolean)
  {
    if (mHasSelectorWheel)
    {
      mInputText.setVisibility(4);
      if (!moveToFinalScrollerPosition(mFlingScroller)) {
        moveToFinalScrollerPosition(mAdjustScroller);
      }
      mPreviousScrollerY = 0;
      if (paramBoolean) {
        mFlingScroller.startScroll(0, 0, 0, -mSelectorElementHeight, 300);
      }
      for (;;)
      {
        invalidate();
        return;
        mFlingScroller.startScroll(0, 0, 0, mSelectorElementHeight, 300);
      }
    }
    if (paramBoolean)
    {
      setValueInternal(mValue + 1, true);
      return;
    }
    setValueInternal(mValue - 1, true);
  }
  
  private void decrementSelectorIndices(int[] paramArrayOfInt)
  {
    int i = paramArrayOfInt.length - 1;
    while (i > 0)
    {
      paramArrayOfInt[i] = paramArrayOfInt[(i - 1)];
      i -= 1;
    }
    int j = paramArrayOfInt[1] - 1;
    i = j;
    if (mWrapSelectorWheel)
    {
      i = j;
      if (j < mMinValue) {
        i = mMaxValue;
      }
    }
    paramArrayOfInt[0] = i;
    ensureCachedScrollSelectorValue(i);
  }
  
  private void ensureCachedScrollSelectorValue(int paramInt)
  {
    SparseArray localSparseArray = mSelectorIndexToStringCache;
    if ((String)localSparseArray.get(paramInt) != null) {
      return;
    }
    String str;
    if ((paramInt < mMinValue) || (paramInt > mMaxValue)) {
      str = "";
    }
    for (;;)
    {
      localSparseArray.put(paramInt, str);
      return;
      if (mDisplayedValues != null)
      {
        int i = mMinValue;
        str = mDisplayedValues[(paramInt - i)];
      }
      else
      {
        str = formatNumber(paramInt);
      }
    }
  }
  
  private boolean ensureScrollWheelAdjusted()
  {
    boolean bool = false;
    int j = mInitialScrollOffset - mCurrentScrollOffset;
    if (j != 0)
    {
      mPreviousScrollerY = 0;
      i = j;
      if (Math.abs(j) > mSelectorElementHeight / 2) {
        if (j <= 0) {
          break label72;
        }
      }
    }
    label72:
    for (int i = -mSelectorElementHeight;; i = mSelectorElementHeight)
    {
      i = j + i;
      mAdjustScroller.startScroll(0, 0, 0, i, 800);
      invalidate();
      bool = true;
      return bool;
    }
  }
  
  private void fling(int paramInt)
  {
    mPreviousScrollerY = 0;
    if (paramInt > 0) {
      mFlingScroller.fling(0, 0, 0, paramInt, 0, 0, 0, Integer.MAX_VALUE);
    }
    for (;;)
    {
      invalidate();
      return;
      mFlingScroller.fling(0, Integer.MAX_VALUE, 0, paramInt, 0, 0, 0, Integer.MAX_VALUE);
    }
  }
  
  private String formatNumber(int paramInt)
  {
    if (mFormatter != null) {
      return mFormatter.format(paramInt);
    }
    return formatNumberWithLocale(paramInt);
  }
  
  private static String formatNumberWithLocale(int paramInt)
  {
    return String.format(Locale.getDefault(), "%d", new Object[] { Integer.valueOf(paramInt) });
  }
  
  private int getSelectedPos(String paramString)
  {
    if (mDisplayedValues == null) {}
    try
    {
      i = Integer.parseInt(paramString);
      return i;
    }
    catch (NumberFormatException paramString)
    {
      try
      {
        int i = Integer.parseInt(paramString);
        return i;
      }
      catch (NumberFormatException paramString)
      {
        for (;;) {}
      }
      paramString = paramString;
    }
    i = 0;
    while (i < mDisplayedValues.length)
    {
      paramString = paramString.toLowerCase();
      if (mDisplayedValues[i].toLowerCase().startsWith(paramString)) {
        return mMinValue + i;
      }
      i += 1;
    }
    return mMinValue;
  }
  
  private SupportAccessibilityNodeProvider getSupportAccessibilityNodeProvider()
  {
    return new SupportAccessibilityNodeProvider(null);
  }
  
  public static final Formatter getTwoDigitFormatter()
  {
    return sTwoDigitFormatter;
  }
  
  private int getWrappedSelectorIndex(int paramInt)
  {
    int i;
    if (paramInt > mMaxValue) {
      i = mMinValue + (paramInt - mMaxValue) % (mMaxValue - mMinValue) - 1;
    }
    do
    {
      return i;
      i = paramInt;
    } while (paramInt >= mMinValue);
    return mMaxValue - (mMinValue - paramInt) % (mMaxValue - mMinValue) + 1;
  }
  
  private void hideSoftInput()
  {
    InputMethodManager localInputMethodManager = (InputMethodManager)getContext().getSystemService("input_method");
    if ((localInputMethodManager != null) && (localInputMethodManager.isActive(mInputText)))
    {
      localInputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
      if (mHasSelectorWheel) {
        mInputText.setVisibility(4);
      }
    }
  }
  
  private void incrementSelectorIndices(int[] paramArrayOfInt)
  {
    int i = 0;
    while (i < paramArrayOfInt.length - 1)
    {
      paramArrayOfInt[i] = paramArrayOfInt[(i + 1)];
      i += 1;
    }
    int j = paramArrayOfInt[(paramArrayOfInt.length - 2)] + 1;
    i = j;
    if (mWrapSelectorWheel)
    {
      i = j;
      if (j > mMaxValue) {
        i = mMinValue;
      }
    }
    paramArrayOfInt[(paramArrayOfInt.length - 1)] = i;
    ensureCachedScrollSelectorValue(i);
  }
  
  private void initializeFadingEdges()
  {
    setVerticalFadingEdgeEnabled(true);
    setFadingEdgeLength((getBottom() - getTop() - mTextSize) / 2);
  }
  
  private void initializeSelectorWheel()
  {
    initializeSelectorWheelIndices();
    int[] arrayOfInt = mSelectorIndices;
    int i = arrayOfInt.length;
    int j = mTextSize;
    mSelectorTextGapHeight = ((int)((getBottom() - getTop() - i * j) / arrayOfInt.length + 0.5F));
    mSelectorElementHeight = (mTextSize + mSelectorTextGapHeight);
    mInitialScrollOffset = (mInputText.getBaseline() + mInputText.getTop() - mSelectorElementHeight * 1);
    mCurrentScrollOffset = mInitialScrollOffset;
    updateInputTextView();
  }
  
  private void initializeSelectorWheelIndices()
  {
    mSelectorIndexToStringCache.clear();
    int[] arrayOfInt = mSelectorIndices;
    int m = getValue();
    int i = 0;
    while (i < mSelectorIndices.length)
    {
      int k = m + (i - 1);
      int j = k;
      if (mWrapSelectorWheel) {
        j = getWrappedSelectorIndex(k);
      }
      arrayOfInt[i] = j;
      ensureCachedScrollSelectorValue(arrayOfInt[i]);
      i += 1;
    }
  }
  
  private int makeMeasureSpec(int paramInt1, int paramInt2)
  {
    if (paramInt2 == -1) {
      return paramInt1;
    }
    int i = View.MeasureSpec.getSize(paramInt1);
    int j = View.MeasureSpec.getMode(paramInt1);
    switch (j)
    {
    case 1073741824: 
    default: 
      throw new IllegalArgumentException("Unknown measure mode: " + j);
    case -2147483648: 
      return View.MeasureSpec.makeMeasureSpec(Math.min(i, paramInt2), 1073741824);
    }
    return View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
  }
  
  private boolean moveToFinalScrollerPosition(Scroller paramScroller)
  {
    paramScroller.forceFinished(true);
    int k = paramScroller.getFinalY() - paramScroller.getCurrY();
    int i = mCurrentScrollOffset;
    int j = mSelectorElementHeight;
    j = mInitialScrollOffset - (i + k) % j;
    if (j != 0)
    {
      i = j;
      if (Math.abs(j) > mSelectorElementHeight / 2) {
        if (j <= 0) {
          break label79;
        }
      }
      label79:
      for (i = j - mSelectorElementHeight;; i = j + mSelectorElementHeight)
      {
        scrollBy(0, k + i);
        return true;
      }
    }
    return false;
  }
  
  private void notifyChange(int paramInt1, int paramInt2)
  {
    if (mOnValueChangeListener != null) {
      mOnValueChangeListener.onValueChange(this, paramInt1, mValue);
    }
  }
  
  private void onScrollStateChange(int paramInt)
  {
    if (mScrollState == paramInt) {}
    do
    {
      return;
      mScrollState = paramInt;
    } while (mOnScrollListener == null);
    mOnScrollListener.onScrollStateChange(this, paramInt);
  }
  
  private void onScrollerFinished(Scroller paramScroller)
  {
    if (paramScroller == mFlingScroller)
    {
      if (!ensureScrollWheelAdjusted()) {
        updateInputTextView();
      }
      onScrollStateChange(0);
    }
    while (mScrollState == 1) {
      return;
    }
    updateInputTextView();
  }
  
  private void postBeginSoftInputOnLongPressCommand()
  {
    if (mBeginSoftInputOnLongPressCommand == null) {
      mBeginSoftInputOnLongPressCommand = new BeginSoftInputOnLongPressCommand();
    }
    for (;;)
    {
      postDelayed(mBeginSoftInputOnLongPressCommand, ViewConfiguration.getLongPressTimeout());
      return;
      removeCallbacks(mBeginSoftInputOnLongPressCommand);
    }
  }
  
  private void postChangeCurrentByOneFromLongPress(boolean paramBoolean, long paramLong)
  {
    if (mChangeCurrentByOneFromLongPressCommand == null) {
      mChangeCurrentByOneFromLongPressCommand = new ChangeCurrentByOneFromLongPressCommand();
    }
    for (;;)
    {
      mChangeCurrentByOneFromLongPressCommand.setStep(paramBoolean);
      postDelayed(mChangeCurrentByOneFromLongPressCommand, paramLong);
      return;
      removeCallbacks(mChangeCurrentByOneFromLongPressCommand);
    }
  }
  
  private void postSetSelectionCommand(int paramInt1, int paramInt2)
  {
    if (mSetSelectionCommand == null) {
      mSetSelectionCommand = new SetSelectionCommand();
    }
    for (;;)
    {
      SetSelectionCommand.access$702(mSetSelectionCommand, paramInt1);
      SetSelectionCommand.access$802(mSetSelectionCommand, paramInt2);
      post(mSetSelectionCommand);
      return;
      removeCallbacks(mSetSelectionCommand);
    }
  }
  
  private void removeAllCallbacks()
  {
    if (mChangeCurrentByOneFromLongPressCommand != null) {
      removeCallbacks(mChangeCurrentByOneFromLongPressCommand);
    }
    if (mSetSelectionCommand != null) {
      removeCallbacks(mSetSelectionCommand);
    }
    if (mBeginSoftInputOnLongPressCommand != null) {
      removeCallbacks(mBeginSoftInputOnLongPressCommand);
    }
    mPressedStateHelper.cancel();
  }
  
  private void removeBeginSoftInputCommand()
  {
    if (mBeginSoftInputOnLongPressCommand != null) {
      removeCallbacks(mBeginSoftInputOnLongPressCommand);
    }
  }
  
  private void removeChangeCurrentByOneFromLongPress()
  {
    if (mChangeCurrentByOneFromLongPressCommand != null) {
      removeCallbacks(mChangeCurrentByOneFromLongPressCommand);
    }
  }
  
  public static int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = paramInt1;
    int j = View.MeasureSpec.getMode(paramInt2);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    switch (j)
    {
    default: 
      paramInt1 = i;
    }
    for (;;)
    {
      return 0xFF000000 & paramInt3 | paramInt1;
      continue;
      if (paramInt2 < paramInt1)
      {
        paramInt1 = paramInt2 | 0x1000000;
      }
      else
      {
        continue;
        paramInt1 = paramInt2;
      }
    }
  }
  
  private int resolveSizeAndStateRespectingMinSize(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = paramInt2;
    if (paramInt1 != -1) {
      i = resolveSizeAndState(Math.max(paramInt1, paramInt2), paramInt3, 0);
    }
    return i;
  }
  
  private void setValueInternal(int paramInt, boolean paramBoolean)
  {
    if (mValue == paramInt) {
      return;
    }
    if (mWrapSelectorWheel) {}
    for (paramInt = getWrappedSelectorIndex(paramInt);; paramInt = Math.min(Math.max(paramInt, mMinValue), mMaxValue))
    {
      int i = mValue;
      mValue = paramInt;
      updateInputTextView();
      if (paramBoolean) {
        notifyChange(i, paramInt);
      }
      initializeSelectorWheelIndices();
      invalidate();
      return;
    }
  }
  
  private void showSoftInput()
  {
    InputMethodManager localInputMethodManager = (InputMethodManager)getContext().getSystemService("input_method");
    if (localInputMethodManager != null)
    {
      if (mHasSelectorWheel) {
        mInputText.setVisibility(0);
      }
      mInputText.requestFocus();
      localInputMethodManager.showSoftInput(mInputText, 0);
    }
  }
  
  private void tryComputeMaxWidth()
  {
    if (!mComputeMaxWidth) {}
    int i;
    float f1;
    int j;
    int k;
    do
    {
      return;
      i = 0;
      if (mDisplayedValues != null) {
        break;
      }
      f1 = 0.0F;
      i = 0;
      while (i <= 9)
      {
        float f3 = mSelectorWheelPaint.measureText(formatNumberWithLocale(i));
        float f2 = f1;
        if (f3 > f1) {
          f2 = f3;
        }
        i += 1;
        f1 = f2;
      }
      j = 0;
      i = mMaxValue;
      while (i > 0)
      {
        j += 1;
        i /= 10;
      }
      k = (int)(j * f1);
      i = k + (mInputText.getPaddingLeft() + mInputText.getPaddingRight());
    } while (mMaxWidth == i);
    if (i > mMinWidth) {}
    for (mMaxWidth = i;; mMaxWidth = mMinWidth)
    {
      invalidate();
      return;
      int m = mDisplayedValues.length;
      j = 0;
      for (;;)
      {
        k = i;
        if (j >= m) {
          break;
        }
        f1 = mSelectorWheelPaint.measureText(mDisplayedValues[j]);
        k = i;
        if (f1 > i) {
          k = (int)f1;
        }
        j += 1;
        i = k;
      }
    }
  }
  
  private boolean updateInputTextView()
  {
    if (mDisplayedValues == null) {}
    for (String str = formatNumber(mValue); (!TextUtils.isEmpty(str)) && (!str.equals(mInputText.getText().toString())); str = mDisplayedValues[(mValue - mMinValue)])
    {
      mInputText.setText(str);
      return true;
    }
    return false;
  }
  
  private void validateInputTextView(View paramView)
  {
    paramView = String.valueOf(((TextView)paramView).getText());
    if (TextUtils.isEmpty(paramView))
    {
      updateInputTextView();
      return;
    }
    setValueInternal(getSelectedPos(paramView.toString()), true);
  }
  
  public void computeScroll()
  {
    Scroller localScroller2 = mFlingScroller;
    Scroller localScroller1 = localScroller2;
    if (localScroller2.isFinished())
    {
      localScroller2 = mAdjustScroller;
      localScroller1 = localScroller2;
      if (localScroller2.isFinished()) {
        return;
      }
    }
    localScroller1.computeScrollOffset();
    int i = localScroller1.getCurrY();
    if (mPreviousScrollerY == 0) {
      mPreviousScrollerY = localScroller1.getStartY();
    }
    scrollBy(0, i - mPreviousScrollerY);
    mPreviousScrollerY = i;
    if (localScroller1.isFinished())
    {
      onScrollerFinished(localScroller1);
      return;
    }
    invalidate();
  }
  
  protected boolean dispatchHoverEvent(MotionEvent paramMotionEvent)
  {
    if (!mHasSelectorWheel) {
      return super.dispatchHoverEvent(paramMotionEvent);
    }
    int i;
    if (((AccessibilityManager)getContext().getSystemService("accessibility")).isEnabled())
    {
      i = (int)paramMotionEvent.getY();
      if (i >= mTopSelectionDividerTop) {
        break label94;
      }
      i = 3;
      int j = paramMotionEvent.getAction();
      paramMotionEvent = getSupportAccessibilityNodeProvider();
      switch (j & 0xFF)
      {
      }
    }
    for (;;)
    {
      return false;
      label94:
      if (i > mBottomSelectionDividerBottom)
      {
        i = 1;
        break;
      }
      i = 2;
      break;
      paramMotionEvent.sendAccessibilityEventForVirtualView(i, 128);
      mLastHoveredChildVirtualViewId = i;
      paramMotionEvent.performAction(i, 64, null);
      continue;
      if ((mLastHoveredChildVirtualViewId != i) && (mLastHoveredChildVirtualViewId != -1))
      {
        paramMotionEvent.sendAccessibilityEventForVirtualView(mLastHoveredChildVirtualViewId, 256);
        paramMotionEvent.sendAccessibilityEventForVirtualView(i, 128);
        mLastHoveredChildVirtualViewId = i;
        paramMotionEvent.performAction(i, 64, null);
        continue;
        paramMotionEvent.sendAccessibilityEventForVirtualView(i, 256);
        mLastHoveredChildVirtualViewId = -1;
      }
    }
  }
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    boolean bool = true;
    int i = paramKeyEvent.getKeyCode();
    switch (i)
    {
    }
    label127:
    label166:
    do
    {
      bool = super.dispatchKeyEvent(paramKeyEvent);
      do
      {
        return bool;
        removeAllCallbacks();
        break;
        if (!mHasSelectorWheel) {
          break;
        }
        switch (paramKeyEvent.getAction())
        {
        default: 
          break;
        case 0: 
          if ((!mWrapSelectorWheel) && (i != 20)) {
            break label166;
          }
          if (getValue() >= getMaxValue()) {
            break;
          }
          requestFocus();
          mLastHandledDownDpadKeyCode = i;
          removeAllCallbacks();
        }
      } while (!mFlingScroller.isFinished());
      if (i == 20) {}
      for (bool = true;; bool = false)
      {
        changeValueByOne(bool);
        return true;
        if (getValue() <= getMinValue()) {
          break;
        }
        break label127;
      }
    } while (mLastHandledDownDpadKeyCode != i);
    mLastHandledDownDpadKeyCode = -1;
    return true;
  }
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return super.dispatchTouchEvent(paramMotionEvent);
      removeAllCallbacks();
    }
  }
  
  public boolean dispatchTrackballEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return super.dispatchTrackballEvent(paramMotionEvent);
      removeAllCallbacks();
    }
  }
  
  public AccessibilityNodeProvider getAccessibilityNodeProvider()
  {
    if (!mHasSelectorWheel) {
      return super.getAccessibilityNodeProvider();
    }
    if (mAccessibilityNodeProvider == null) {
      mAccessibilityNodeProvider = new SupportAccessibilityNodeProvider(null);
    }
    return mAccessibilityNodeProvider.mProvider;
  }
  
  protected float getBottomFadingEdgeStrength()
  {
    return 0.9F;
  }
  
  public String[] getDisplayedValues()
  {
    return mDisplayedValues;
  }
  
  public int getMaxValue()
  {
    return mMaxValue;
  }
  
  public int getMinValue()
  {
    return mMinValue;
  }
  
  public int getSolidColor()
  {
    return mSolidColor;
  }
  
  protected float getTopFadingEdgeStrength()
  {
    return 0.9F;
  }
  
  public int getValue()
  {
    return mValue;
  }
  
  public boolean getWrapSelectorWheel()
  {
    return mWrapSelectorWheel;
  }
  
  protected void onDetachedFromWindow()
  {
    removeAllCallbacks();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (!mHasSelectorWheel) {
      super.onDraw(paramCanvas);
    }
    do
    {
      return;
      float f2 = (getRight() - getLeft()) / 2;
      float f1 = mCurrentScrollOffset;
      if ((mVirtualButtonPressedDrawable != null) && (mScrollState == 0))
      {
        if (mDecrementVirtualButtonPressed)
        {
          mVirtualButtonPressedDrawable.setState(PRESSED_ENABLED_STATE_SET);
          mVirtualButtonPressedDrawable.setBounds(0, 0, getRight(), mTopSelectionDividerTop);
          mVirtualButtonPressedDrawable.draw(paramCanvas);
        }
        if (mIncrementVirtualButtonPressed)
        {
          mVirtualButtonPressedDrawable.setState(PRESSED_ENABLED_STATE_SET);
          mVirtualButtonPressedDrawable.setBounds(0, mBottomSelectionDividerBottom, getRight(), getBottom());
          mVirtualButtonPressedDrawable.draw(paramCanvas);
        }
      }
      int[] arrayOfInt = mSelectorIndices;
      i = 0;
      while (i < arrayOfInt.length)
      {
        j = arrayOfInt[i];
        String str = (String)mSelectorIndexToStringCache.get(j);
        if ((i != 1) || (mInputText.getVisibility() != 0)) {
          paramCanvas.drawText(str, f2, f1, mSelectorWheelPaint);
        }
        f1 += mSelectorElementHeight;
        i += 1;
      }
    } while (mSelectionDivider == null);
    int i = mTopSelectionDividerTop;
    int j = mSelectionDividerHeight;
    mSelectionDivider.setBounds(0, i, getRight(), i + j);
    mSelectionDivider.draw(paramCanvas);
    i = mBottomSelectionDividerBottom;
    j = mSelectionDividerHeight;
    mSelectionDivider.setBounds(0, i - j, getRight(), i);
    mSelectionDivider.draw(paramCanvas);
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(NumberPicker.class.getName());
    paramAccessibilityEvent.setScrollable(true);
    paramAccessibilityEvent.setScrollY((mMinValue + mValue) * mSelectorElementHeight);
    paramAccessibilityEvent.setMaxScrollY((mMaxValue - mMinValue) * mSelectorElementHeight);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((!mHasSelectorWheel) || (!isEnabled())) {
      return false;
    }
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    default: 
      return false;
    }
    removeAllCallbacks();
    mInputText.setVisibility(4);
    float f = paramMotionEvent.getY();
    mLastDownEventY = f;
    mLastDownOrMoveEventY = f;
    mLastDownEventTime = paramMotionEvent.getEventTime();
    mIngonreMoveEvents = false;
    mShowSoftInputOnTap = false;
    if (mLastDownEventY < mTopSelectionDividerTop) {
      if (mScrollState == 0) {
        mPressedStateHelper.buttonPressDelayed(2);
      }
    }
    for (;;)
    {
      getParent().requestDisallowInterceptTouchEvent(true);
      if (mFlingScroller.isFinished()) {
        break;
      }
      mFlingScroller.forceFinished(true);
      mAdjustScroller.forceFinished(true);
      onScrollStateChange(0);
      return true;
      if ((mLastDownEventY > mBottomSelectionDividerBottom) && (mScrollState == 0)) {
        mPressedStateHelper.buttonPressDelayed(1);
      }
    }
    if (!mAdjustScroller.isFinished())
    {
      mFlingScroller.forceFinished(true);
      mAdjustScroller.forceFinished(true);
      return true;
    }
    if (mLastDownEventY < mTopSelectionDividerTop)
    {
      hideSoftInput();
      postChangeCurrentByOneFromLongPress(false, ViewConfiguration.getLongPressTimeout());
      return true;
    }
    if (mLastDownEventY > mBottomSelectionDividerBottom)
    {
      hideSoftInput();
      postChangeCurrentByOneFromLongPress(true, ViewConfiguration.getLongPressTimeout());
      return true;
    }
    mShowSoftInputOnTap = true;
    postBeginSoftInputOnLongPressCommand();
    return true;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (!mHasSelectorWheel) {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    }
    do
    {
      return;
      paramInt4 = getMeasuredWidth();
      paramInt3 = getMeasuredHeight();
      paramInt1 = mInputText.getMeasuredWidth();
      paramInt2 = mInputText.getMeasuredHeight();
      paramInt4 = (paramInt4 - paramInt1) / 2;
      paramInt3 = (paramInt3 - paramInt2) / 2;
      mInputText.layout(paramInt4, paramInt3, paramInt4 + paramInt1, paramInt3 + paramInt2);
    } while (!paramBoolean);
    initializeSelectorWheel();
    initializeFadingEdges();
    mTopSelectionDividerTop = ((getHeight() - mSelectionDividersDistance) / 2 - mSelectionDividerHeight);
    mBottomSelectionDividerBottom = (mTopSelectionDividerTop + mSelectionDividerHeight * 2 + mSelectionDividersDistance);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (!mHasSelectorWheel)
    {
      super.onMeasure(paramInt1, paramInt2);
      return;
    }
    super.onMeasure(makeMeasureSpec(paramInt1, mMaxWidth), makeMeasureSpec(paramInt2, mMaxHeight));
    setMeasuredDimension(resolveSizeAndStateRespectingMinSize(mMinWidth, getMeasuredWidth(), paramInt1), resolveSizeAndStateRespectingMinSize(mMinHeight, getMeasuredHeight(), paramInt2));
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((!isEnabled()) || (!mHasSelectorWheel)) {
      return false;
    }
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    mVelocityTracker.addMovement(paramMotionEvent);
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return true;
      if (!mIngonreMoveEvents)
      {
        float f = paramMotionEvent.getY();
        if (mScrollState != 1) {
          if ((int)Math.abs(f - mLastDownEventY) > mTouchSlop)
          {
            removeAllCallbacks();
            onScrollStateChange(1);
          }
        }
        for (;;)
        {
          mLastDownOrMoveEventY = f;
          break;
          scrollBy(0, (int)(f - mLastDownOrMoveEventY));
          invalidate();
        }
        removeBeginSoftInputCommand();
        removeChangeCurrentByOneFromLongPress();
        mPressedStateHelper.cancel();
        VelocityTracker localVelocityTracker = mVelocityTracker;
        localVelocityTracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
        i = (int)localVelocityTracker.getYVelocity();
        if (Math.abs(i) <= mMinimumFlingVelocity) {
          break;
        }
        fling(i);
        onScrollStateChange(2);
        mVelocityTracker.recycle();
        mVelocityTracker = null;
      }
    }
    int i = (int)paramMotionEvent.getY();
    int j = (int)Math.abs(i - mLastDownEventY);
    paramMotionEvent.getEventTime();
    long l = mLastDownEventTime;
    l = ViewConfiguration.getTapTimeout();
    if (j <= mTouchSlop) {
      if (mShowSoftInputOnTap)
      {
        mShowSoftInputOnTap = false;
        showSoftInput();
      }
    }
    for (;;)
    {
      onScrollStateChange(0);
      break;
      i = i / mSelectorElementHeight - 1;
      if (i > 0)
      {
        changeValueByOne(true);
        mPressedStateHelper.buttonTapped(1);
      }
      else if (i < 0)
      {
        changeValueByOne(false);
        mPressedStateHelper.buttonTapped(2);
        continue;
        ensureScrollWheelAdjusted();
      }
    }
  }
  
  public void scrollBy(int paramInt1, int paramInt2)
  {
    int[] arrayOfInt = mSelectorIndices;
    if ((!mWrapSelectorWheel) && (paramInt2 > 0) && (arrayOfInt[1] <= mMinValue)) {
      mCurrentScrollOffset = mInitialScrollOffset;
    }
    for (;;)
    {
      return;
      if ((!mWrapSelectorWheel) && (paramInt2 < 0) && (arrayOfInt[1] >= mMaxValue))
      {
        mCurrentScrollOffset = mInitialScrollOffset;
        return;
      }
      for (mCurrentScrollOffset += paramInt2; mCurrentScrollOffset - mInitialScrollOffset > mSelectorTextGapHeight; mCurrentScrollOffset = mInitialScrollOffset)
      {
        label75:
        mCurrentScrollOffset -= mSelectorElementHeight;
        decrementSelectorIndices(arrayOfInt);
        setValueInternal(arrayOfInt[1], true);
        if ((mWrapSelectorWheel) || (arrayOfInt[1] > mMinValue)) {
          break label75;
        }
      }
      while (mCurrentScrollOffset - mInitialScrollOffset < -mSelectorTextGapHeight)
      {
        mCurrentScrollOffset += mSelectorElementHeight;
        incrementSelectorIndices(arrayOfInt);
        setValueInternal(arrayOfInt[1], true);
        if ((!mWrapSelectorWheel) && (arrayOfInt[1] >= mMaxValue)) {
          mCurrentScrollOffset = mInitialScrollOffset;
        }
      }
    }
  }
  
  public void setDisplayedValues(String[] paramArrayOfString)
  {
    if (mDisplayedValues == paramArrayOfString) {
      return;
    }
    mDisplayedValues = paramArrayOfString;
    if (mDisplayedValues != null) {
      mInputText.setRawInputType(524289);
    }
    for (;;)
    {
      updateInputTextView();
      initializeSelectorWheelIndices();
      tryComputeMaxWidth();
      return;
      mInputText.setRawInputType(2);
    }
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    super.setEnabled(paramBoolean);
    if (!mHasSelectorWheel) {
      mIncrementButton.setEnabled(paramBoolean);
    }
    if (!mHasSelectorWheel) {
      mDecrementButton.setEnabled(paramBoolean);
    }
    mInputText.setEnabled(paramBoolean);
  }
  
  public void setFormatter(Formatter paramFormatter)
  {
    if (paramFormatter == mFormatter) {
      return;
    }
    mFormatter = paramFormatter;
    initializeSelectorWheelIndices();
    updateInputTextView();
  }
  
  public void setMaxValue(int paramInt)
  {
    if (mMaxValue == paramInt) {
      return;
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("maxValue must be >= 0");
    }
    mMaxValue = paramInt;
    if (mMaxValue < mValue) {
      mValue = mMaxValue;
    }
    if (mMaxValue - mMinValue > mSelectorIndices.length) {}
    for (boolean bool = true;; bool = false)
    {
      setWrapSelectorWheel(bool);
      initializeSelectorWheelIndices();
      updateInputTextView();
      tryComputeMaxWidth();
      invalidate();
      return;
    }
  }
  
  public void setMinValue(int paramInt)
  {
    if (mMinValue == paramInt) {
      return;
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("minValue must be >= 0");
    }
    mMinValue = paramInt;
    if (mMinValue > mValue) {
      mValue = mMinValue;
    }
    if (mMaxValue - mMinValue > mSelectorIndices.length) {}
    for (boolean bool = true;; bool = false)
    {
      setWrapSelectorWheel(bool);
      initializeSelectorWheelIndices();
      updateInputTextView();
      tryComputeMaxWidth();
      invalidate();
      return;
    }
  }
  
  public void setOnLongPressUpdateInterval(long paramLong)
  {
    mLongPressUpdateInterval = paramLong;
  }
  
  public void setOnScrollListener(OnScrollListener paramOnScrollListener)
  {
    mOnScrollListener = paramOnScrollListener;
  }
  
  public void setOnValueChangedListener(OnValueChangeListener paramOnValueChangeListener)
  {
    mOnValueChangeListener = paramOnValueChangeListener;
  }
  
  public void setValue(int paramInt)
  {
    setValueInternal(paramInt, false);
  }
  
  public void setWrapSelectorWheel(boolean paramBoolean)
  {
    if (mMaxValue - mMinValue >= mSelectorIndices.length) {}
    for (int i = 1;; i = 0)
    {
      if (((!paramBoolean) || (i != 0)) && (paramBoolean != mWrapSelectorWheel)) {
        mWrapSelectorWheel = paramBoolean;
      }
      return;
    }
  }
  
  class AccessibilityNodeProviderImpl
    extends AccessibilityNodeProvider
  {
    private static final int UNDEFINED = Integer.MIN_VALUE;
    private static final int VIRTUAL_VIEW_ID_DECREMENT = 3;
    private static final int VIRTUAL_VIEW_ID_INCREMENT = 1;
    private static final int VIRTUAL_VIEW_ID_INPUT = 2;
    private int mAccessibilityFocusedView = Integer.MIN_VALUE;
    private final int[] mTempArray = new int[2];
    private final Rect mTempRect = new Rect();
    
    AccessibilityNodeProviderImpl() {}
    
    private AccessibilityNodeInfo createAccessibilityNodeInfoForNumberPicker(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      AccessibilityNodeInfo localAccessibilityNodeInfo = AccessibilityNodeInfo.obtain();
      localAccessibilityNodeInfo.setClassName(NumberPicker.class.getName());
      localAccessibilityNodeInfo.setPackageName(getContext().getPackageName());
      localAccessibilityNodeInfo.setSource(NumberPicker.this);
      if (hasVirtualDecrementButton()) {
        localAccessibilityNodeInfo.addChild(NumberPicker.this, 3);
      }
      localAccessibilityNodeInfo.addChild(NumberPicker.this, 2);
      if (hasVirtualIncrementButton()) {
        localAccessibilityNodeInfo.addChild(NumberPicker.this, 1);
      }
      localAccessibilityNodeInfo.setParent((View)getParentForAccessibility());
      localAccessibilityNodeInfo.setEnabled(isEnabled());
      localAccessibilityNodeInfo.setScrollable(true);
      if (mAccessibilityFocusedView != -1) {
        localAccessibilityNodeInfo.addAction(64);
      }
      if (mAccessibilityFocusedView == -1) {
        localAccessibilityNodeInfo.addAction(128);
      }
      if (isEnabled())
      {
        if ((getWrapSelectorWheel()) || (getValue() < getMaxValue())) {
          localAccessibilityNodeInfo.addAction(4096);
        }
        if ((getWrapSelectorWheel()) || (getValue() > getMinValue())) {
          localAccessibilityNodeInfo.addAction(8192);
        }
      }
      return localAccessibilityNodeInfo;
    }
    
    private AccessibilityNodeInfo createAccessibilityNodeInfoForVirtualButton(int paramInt1, String paramString, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
    {
      AccessibilityNodeInfo localAccessibilityNodeInfo = AccessibilityNodeInfo.obtain();
      localAccessibilityNodeInfo.setClassName(Button.class.getName());
      localAccessibilityNodeInfo.setPackageName(getContext().getPackageName());
      localAccessibilityNodeInfo.setSource(NumberPicker.this, paramInt1);
      localAccessibilityNodeInfo.setParent(NumberPicker.this);
      localAccessibilityNodeInfo.setText(paramString);
      localAccessibilityNodeInfo.setClickable(true);
      localAccessibilityNodeInfo.setLongClickable(true);
      localAccessibilityNodeInfo.setEnabled(isEnabled());
      paramString = mTempRect;
      paramString.set(paramInt2, paramInt3, paramInt4, paramInt5);
      localAccessibilityNodeInfo.setBoundsInParent(paramString);
      int[] arrayOfInt = mTempArray;
      getLocationOnScreen(arrayOfInt);
      paramString.offset(arrayOfInt[0], arrayOfInt[1]);
      localAccessibilityNodeInfo.setBoundsInScreen(paramString);
      if (mAccessibilityFocusedView != paramInt1) {
        localAccessibilityNodeInfo.addAction(64);
      }
      if (mAccessibilityFocusedView == paramInt1) {
        localAccessibilityNodeInfo.addAction(128);
      }
      if (isEnabled()) {
        localAccessibilityNodeInfo.addAction(16);
      }
      return localAccessibilityNodeInfo;
    }
    
    private AccessibilityNodeInfo createAccessibiltyNodeInfoForInputText()
    {
      AccessibilityNodeInfo localAccessibilityNodeInfo = mInputText.createAccessibilityNodeInfo();
      localAccessibilityNodeInfo.setSource(NumberPicker.this, 2);
      if (mAccessibilityFocusedView != 2) {
        localAccessibilityNodeInfo.addAction(64);
      }
      if (mAccessibilityFocusedView == 2) {
        localAccessibilityNodeInfo.addAction(128);
      }
      return localAccessibilityNodeInfo;
    }
    
    private void findAccessibilityNodeInfosByTextInChild(String paramString, int paramInt, List<AccessibilityNodeInfo> paramList)
    {
      switch (paramInt)
      {
      }
      Object localObject;
      do
      {
        do
        {
          do
          {
            return;
            localObject = getVirtualDecrementButtonText();
          } while ((TextUtils.isEmpty((CharSequence)localObject)) || (!((String)localObject).toString().toLowerCase().contains(paramString)));
          paramList.add(createAccessibilityNodeInfo(3));
          return;
          localObject = mInputText.getText();
          if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((CharSequence)localObject).toString().toLowerCase().contains(paramString)))
          {
            paramList.add(createAccessibilityNodeInfo(2));
            return;
          }
          localObject = mInputText.getText();
        } while ((TextUtils.isEmpty((CharSequence)localObject)) || (!((CharSequence)localObject).toString().toLowerCase().contains(paramString)));
        paramList.add(createAccessibilityNodeInfo(2));
        return;
        localObject = getVirtualIncrementButtonText();
      } while ((TextUtils.isEmpty((CharSequence)localObject)) || (!((String)localObject).toString().toLowerCase().contains(paramString)));
      paramList.add(createAccessibilityNodeInfo(1));
    }
    
    private String getVirtualDecrementButtonText()
    {
      int j = mValue - 1;
      int i = j;
      if (mWrapSelectorWheel) {
        i = NumberPicker.this.getWrappedSelectorIndex(j);
      }
      if (i >= mMinValue)
      {
        if (mDisplayedValues == null) {
          return NumberPicker.this.formatNumber(i);
        }
        return mDisplayedValues[(i - mMinValue)];
      }
      return null;
    }
    
    private String getVirtualIncrementButtonText()
    {
      int j = mValue + 1;
      int i = j;
      if (mWrapSelectorWheel) {
        i = NumberPicker.this.getWrappedSelectorIndex(j);
      }
      if (i <= mMaxValue)
      {
        if (mDisplayedValues == null) {
          return NumberPicker.this.formatNumber(i);
        }
        return mDisplayedValues[(i - mMinValue)];
      }
      return null;
    }
    
    private boolean hasVirtualDecrementButton()
    {
      return (getWrapSelectorWheel()) || (getValue() > getMinValue());
    }
    
    private boolean hasVirtualIncrementButton()
    {
      return (getWrapSelectorWheel()) || (getValue() < getMaxValue());
    }
    
    private void sendAccessibilityEventForVirtualButton(int paramInt1, int paramInt2, String paramString)
    {
      if (((AccessibilityManager)getContext().getSystemService("accessibility")).isEnabled())
      {
        AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain(paramInt2);
        localAccessibilityEvent.setClassName(Button.class.getName());
        localAccessibilityEvent.setPackageName(getContext().getPackageName());
        localAccessibilityEvent.getText().add(paramString);
        localAccessibilityEvent.setEnabled(isEnabled());
        localAccessibilityEvent.setSource(NumberPicker.this, paramInt1);
        requestSendAccessibilityEvent(NumberPicker.this, localAccessibilityEvent);
      }
    }
    
    private void sendAccessibilityEventForVirtualText(int paramInt)
    {
      if (((AccessibilityManager)getContext().getSystemService("accessibility")).isEnabled())
      {
        AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain(paramInt);
        mInputText.onInitializeAccessibilityEvent(localAccessibilityEvent);
        mInputText.onPopulateAccessibilityEvent(localAccessibilityEvent);
        localAccessibilityEvent.setSource(NumberPicker.this, 2);
        requestSendAccessibilityEvent(NumberPicker.this, localAccessibilityEvent);
      }
    }
    
    public AccessibilityNodeInfo createAccessibilityNodeInfo(int paramInt)
    {
      switch (paramInt)
      {
      case 0: 
      default: 
        return super.createAccessibilityNodeInfo(paramInt);
      case -1: 
        return createAccessibilityNodeInfoForNumberPicker(getScrollX(), getScrollY(), getScrollX() + (getRight() - getLeft()), getScrollY() + (getBottom() - getTop()));
      case 3: 
        str = getVirtualDecrementButtonText();
        paramInt = getScrollX();
        i = getScrollY();
        j = getScrollX();
        k = getRight();
        m = getLeft();
        n = mTopSelectionDividerTop;
        return createAccessibilityNodeInfoForVirtualButton(3, str, paramInt, i, k - m + j, mSelectionDividerHeight + n);
      case 2: 
        return createAccessibiltyNodeInfoForInputText();
      }
      String str = getVirtualIncrementButtonText();
      paramInt = getScrollX();
      int i = mBottomSelectionDividerBottom;
      int j = mSelectionDividerHeight;
      int k = getScrollX();
      int m = getRight();
      int n = getLeft();
      int i1 = getScrollY();
      return createAccessibilityNodeInfoForVirtualButton(1, str, paramInt, i - j, m - n + k, getBottom() - getTop() + i1);
    }
    
    public List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String paramString, int paramInt)
    {
      if (TextUtils.isEmpty(paramString)) {
        return Collections.emptyList();
      }
      String str = paramString.toLowerCase();
      ArrayList localArrayList = new ArrayList();
      switch (paramInt)
      {
      case 0: 
      default: 
        return super.findAccessibilityNodeInfosByText(paramString, paramInt);
      case -1: 
        findAccessibilityNodeInfosByTextInChild(str, 3, localArrayList);
        findAccessibilityNodeInfosByTextInChild(str, 2, localArrayList);
        findAccessibilityNodeInfosByTextInChild(str, 1, localArrayList);
        return localArrayList;
      }
      findAccessibilityNodeInfosByTextInChild(str, paramInt, localArrayList);
      return localArrayList;
    }
    
    public boolean performAction(int paramInt1, int paramInt2, Bundle paramBundle)
    {
      boolean bool3 = false;
      boolean bool2 = false;
      boolean bool1;
      switch (paramInt1)
      {
      case 0: 
      default: 
        bool1 = super.performAction(paramInt1, paramInt2, paramBundle);
      }
      label206:
      label261:
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              do
                              {
                                do
                                {
                                  do
                                  {
                                    do
                                    {
                                      do
                                      {
                                        do
                                        {
                                          do
                                          {
                                            return bool1;
                                            switch (paramInt2)
                                            {
                                            default: 
                                              break;
                                            case 64: 
                                              bool1 = bool2;
                                            }
                                          } while (mAccessibilityFocusedView == paramInt1);
                                          mAccessibilityFocusedView = paramInt1;
                                          performAccessibilityAction(64, null);
                                          return true;
                                          bool1 = bool2;
                                        } while (mAccessibilityFocusedView != paramInt1);
                                        mAccessibilityFocusedView = Integer.MIN_VALUE;
                                        performAccessibilityAction(128, null);
                                        return true;
                                        bool1 = bool2;
                                      } while (!isEnabled());
                                      if (getWrapSelectorWheel()) {
                                        break label206;
                                      }
                                      bool1 = bool2;
                                    } while (getValue() >= getMaxValue());
                                    NumberPicker.this.changeValueByOne(true);
                                    return true;
                                    bool1 = bool2;
                                  } while (!isEnabled());
                                  if (getWrapSelectorWheel()) {
                                    break label261;
                                  }
                                  bool1 = bool2;
                                } while (getValue() <= getMinValue());
                                NumberPicker.this.changeValueByOne(false);
                                return true;
                                switch (paramInt2)
                                {
                                default: 
                                  return mInputText.performAccessibilityAction(paramInt2, paramBundle);
                                case 1: 
                                  bool1 = bool2;
                                }
                              } while (!isEnabled());
                              bool1 = bool2;
                            } while (mInputText.isFocused());
                            return mInputText.requestFocus();
                            bool1 = bool2;
                          } while (!isEnabled());
                          bool1 = bool2;
                        } while (!mInputText.isFocused());
                        mInputText.clearFocus();
                        return true;
                        bool1 = bool2;
                      } while (!isEnabled());
                      NumberPicker.this.showSoftInput();
                      return true;
                      bool1 = bool2;
                    } while (mAccessibilityFocusedView == paramInt1);
                    mAccessibilityFocusedView = paramInt1;
                    sendAccessibilityEventForVirtualView(paramInt1, 32768);
                    mInputText.invalidate();
                    return true;
                    bool1 = bool2;
                  } while (mAccessibilityFocusedView != paramInt1);
                  mAccessibilityFocusedView = Integer.MIN_VALUE;
                  sendAccessibilityEventForVirtualView(paramInt1, 65536);
                  mInputText.invalidate();
                  return true;
                  switch (paramInt2)
                  {
                  default: 
                    return false;
                  case 16: 
                    bool1 = bool2;
                  }
                } while (!isEnabled());
                NumberPicker.this.changeValueByOne(true);
                sendAccessibilityEventForVirtualView(paramInt1, 1);
                return true;
                bool1 = bool2;
              } while (mAccessibilityFocusedView == paramInt1);
              mAccessibilityFocusedView = paramInt1;
              sendAccessibilityEventForVirtualView(paramInt1, 32768);
              invalidate(0, mBottomSelectionDividerBottom, getRight(), getBottom());
              return true;
              bool1 = bool2;
            } while (mAccessibilityFocusedView != paramInt1);
            mAccessibilityFocusedView = Integer.MIN_VALUE;
            sendAccessibilityEventForVirtualView(paramInt1, 65536);
            invalidate(0, mBottomSelectionDividerBottom, getRight(), getBottom());
            return true;
            switch (paramInt2)
            {
            default: 
              return false;
            case 16: 
              bool1 = bool2;
            }
          } while (!isEnabled());
          bool1 = bool3;
          if (paramInt1 == 1) {
            bool1 = true;
          }
          NumberPicker.this.changeValueByOne(bool1);
          sendAccessibilityEventForVirtualView(paramInt1, 1);
          return true;
          bool1 = bool2;
        } while (mAccessibilityFocusedView == paramInt1);
        mAccessibilityFocusedView = paramInt1;
        sendAccessibilityEventForVirtualView(paramInt1, 32768);
        invalidate(0, 0, getRight(), mTopSelectionDividerTop);
        return true;
        bool1 = bool2;
      } while (mAccessibilityFocusedView != paramInt1);
      mAccessibilityFocusedView = Integer.MIN_VALUE;
      sendAccessibilityEventForVirtualView(paramInt1, 65536);
      invalidate(0, 0, getRight(), mTopSelectionDividerTop);
      return true;
    }
    
    public void sendAccessibilityEventForVirtualView(int paramInt1, int paramInt2)
    {
      switch (paramInt1)
      {
      }
      do
      {
        do
        {
          return;
        } while (!hasVirtualDecrementButton());
        sendAccessibilityEventForVirtualButton(paramInt1, paramInt2, getVirtualDecrementButtonText());
        return;
        sendAccessibilityEventForVirtualText(paramInt2);
        return;
      } while (!hasVirtualIncrementButton());
      sendAccessibilityEventForVirtualButton(paramInt1, paramInt2, getVirtualIncrementButtonText());
    }
  }
  
  class BeginSoftInputOnLongPressCommand
    implements Runnable
  {
    BeginSoftInputOnLongPressCommand() {}
    
    public void run()
    {
      NumberPicker.this.showSoftInput();
      NumberPicker.access$2002(NumberPicker.this, true);
    }
  }
  
  class ChangeCurrentByOneFromLongPressCommand
    implements Runnable
  {
    private boolean mIncrement;
    
    ChangeCurrentByOneFromLongPressCommand() {}
    
    private void setStep(boolean paramBoolean)
    {
      mIncrement = paramBoolean;
    }
    
    public void run()
    {
      NumberPicker.this.changeValueByOne(mIncrement);
      postDelayed(this, mLongPressUpdateInterval);
    }
  }
  
  public static class CustomEditText
    extends EditText
  {
    public CustomEditText(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public void onEditorAction(int paramInt)
    {
      super.onEditorAction(paramInt);
      if (paramInt == 6) {
        clearFocus();
      }
    }
  }
  
  public static abstract interface Formatter
  {
    public abstract String format(int paramInt);
  }
  
  class InputTextFilter
    extends NumberKeyListener
  {
    InputTextFilter() {}
    
    public CharSequence filter(CharSequence paramCharSequence, int paramInt1, int paramInt2, Spanned paramSpanned, int paramInt3, int paramInt4)
    {
      CharSequence localCharSequence;
      if (mDisplayedValues == null)
      {
        localCharSequence = super.filter(paramCharSequence, paramInt1, paramInt2, paramSpanned, paramInt3, paramInt4);
        localObject = localCharSequence;
        if (localCharSequence == null) {
          localObject = paramCharSequence.subSequence(paramInt1, paramInt2);
        }
        paramCharSequence = String.valueOf(paramSpanned.subSequence(0, paramInt3)) + localObject + paramSpanned.subSequence(paramInt4, paramSpanned.length());
        if ("".equals(paramCharSequence)) {
          return paramCharSequence;
        }
        if (NumberPicker.this.getSelectedPos(paramCharSequence) > mMaxValue) {
          return "";
        }
        return (CharSequence)localObject;
      }
      paramCharSequence = String.valueOf(paramCharSequence.subSequence(paramInt1, paramInt2));
      if (TextUtils.isEmpty(paramCharSequence)) {
        return "";
      }
      paramCharSequence = String.valueOf(paramSpanned.subSequence(0, paramInt3)) + paramCharSequence + paramSpanned.subSequence(paramInt4, paramSpanned.length());
      paramSpanned = String.valueOf(paramCharSequence).toLowerCase();
      Object localObject = mDisplayedValues;
      paramInt2 = localObject.length;
      paramInt1 = 0;
      while (paramInt1 < paramInt2)
      {
        localCharSequence = localObject[paramInt1];
        if (localCharSequence.toLowerCase().startsWith(paramSpanned))
        {
          NumberPicker.this.postSetSelectionCommand(paramCharSequence.length(), localCharSequence.length());
          return localCharSequence.subSequence(paramInt3, localCharSequence.length());
        }
        paramInt1 += 1;
      }
      return "";
    }
    
    protected char[] getAcceptedChars()
    {
      return NumberPicker.DIGIT_CHARACTERS;
    }
    
    public int getInputType()
    {
      return 1;
    }
  }
  
  public static abstract interface OnScrollListener
  {
    public static final int SCROLL_STATE_FLING = 2;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_TOUCH_SCROLL = 1;
    
    public abstract void onScrollStateChange(NumberPicker paramNumberPicker, int paramInt);
  }
  
  public static abstract interface OnValueChangeListener
  {
    public abstract void onValueChange(NumberPicker paramNumberPicker, int paramInt1, int paramInt2);
  }
  
  class PressedStateHelper
    implements Runnable
  {
    public static final int BUTTON_DECREMENT = 2;
    public static final int BUTTON_INCREMENT = 1;
    private final int MODE_PRESS = 1;
    private final int MODE_TAPPED = 2;
    private int mManagedButton;
    private int mMode;
    
    PressedStateHelper() {}
    
    public void buttonPressDelayed(int paramInt)
    {
      cancel();
      mMode = 1;
      mManagedButton = paramInt;
      postDelayed(this, ViewConfiguration.getTapTimeout());
    }
    
    public void buttonTapped(int paramInt)
    {
      cancel();
      mMode = 2;
      mManagedButton = paramInt;
      post(this);
    }
    
    public void cancel()
    {
      mMode = 0;
      mManagedButton = 0;
      removeCallbacks(this);
      if (mIncrementVirtualButtonPressed)
      {
        NumberPicker.access$1402(NumberPicker.this, false);
        invalidate(0, mBottomSelectionDividerBottom, getRight(), getBottom());
      }
      NumberPicker.access$1602(NumberPicker.this, false);
      if (mDecrementVirtualButtonPressed) {
        invalidate(0, 0, getRight(), mTopSelectionDividerTop);
      }
    }
    
    public void run()
    {
      switch (mMode)
      {
      default: 
        return;
      case 1: 
        switch (mManagedButton)
        {
        default: 
          return;
        case 1: 
          NumberPicker.access$1402(NumberPicker.this, true);
          invalidate(0, mBottomSelectionDividerBottom, getRight(), getBottom());
          return;
        }
        NumberPicker.access$1602(NumberPicker.this, true);
        invalidate(0, 0, getRight(), mTopSelectionDividerTop);
        return;
      }
      switch (mManagedButton)
      {
      default: 
        return;
      case 1: 
        if (!mIncrementVirtualButtonPressed) {
          postDelayed(this, ViewConfiguration.getPressedStateDuration());
        }
        NumberPicker.access$1480(NumberPicker.this, 1);
        invalidate(0, mBottomSelectionDividerBottom, getRight(), getBottom());
        return;
      }
      if (!mDecrementVirtualButtonPressed) {
        postDelayed(this, ViewConfiguration.getPressedStateDuration());
      }
      NumberPicker.access$1680(NumberPicker.this, 1);
      invalidate(0, 0, getRight(), mTopSelectionDividerTop);
    }
  }
  
  class SetSelectionCommand
    implements Runnable
  {
    private int mSelectionEnd;
    private int mSelectionStart;
    
    SetSelectionCommand() {}
    
    public void run()
    {
      mInputText.setSelection(mSelectionStart, mSelectionEnd);
    }
  }
  
  class SupportAccessibilityNodeProvider
  {
    NumberPicker.AccessibilityNodeProviderImpl mProvider;
    
    private SupportAccessibilityNodeProvider()
    {
      if (Build.VERSION.SDK_INT >= 16) {
        mProvider = new NumberPicker.AccessibilityNodeProviderImpl(NumberPicker.this);
      }
    }
    
    public boolean performAction(int paramInt1, int paramInt2, Bundle paramBundle)
    {
      if (mProvider != null) {
        return mProvider.performAction(paramInt1, paramInt2, paramBundle);
      }
      return false;
    }
    
    public void sendAccessibilityEventForVirtualView(int paramInt1, int paramInt2)
    {
      if (mProvider != null) {
        mProvider.sendAccessibilityEventForVirtualView(paramInt1, paramInt2);
      }
    }
  }
  
  private static class TwoDigitFormatter
    implements NumberPicker.Formatter
  {
    final Object[] mArgs = new Object[1];
    final StringBuilder mBuilder = new StringBuilder();
    Formatter mFmt;
    char mZeroDigit;
    
    TwoDigitFormatter()
    {
      init(Locale.getDefault());
    }
    
    private Formatter createFormatter(Locale paramLocale)
    {
      return new Formatter(mBuilder, paramLocale);
    }
    
    private static char getZeroDigit(Locale paramLocale)
    {
      return new DecimalFormatSymbols(paramLocale).getZeroDigit();
    }
    
    private void init(Locale paramLocale)
    {
      mFmt = createFormatter(paramLocale);
      mZeroDigit = getZeroDigit(paramLocale);
    }
    
    public String format(int paramInt)
    {
      Locale localLocale = Locale.getDefault();
      if (mZeroDigit != getZeroDigit(localLocale)) {
        init(localLocale);
      }
      mArgs[0] = Integer.valueOf(paramInt);
      mBuilder.delete(0, mBuilder.length());
      mFmt.format("%02d", mArgs);
      return mFmt.toString();
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */