package com.viewpagerindicator;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

class IcsLinearLayout
  extends LinearLayout
{
  private static final int[] LL = { 16843049, 16843561, 16843562 };
  private static final int LL_DIVIDER = 0;
  private static final int LL_DIVIDER_PADDING = 2;
  private static final int LL_SHOW_DIVIDER = 1;
  private Drawable mDivider;
  private int mDividerHeight;
  private int mDividerPadding;
  private int mDividerWidth;
  private int mShowDividers;
  
  public IcsLinearLayout(Context paramContext, int paramInt)
  {
    super(paramContext);
    paramContext = paramContext.obtainStyledAttributes(null, LL, paramInt, 0);
    setDividerDrawable(paramContext.getDrawable(0));
    mDividerPadding = paramContext.getDimensionPixelSize(2, 0);
    mShowDividers = paramContext.getInteger(1, 0);
    paramContext.recycle();
  }
  
  private void drawDividersHorizontal(Canvas paramCanvas)
  {
    int j = getChildCount();
    int i = 0;
    View localView;
    while (i < j)
    {
      localView = getChildAt(i);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasDividerBeforeChildAt(i)))
      {
        LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)localView.getLayoutParams();
        drawVerticalDivider(paramCanvas, localView.getLeft() - leftMargin);
      }
      i += 1;
    }
    if (hasDividerBeforeChildAt(j))
    {
      localView = getChildAt(j - 1);
      if (localView != null) {
        break label119;
      }
    }
    label119:
    for (i = getWidth() - getPaddingRight() - mDividerWidth;; i = localView.getRight())
    {
      drawVerticalDivider(paramCanvas, i);
      return;
    }
  }
  
  private void drawDividersVertical(Canvas paramCanvas)
  {
    int j = getChildCount();
    int i = 0;
    View localView;
    while (i < j)
    {
      localView = getChildAt(i);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasDividerBeforeChildAt(i)))
      {
        LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)localView.getLayoutParams();
        drawHorizontalDivider(paramCanvas, localView.getTop() - topMargin);
      }
      i += 1;
    }
    if (hasDividerBeforeChildAt(j))
    {
      localView = getChildAt(j - 1);
      if (localView != null) {
        break label119;
      }
    }
    label119:
    for (i = getHeight() - getPaddingBottom() - mDividerHeight;; i = localView.getBottom())
    {
      drawHorizontalDivider(paramCanvas, i);
      return;
    }
  }
  
  private void drawHorizontalDivider(Canvas paramCanvas, int paramInt)
  {
    mDivider.setBounds(getPaddingLeft() + mDividerPadding, paramInt, getWidth() - getPaddingRight() - mDividerPadding, mDividerHeight + paramInt);
    mDivider.draw(paramCanvas);
  }
  
  private void drawVerticalDivider(Canvas paramCanvas, int paramInt)
  {
    mDivider.setBounds(paramInt, getPaddingTop() + mDividerPadding, mDividerWidth + paramInt, getHeight() - getPaddingBottom() - mDividerPadding);
    mDivider.draw(paramCanvas);
  }
  
  private boolean hasDividerBeforeChildAt(int paramInt)
  {
    if ((paramInt == 0) || (paramInt == getChildCount())) {}
    for (;;)
    {
      return false;
      if ((mShowDividers & 0x2) != 0)
      {
        paramInt -= 1;
        while (paramInt >= 0)
        {
          if (getChildAt(paramInt).getVisibility() != 8) {
            return true;
          }
          paramInt -= 1;
        }
      }
    }
  }
  
  protected void measureChildWithMargins(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = indexOfChild(paramView);
    int j = getOrientation();
    LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)paramView.getLayoutParams();
    if (hasDividerBeforeChildAt(i))
    {
      if (j == 1) {
        topMargin = mDividerHeight;
      }
    }
    else
    {
      int k = getChildCount();
      if ((i == k - 1) && (hasDividerBeforeChildAt(k)))
      {
        if (j != 1) {
          break label109;
        }
        bottomMargin = mDividerHeight;
      }
    }
    for (;;)
    {
      super.measureChildWithMargins(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
      leftMargin = mDividerWidth;
      break;
      label109:
      rightMargin = mDividerWidth;
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (mDivider != null)
    {
      if (getOrientation() != 1) {
        break label26;
      }
      drawDividersVertical(paramCanvas);
    }
    for (;;)
    {
      super.onDraw(paramCanvas);
      return;
      label26:
      drawDividersHorizontal(paramCanvas);
    }
  }
  
  public void setDividerDrawable(Drawable paramDrawable)
  {
    boolean bool = false;
    if (paramDrawable == mDivider) {
      return;
    }
    mDivider = paramDrawable;
    if (paramDrawable != null) {
      mDividerWidth = paramDrawable.getIntrinsicWidth();
    }
    for (mDividerHeight = paramDrawable.getIntrinsicHeight();; mDividerHeight = 0)
    {
      if (paramDrawable == null) {
        bool = true;
      }
      setWillNotDraw(bool);
      requestLayout();
      return;
      mDividerWidth = 0;
    }
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.IcsLinearLayout
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */