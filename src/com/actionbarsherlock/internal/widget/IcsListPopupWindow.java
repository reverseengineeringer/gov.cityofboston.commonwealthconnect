package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.ContextThemeWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AbsListView.LayoutParams;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import com.actionbarsherlock.R.attr;

public class IcsListPopupWindow
{
  private static final int EXPAND_LIST_TIMEOUT = 250;
  public static final int POSITION_PROMPT_ABOVE = 0;
  public static final int POSITION_PROMPT_BELOW = 1;
  private ListAdapter mAdapter;
  private Context mContext;
  private View mDropDownAnchorView;
  private int mDropDownHeight = -2;
  private int mDropDownHorizontalOffset;
  private DropDownListView mDropDownList;
  private Drawable mDropDownListHighlight;
  private int mDropDownVerticalOffset;
  private boolean mDropDownVerticalOffsetSet;
  private int mDropDownWidth = -2;
  private Handler mHandler = new Handler();
  private final ListSelectorHider mHideSelector = new ListSelectorHider(null);
  private AdapterView.OnItemClickListener mItemClickListener;
  private AdapterView.OnItemSelectedListener mItemSelectedListener;
  private int mListItemExpandMaximum = Integer.MAX_VALUE;
  private boolean mModal;
  private DataSetObserver mObserver;
  private final PopupWindowCompat mPopup;
  private int mPromptPosition = 0;
  private View mPromptView;
  private final ResizePopupRunnable mResizePopupRunnable = new ResizePopupRunnable(null);
  private final PopupScrollListener mScrollListener = new PopupScrollListener(null);
  private Rect mTempRect = new Rect();
  private final PopupTouchInterceptor mTouchInterceptor = new PopupTouchInterceptor(null);
  
  public IcsListPopupWindow(Context paramContext)
  {
    this(paramContext, null, R.attr.listPopupWindowStyle);
  }
  
  public IcsListPopupWindow(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    mContext = paramContext;
    mPopup = new PopupWindowCompat(paramContext, paramAttributeSet, paramInt);
    mPopup.setInputMethodMode(1);
  }
  
  public IcsListPopupWindow(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    mContext = paramContext;
    if (Build.VERSION.SDK_INT < 11) {}
    for (mPopup = new PopupWindowCompat(new ContextThemeWrapper(paramContext, paramInt2), paramAttributeSet, paramInt1);; mPopup = new PopupWindowCompat(paramContext, paramAttributeSet, paramInt1, paramInt2))
    {
      mPopup.setInputMethodMode(1);
      return;
    }
  }
  
  private int buildDropDown()
  {
    int j = 0;
    int i = 0;
    Object localObject3;
    Object localObject2;
    View localView;
    Object localObject1;
    if (mDropDownList == null)
    {
      localObject3 = mContext;
      if (!mModal)
      {
        bool = true;
        mDropDownList = new DropDownListView((Context)localObject3, bool);
        if (mDropDownListHighlight != null) {
          mDropDownList.setSelector(mDropDownListHighlight);
        }
        mDropDownList.setAdapter(mAdapter);
        mDropDownList.setOnItemClickListener(mItemClickListener);
        mDropDownList.setFocusable(true);
        mDropDownList.setFocusableInTouchMode(true);
        mDropDownList.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
        {
          public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            if (paramAnonymousInt != -1)
            {
              paramAnonymousAdapterView = mDropDownList;
              if (paramAnonymousAdapterView != null) {
                IcsListPopupWindow.DropDownListView.access$502(paramAnonymousAdapterView, false);
              }
            }
          }
          
          public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
        });
        mDropDownList.setOnScrollListener(mScrollListener);
        if (mItemSelectedListener != null) {
          mDropDownList.setOnItemSelectedListener(mItemSelectedListener);
        }
        localObject2 = mDropDownList;
        localView = mPromptView;
        localObject1 = localObject2;
        if (localView != null)
        {
          localObject1 = new LinearLayout((Context)localObject3);
          ((LinearLayout)localObject1).setOrientation(1);
          localObject3 = new LinearLayout.LayoutParams(-1, 0, 1.0F);
        }
        switch (mPromptPosition)
        {
        default: 
          label220:
          localView.measure(View.MeasureSpec.makeMeasureSpec(mDropDownWidth, Integer.MIN_VALUE), 0);
          localObject2 = (LinearLayout.LayoutParams)localView.getLayoutParams();
          i = localView.getMeasuredHeight() + topMargin + bottomMargin;
          mPopup.setContentView((View)localObject1);
          label272:
          j = 0;
          localObject1 = mPopup.getBackground();
          if (localObject1 != null)
          {
            ((Drawable)localObject1).getPadding(mTempRect);
            k = mTempRect.top + mTempRect.bottom;
            j = k;
            if (!mDropDownVerticalOffsetSet)
            {
              mDropDownVerticalOffset = (-mTempRect.top);
              j = k;
            }
          }
          if (mPopup.getInputMethodMode() != 2) {
            break;
          }
        }
      }
    }
    for (boolean bool = true;; bool = false)
    {
      k = getMaxAvailableHeight(mDropDownAnchorView, mDropDownVerticalOffset, bool);
      if (mDropDownHeight != -1) {
        break label484;
      }
      return k + j;
      bool = false;
      break;
      ((LinearLayout)localObject1).addView((View)localObject2, (ViewGroup.LayoutParams)localObject3);
      ((LinearLayout)localObject1).addView(localView);
      break label220;
      ((LinearLayout)localObject1).addView(localView);
      ((LinearLayout)localObject1).addView((View)localObject2, (ViewGroup.LayoutParams)localObject3);
      break label220;
      localObject1 = (ViewGroup)mPopup.getContentView();
      localObject1 = mPromptView;
      i = j;
      if (localObject1 == null) {
        break label272;
      }
      localObject2 = (LinearLayout.LayoutParams)((View)localObject1).getLayoutParams();
      i = ((View)localObject1).getMeasuredHeight() + topMargin + bottomMargin;
      break label272;
    }
    label484:
    int m = measureHeightOfChildren(0, 0, -1, k - i, -1);
    int k = i;
    if (m > 0) {
      k = i + j;
    }
    return m + k;
  }
  
  private int getMaxAvailableHeight(View paramView, int paramInt, boolean paramBoolean)
  {
    Rect localRect = new Rect();
    paramView.getWindowVisibleDisplayFrame(localRect);
    int[] arrayOfInt = new int[2];
    paramView.getLocationOnScreen(arrayOfInt);
    int i = bottom;
    if (paramBoolean) {
      i = getContextgetResourcesgetDisplayMetricsheightPixels;
    }
    i = Math.max(i - (arrayOfInt[1] + paramView.getHeight()) - paramInt, arrayOfInt[1] - top + paramInt);
    paramInt = i;
    if (mPopup.getBackground() != null)
    {
      mPopup.getBackground().getPadding(mTempRect);
      paramInt = i - (mTempRect.top + mTempRect.bottom);
    }
    return paramInt;
  }
  
  private boolean isInputMethodNotNeeded()
  {
    return mPopup.getInputMethodMode() == 2;
  }
  
  private int measureHeightOfChildren(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    Object localObject = mAdapter;
    if (localObject == null)
    {
      paramInt2 = mDropDownList.getListPaddingTop() + mDropDownList.getListPaddingBottom();
      return paramInt2;
    }
    int m = mDropDownList.getListPaddingTop() + mDropDownList.getListPaddingBottom();
    int i;
    label75:
    int n;
    int j;
    int k;
    if ((mDropDownList.getDividerHeight() > 0) && (mDropDownList.getDivider() != null))
    {
      i = mDropDownList.getDividerHeight();
      n = 0;
      j = paramInt3;
      if (paramInt3 == -1) {
        j = ((ListAdapter)localObject).getCount() - 1;
      }
      k = paramInt2;
      paramInt3 = m;
    }
    for (paramInt2 = n;; paramInt2 = m)
    {
      if (k > j) {
        return paramInt3;
      }
      localObject = mAdapter.getView(k, null, mDropDownList);
      if (mDropDownList.getCacheColorHint() != 0) {
        ((View)localObject).setDrawingCacheBackgroundColor(mDropDownList.getCacheColorHint());
      }
      measureScrapChild((View)localObject, k, paramInt1);
      m = paramInt3;
      if (k > 0) {
        m = paramInt3 + i;
      }
      paramInt3 = m + ((View)localObject).getMeasuredHeight();
      if (paramInt3 >= paramInt4)
      {
        if ((paramInt5 >= 0) && (k > paramInt5) && (paramInt2 > 0) && (paramInt3 != paramInt4)) {
          break;
        }
        return paramInt4;
        i = 0;
        break label75;
      }
      m = paramInt2;
      if (paramInt5 >= 0)
      {
        m = paramInt2;
        if (k >= paramInt5) {
          m = paramInt3;
        }
      }
      k += 1;
    }
    return paramInt3;
  }
  
  private void measureScrapChild(View paramView, int paramInt1, int paramInt2)
  {
    AbsListView.LayoutParams localLayoutParams2 = (AbsListView.LayoutParams)paramView.getLayoutParams();
    AbsListView.LayoutParams localLayoutParams1 = localLayoutParams2;
    if (localLayoutParams2 == null)
    {
      localLayoutParams1 = new AbsListView.LayoutParams(-1, -2, 0);
      paramView.setLayoutParams(localLayoutParams1);
    }
    paramInt2 = ViewGroup.getChildMeasureSpec(paramInt2, mDropDownList.getPaddingLeft() + mDropDownList.getPaddingRight(), width);
    paramInt1 = height;
    if (paramInt1 > 0) {}
    for (paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824);; paramInt1 = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(paramInt2, paramInt1);
      return;
    }
  }
  
  public void clearListSelection()
  {
    DropDownListView localDropDownListView = mDropDownList;
    if (localDropDownListView != null)
    {
      DropDownListView.access$502(localDropDownListView, true);
      localDropDownListView.requestLayout();
    }
  }
  
  public void dismiss()
  {
    mPopup.dismiss();
    if (mPromptView != null)
    {
      ViewParent localViewParent = mPromptView.getParent();
      if ((localViewParent instanceof ViewGroup)) {
        ((ViewGroup)localViewParent).removeView(mPromptView);
      }
    }
    mPopup.setContentView(null);
    mDropDownList = null;
    mHandler.removeCallbacks(mResizePopupRunnable);
  }
  
  public ListView getListView()
  {
    return mDropDownList;
  }
  
  public boolean isShowing()
  {
    return mPopup.isShowing();
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (mObserver == null) {
      mObserver = new PopupDataSetObserver(null);
    }
    for (;;)
    {
      mAdapter = paramListAdapter;
      if (mAdapter != null) {
        paramListAdapter.registerDataSetObserver(mObserver);
      }
      if (mDropDownList != null) {
        mDropDownList.setAdapter(mAdapter);
      }
      return;
      if (mAdapter != null) {
        mAdapter.unregisterDataSetObserver(mObserver);
      }
    }
  }
  
  public void setAnchorView(View paramView)
  {
    mDropDownAnchorView = paramView;
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    mPopup.setBackgroundDrawable(paramDrawable);
  }
  
  public void setContentWidth(int paramInt)
  {
    Drawable localDrawable = mPopup.getBackground();
    if (localDrawable != null)
    {
      localDrawable.getPadding(mTempRect);
      mDropDownWidth = (mTempRect.left + mTempRect.right + paramInt);
      return;
    }
    mDropDownWidth = paramInt;
  }
  
  public void setHorizontalOffset(int paramInt)
  {
    mDropDownHorizontalOffset = paramInt;
  }
  
  public void setInputMethodMode(int paramInt)
  {
    mPopup.setInputMethodMode(paramInt);
  }
  
  public void setModal(boolean paramBoolean)
  {
    mModal = true;
    mPopup.setFocusable(paramBoolean);
  }
  
  public void setOnDismissListener(PopupWindow.OnDismissListener paramOnDismissListener)
  {
    mPopup.setOnDismissListener(paramOnDismissListener);
  }
  
  public void setOnItemClickListener(AdapterView.OnItemClickListener paramOnItemClickListener)
  {
    mItemClickListener = paramOnItemClickListener;
  }
  
  public void setPromptPosition(int paramInt)
  {
    mPromptPosition = paramInt;
  }
  
  public void setSelection(int paramInt)
  {
    DropDownListView localDropDownListView = mDropDownList;
    if ((isShowing()) && (localDropDownListView != null))
    {
      DropDownListView.access$502(localDropDownListView, false);
      localDropDownListView.setSelection(paramInt);
      if (localDropDownListView.getChoiceMode() != 0) {
        localDropDownListView.setItemChecked(paramInt, true);
      }
    }
  }
  
  public void setVerticalOffset(int paramInt)
  {
    mDropDownVerticalOffset = paramInt;
    mDropDownVerticalOffsetSet = true;
  }
  
  public void show()
  {
    int k = 0;
    int m = -1;
    int j = buildDropDown();
    int i = 0;
    int n = 0;
    boolean bool = isInputMethodNotNeeded();
    if (mPopup.isShowing())
    {
      label54:
      PopupWindowCompat localPopupWindowCompat;
      if (mDropDownWidth == -1)
      {
        i = -1;
        if (mDropDownHeight != -1) {
          break label177;
        }
        if (!bool) {
          break label141;
        }
        if (!bool) {
          break label151;
        }
        localPopupWindowCompat = mPopup;
        if (mDropDownWidth != -1) {
          break label146;
        }
        k = m;
        label76:
        localPopupWindowCompat.setWindowLayoutMode(k, 0);
      }
      for (;;)
      {
        mPopup.setOutsideTouchable(true);
        mPopup.update(mDropDownAnchorView, mDropDownHorizontalOffset, mDropDownVerticalOffset, i, j);
        return;
        if (mDropDownWidth == -2)
        {
          i = mDropDownAnchorView.getWidth();
          break;
        }
        i = mDropDownWidth;
        break;
        label141:
        j = -1;
        break label54;
        label146:
        k = 0;
        break label76;
        label151:
        localPopupWindowCompat = mPopup;
        if (mDropDownWidth == -1) {
          k = -1;
        }
        localPopupWindowCompat.setWindowLayoutMode(k, -1);
        continue;
        label177:
        if (mDropDownHeight != -2) {
          j = mDropDownHeight;
        }
      }
    }
    if (mDropDownWidth == -1)
    {
      i = -1;
      label207:
      if (mDropDownHeight != -1) {
        break label353;
      }
      j = -1;
    }
    for (;;)
    {
      mPopup.setWindowLayoutMode(i, j);
      mPopup.setOutsideTouchable(true);
      mPopup.setTouchInterceptor(mTouchInterceptor);
      mPopup.showAsDropDown(mDropDownAnchorView, mDropDownHorizontalOffset, mDropDownVerticalOffset);
      mDropDownList.setSelection(-1);
      if ((!mModal) || (mDropDownList.isInTouchMode())) {
        clearListSelection();
      }
      if (mModal) {
        break;
      }
      mHandler.post(mHideSelector);
      return;
      if (mDropDownWidth == -2)
      {
        mPopup.setWidth(mDropDownAnchorView.getWidth());
        break label207;
      }
      mPopup.setWidth(mDropDownWidth);
      break label207;
      label353:
      if (mDropDownHeight == -2)
      {
        mPopup.setHeight(j);
        j = n;
      }
      else
      {
        mPopup.setHeight(mDropDownHeight);
        j = n;
      }
    }
  }
  
  private static class DropDownListView
    extends ListView
  {
    private boolean mHijackFocus;
    private boolean mListSelectionHidden;
    
    public DropDownListView(Context paramContext, boolean paramBoolean)
    {
      super(null, R.attr.dropDownListViewStyle);
      mHijackFocus = paramBoolean;
      setCacheColorHint(0);
    }
    
    public boolean hasFocus()
    {
      return (mHijackFocus) || (super.hasFocus());
    }
    
    public boolean hasWindowFocus()
    {
      return (mHijackFocus) || (super.hasWindowFocus());
    }
    
    public boolean isFocused()
    {
      return (mHijackFocus) || (super.isFocused());
    }
    
    public boolean isInTouchMode()
    {
      return ((mHijackFocus) && (mListSelectionHidden)) || (super.isInTouchMode());
    }
  }
  
  private class ListSelectorHider
    implements Runnable
  {
    private ListSelectorHider() {}
    
    public void run()
    {
      clearListSelection();
    }
  }
  
  private class PopupDataSetObserver
    extends DataSetObserver
  {
    private PopupDataSetObserver() {}
    
    public void onChanged()
    {
      if (isShowing()) {
        show();
      }
    }
    
    public void onInvalidated()
    {
      dismiss();
    }
  }
  
  private class PopupScrollListener
    implements AbsListView.OnScrollListener
  {
    private PopupScrollListener() {}
    
    public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
    
    public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
    {
      if ((paramInt == 1) && (!IcsListPopupWindow.this.isInputMethodNotNeeded()) && (mPopup.getContentView() != null))
      {
        mHandler.removeCallbacks(mResizePopupRunnable);
        mResizePopupRunnable.run();
      }
    }
  }
  
  private class PopupTouchInterceptor
    implements View.OnTouchListener
  {
    private PopupTouchInterceptor() {}
    
    public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
    {
      int i = paramMotionEvent.getAction();
      int j = (int)paramMotionEvent.getX();
      int k = (int)paramMotionEvent.getY();
      if ((i == 0) && (mPopup != null) && (mPopup.isShowing()) && (j >= 0) && (j < mPopup.getWidth()) && (k >= 0) && (k < mPopup.getHeight())) {
        mHandler.postDelayed(mResizePopupRunnable, 250L);
      }
      for (;;)
      {
        return false;
        if (i == 1) {
          mHandler.removeCallbacks(mResizePopupRunnable);
        }
      }
    }
  }
  
  private class ResizePopupRunnable
    implements Runnable
  {
    private ResizePopupRunnable() {}
    
    public void run()
    {
      if ((mDropDownList != null) && (mDropDownList.getCount() > mDropDownList.getChildCount()) && (mDropDownList.getChildCount() <= mListItemExpandMaximum))
      {
        mPopup.setInputMethodMode(2);
        show();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.IcsListPopupWindow
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */