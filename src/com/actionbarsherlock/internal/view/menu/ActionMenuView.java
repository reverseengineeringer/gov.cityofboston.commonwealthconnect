package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.LinearLayout.LayoutParams;
import com.actionbarsherlock.internal.widget.IcsLinearLayout;

public class ActionMenuView
  extends IcsLinearLayout
  implements MenuBuilder.ItemInvoker, MenuView
{
  static final int GENERATED_ITEM_PADDING = 4;
  private static final boolean IS_FROYO;
  static final int MIN_CELL_SIZE = 56;
  private boolean mFirst = true;
  private boolean mFormatItems;
  private int mFormatItemsWidth;
  private int mGeneratedItemPadding;
  private MenuBuilder mMenu;
  private int mMinCellSize;
  private ActionMenuPresenter mPresenter;
  private boolean mReserveOverflow;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 8) {}
    for (boolean bool = true;; bool = false)
    {
      IS_FROYO = bool;
      return;
    }
  }
  
  public ActionMenuView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionMenuView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setBaselineAligned(false);
    float f = getResourcesgetDisplayMetricsdensity;
    mMinCellSize = ((int)(56.0F * f));
    mGeneratedItemPadding = ((int)(4.0F * f));
  }
  
  static int measureChildForCells(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    paramInt4 = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(paramInt3) - paramInt4, View.MeasureSpec.getMode(paramInt3));
    paramInt3 = 0;
    if (paramInt2 > 0)
    {
      paramView.measure(View.MeasureSpec.makeMeasureSpec(paramInt1 * paramInt2, Integer.MIN_VALUE), paramInt4);
      int i = paramView.getMeasuredWidth();
      paramInt2 = i / paramInt1;
      paramInt3 = paramInt2;
      if (i % paramInt1 != 0) {
        paramInt3 = paramInt2 + 1;
      }
    }
    ActionMenuItemView localActionMenuItemView;
    if ((paramView instanceof ActionMenuItemView))
    {
      localActionMenuItemView = (ActionMenuItemView)paramView;
      if ((isOverflowButton) || (localActionMenuItemView == null) || (!localActionMenuItemView.hasText())) {
        break label141;
      }
    }
    label141:
    for (boolean bool = true;; bool = false)
    {
      expandable = bool;
      cellsUsed = paramInt3;
      paramView.measure(View.MeasureSpec.makeMeasureSpec(paramInt3 * paramInt1, 1073741824), paramInt4);
      return paramInt3;
      localActionMenuItemView = null;
      break;
    }
  }
  
  private void onMeasureExactFormat(int paramInt1, int paramInt2)
  {
    int i9 = View.MeasureSpec.getMode(paramInt2);
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    int i7 = View.MeasureSpec.getSize(paramInt2);
    int i = getPaddingLeft();
    int j = getPaddingRight();
    int i11 = getPaddingTop() + getPaddingBottom();
    int i10 = paramInt1 - (i + j);
    paramInt1 = i10 / mMinCellSize;
    i = mMinCellSize;
    if (paramInt1 == 0)
    {
      setMeasuredDimension(i10, 0);
      return;
    }
    int i12 = mMinCellSize + i10 % i / paramInt1;
    i = 0;
    int m = 0;
    int k = 0;
    int n = 0;
    j = 0;
    long l1 = 0L;
    int i13 = getChildCount();
    int i1 = 0;
    Object localObject;
    long l2;
    int i2;
    int i3;
    int i4;
    LayoutParams localLayoutParams;
    label272:
    int i5;
    int i6;
    while (i1 < i13)
    {
      localObject = getChildAt(i1);
      if (((View)localObject).getVisibility() == 8)
      {
        l2 = l1;
        i2 = m;
        i3 = j;
        i1 += 1;
        j = i3;
        m = i2;
        l1 = l2;
      }
      else
      {
        boolean bool = localObject instanceof ActionMenuItemView;
        i4 = n + 1;
        if (bool) {
          ((View)localObject).setPadding(mGeneratedItemPadding, 0, mGeneratedItemPadding, 0);
        }
        localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
        expanded = false;
        extraPixels = 0;
        cellsUsed = 0;
        expandable = false;
        leftMargin = 0;
        rightMargin = 0;
        if ((bool) && (((ActionMenuItemView)localObject).hasText()))
        {
          bool = true;
          preventEdgeOffset = bool;
          if (!isOverflowButton) {
            break label435;
          }
        }
        label435:
        for (n = 1;; n = paramInt1)
        {
          int i14 = measureChildForCells((View)localObject, i12, n, paramInt2, i11);
          i5 = Math.max(m, i14);
          m = k;
          if (expandable) {
            m = k + 1;
          }
          if (isOverflowButton) {
            j = 1;
          }
          i6 = paramInt1 - i14;
          int i8 = Math.max(i, ((View)localObject).getMeasuredHeight());
          paramInt1 = i6;
          k = m;
          i3 = j;
          i2 = i5;
          i = i8;
          l2 = l1;
          n = i4;
          if (i14 != 1) {
            break;
          }
          l2 = l1 | 1 << i1;
          paramInt1 = i6;
          k = m;
          i3 = j;
          i2 = i5;
          i = i8;
          n = i4;
          break;
          bool = false;
          break label272;
        }
      }
    }
    long l3;
    if ((j != 0) && (n == 2))
    {
      i1 = 1;
      paramInt2 = 0;
      i2 = paramInt1;
      l2 = l1;
      if (k <= 0) {
        break label647;
      }
      l2 = l1;
      if (i2 <= 0) {
        break label647;
      }
      i3 = Integer.MAX_VALUE;
      l3 = 0L;
      i6 = 0;
      i4 = 0;
      label491:
      if (i4 >= i13) {
        break label629;
      }
      localObject = (LayoutParams)getChildAt(i4).getLayoutParams();
      if (expandable) {
        break label557;
      }
      l2 = l3;
      paramInt1 = i6;
      i5 = i3;
    }
    for (;;)
    {
      i4 += 1;
      i3 = i5;
      i6 = paramInt1;
      l3 = l2;
      break label491;
      i1 = 0;
      break;
      label557:
      if (cellsUsed < i3)
      {
        i5 = cellsUsed;
        l2 = 1 << i4;
        paramInt1 = 1;
      }
      else
      {
        i5 = i3;
        paramInt1 = i6;
        l2 = l3;
        if (cellsUsed == i3)
        {
          l2 = l3 | 1 << i4;
          paramInt1 = i6 + 1;
          i5 = i3;
        }
      }
    }
    label629:
    l1 |= l3;
    if (i6 > i2)
    {
      l2 = l1;
      label647:
      if ((j != 0) || (n != 1)) {
        break label1010;
      }
      paramInt1 = 1;
      label660:
      j = paramInt2;
      if (i2 <= 0) {
        break label1166;
      }
      j = paramInt2;
      if (l2 == 0L) {
        break label1166;
      }
      if ((i2 >= n - 1) && (paramInt1 == 0))
      {
        j = paramInt2;
        if (m <= 1) {
          break label1166;
        }
      }
      float f3 = Long.bitCount(l2);
      float f2 = f3;
      if (paramInt1 == 0)
      {
        float f1 = f3;
        if ((1L & l2) != 0L)
        {
          f1 = f3;
          if (!getChildAt0getLayoutParamspreventEdgeOffset) {
            f1 = f3 - 0.5F;
          }
        }
        f2 = f1;
        if ((1 << i13 - 1 & l2) != 0L)
        {
          f2 = f1;
          if (!getChildAt1getLayoutParamspreventEdgeOffset) {
            f2 = f1 - 0.5F;
          }
        }
      }
      if (f2 <= 0.0F) {
        break label1015;
      }
      j = (int)(i2 * i12 / f2);
      label820:
      k = 0;
      label823:
      if (k >= i13) {
        break label1163;
      }
      if ((1 << k & l2) != 0L) {
        break label1021;
      }
      paramInt1 = paramInt2;
    }
    for (;;)
    {
      k += 1;
      paramInt2 = paramInt1;
      break label823;
      paramInt1 = 0;
      if (paramInt1 < i13)
      {
        localObject = getChildAt(paramInt1);
        localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
        if ((1 << paramInt1 & l3) == 0L)
        {
          paramInt2 = i2;
          l2 = l1;
          if (cellsUsed == i3 + 1)
          {
            l2 = l1 | 1 << paramInt1;
            paramInt2 = i2;
          }
        }
        for (;;)
        {
          paramInt1 += 1;
          i2 = paramInt2;
          l1 = l2;
          break;
          if ((i1 != 0) && (preventEdgeOffset) && (i2 == 1)) {
            ((View)localObject).setPadding(mGeneratedItemPadding + i12, 0, mGeneratedItemPadding, 0);
          }
          cellsUsed += 1;
          expanded = true;
          paramInt2 = i2 - 1;
          l2 = l1;
        }
      }
      paramInt2 = 1;
      break;
      label1010:
      paramInt1 = 0;
      break label660;
      label1015:
      j = 0;
      break label820;
      label1021:
      localObject = getChildAt(k);
      localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
      if ((localObject instanceof ActionMenuItemView))
      {
        extraPixels = j;
        expanded = true;
        if ((k == 0) && (!preventEdgeOffset)) {
          leftMargin = (-j / 2);
        }
        paramInt1 = 1;
      }
      else if (isOverflowButton)
      {
        extraPixels = j;
        expanded = true;
        rightMargin = (-j / 2);
        paramInt1 = 1;
      }
      else
      {
        if (k != 0) {
          leftMargin = (j / 2);
        }
        paramInt1 = paramInt2;
        if (k != i13 - 1)
        {
          rightMargin = (j / 2);
          paramInt1 = paramInt2;
        }
      }
    }
    label1163:
    j = paramInt2;
    label1166:
    if (j != 0)
    {
      paramInt2 = View.MeasureSpec.makeMeasureSpec(i7 - i11, i9);
      paramInt1 = 0;
      if (paramInt1 < i13)
      {
        localObject = getChildAt(paramInt1);
        localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
        if (!expanded) {}
        for (;;)
        {
          paramInt1 += 1;
          break;
          ((View)localObject).measure(View.MeasureSpec.makeMeasureSpec(cellsUsed * i12 + extraPixels, 1073741824), paramInt2);
        }
      }
    }
    paramInt1 = i7;
    if (i9 != 1073741824) {
      paramInt1 = i;
    }
    setMeasuredDimension(i10, paramInt1);
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return (paramLayoutParams != null) && ((paramLayoutParams instanceof LayoutParams));
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    return false;
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    LayoutParams localLayoutParams = new LayoutParams(-2, -2);
    gravity = 16;
    return localLayoutParams;
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof LayoutParams))
    {
      paramLayoutParams = new LayoutParams((LayoutParams)paramLayoutParams);
      if (gravity <= 0) {
        gravity = 16;
      }
      return paramLayoutParams;
    }
    return generateDefaultLayoutParams();
  }
  
  public LayoutParams generateOverflowButtonLayoutParams()
  {
    LayoutParams localLayoutParams = generateDefaultLayoutParams();
    isOverflowButton = true;
    return localLayoutParams;
  }
  
  public int getWindowAnimations()
  {
    return 0;
  }
  
  protected boolean hasDividerBeforeChildAt(int paramInt)
  {
    boolean bool2;
    if (paramInt == 0) {
      bool2 = false;
    }
    View localView2;
    boolean bool1;
    do
    {
      do
      {
        return bool2;
        View localView1 = getChildAt(paramInt - 1);
        localView2 = getChildAt(paramInt);
        bool2 = false;
        bool1 = bool2;
        if (paramInt < getChildCount())
        {
          bool1 = bool2;
          if ((localView1 instanceof ActionMenuChildView)) {
            bool1 = false | ((ActionMenuChildView)localView1).needsDividerAfter();
          }
        }
        bool2 = bool1;
      } while (paramInt <= 0);
      bool2 = bool1;
    } while (!(localView2 instanceof ActionMenuChildView));
    return bool1 | ((ActionMenuChildView)localView2).needsDividerBefore();
  }
  
  public void initialize(MenuBuilder paramMenuBuilder)
  {
    mMenu = paramMenuBuilder;
  }
  
  public boolean invokeItem(MenuItemImpl paramMenuItemImpl)
  {
    return mMenu.performItemAction(paramMenuItemImpl, 0);
  }
  
  public boolean isExpandedFormat()
  {
    return mFormatItems;
  }
  
  public boolean isOverflowReserved()
  {
    return mReserveOverflow;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (IS_FROYO) {
      super.onConfigurationChanged(paramConfiguration);
    }
    mPresenter.updateMenuView(false);
    if ((mPresenter != null) && (mPresenter.isOverflowMenuShowing()))
    {
      mPresenter.hideOverflowMenu();
      mPresenter.showOverflowMenu();
    }
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mPresenter.dismissPopupMenus();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if ((!IS_FROYO) && (mFirst))
    {
      mFirst = false;
      requestLayout();
      return;
    }
    super.onDraw(paramCanvas);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (!mFormatItems)
    {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
    }
    int n = getChildCount();
    int m = (paramInt2 + paramInt4) / 2;
    paramInt4 = 0;
    paramInt2 = paramInt3 - paramInt1 - getPaddingRight() - getPaddingLeft();
    int j = 0;
    int i = 0;
    View localView;
    LayoutParams localLayoutParams;
    if (i < n)
    {
      localView = getChildAt(i);
      if (localView.getVisibility() == 8) {}
      for (;;)
      {
        i += 1;
        break;
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (isOverflowButton)
        {
          int k = localView.getMeasuredWidth();
          j = k;
          if (hasDividerBeforeChildAt(i)) {
            j = k + 0;
          }
          k = localView.getMeasuredHeight();
          int i1 = getWidth() - getPaddingRight() - rightMargin;
          int i2 = m - k / 2;
          localView.layout(i1 - j, i2, i1, i2 + k);
          paramInt2 -= j;
          j = 1;
        }
        else
        {
          paramInt2 -= localView.getMeasuredWidth() + leftMargin + rightMargin;
          paramInt4 += 1;
        }
      }
    }
    if ((n == 1) && (j == 0))
    {
      localView = getChildAt(0);
      paramInt2 = localView.getMeasuredWidth();
      paramInt4 = localView.getMeasuredHeight();
      paramInt1 = (paramInt3 - paramInt1) / 2 - paramInt2 / 2;
      paramInt3 = m - paramInt4 / 2;
      localView.layout(paramInt1, paramInt3, paramInt1 + paramInt2, paramInt3 + paramInt4);
      return;
    }
    if (j != 0)
    {
      paramInt1 = 0;
      label302:
      paramInt1 = paramInt4 - paramInt1;
      if (paramInt1 <= 0) {
        break label391;
      }
      paramInt1 = paramInt2 / paramInt1;
      label315:
      paramInt4 = Math.max(0, paramInt1);
      paramInt2 = getPaddingLeft();
      paramInt1 = 0;
      label329:
      if (paramInt1 < n)
      {
        localView = getChildAt(paramInt1);
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        paramInt3 = paramInt2;
        if (localView.getVisibility() != 8) {
          if (!isOverflowButton) {
            break label396;
          }
        }
      }
    }
    for (paramInt3 = paramInt2;; paramInt3 = paramInt2 + (rightMargin + paramInt3 + paramInt4))
    {
      paramInt1 += 1;
      paramInt2 = paramInt3;
      break label329;
      break;
      paramInt1 = 1;
      break label302;
      label391:
      paramInt1 = 0;
      break label315;
      label396:
      paramInt2 += leftMargin;
      paramInt3 = localView.getMeasuredWidth();
      i = localView.getMeasuredHeight();
      j = m - i / 2;
      localView.layout(paramInt2, j, paramInt2 + paramInt3, j + i);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    boolean bool2 = mFormatItems;
    if (View.MeasureSpec.getMode(paramInt1) == 1073741824) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      mFormatItems = bool1;
      if (bool2 != mFormatItems) {
        mFormatItemsWidth = 0;
      }
      int i = View.MeasureSpec.getMode(paramInt1);
      if ((mFormatItems) && (mMenu != null) && (i != mFormatItemsWidth))
      {
        mFormatItemsWidth = i;
        mMenu.onItemsChanged(true);
      }
      if (!mFormatItems) {
        break;
      }
      onMeasureExactFormat(paramInt1, paramInt2);
      return;
    }
    super.onMeasure(paramInt1, paramInt2);
  }
  
  public void setOverflowReserved(boolean paramBoolean)
  {
    mReserveOverflow = paramBoolean;
  }
  
  public void setPresenter(ActionMenuPresenter paramActionMenuPresenter)
  {
    mPresenter = paramActionMenuPresenter;
  }
  
  public static abstract interface ActionMenuChildView
  {
    public abstract boolean needsDividerAfter();
    
    public abstract boolean needsDividerBefore();
  }
  
  public static class LayoutParams
    extends LinearLayout.LayoutParams
  {
    public int cellsUsed;
    public boolean expandable;
    public boolean expanded;
    public int extraPixels;
    public boolean isOverflowButton;
    public boolean preventEdgeOffset;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      isOverflowButton = false;
    }
    
    public LayoutParams(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      super(paramInt2);
      isOverflowButton = paramBoolean;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      isOverflowButton = isOverflowButton;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.view.menu.ActionMenuView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */