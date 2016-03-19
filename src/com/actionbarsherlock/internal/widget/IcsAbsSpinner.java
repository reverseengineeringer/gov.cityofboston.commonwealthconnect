package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.SpinnerAdapter;

public abstract class IcsAbsSpinner
  extends IcsAdapterView<SpinnerAdapter>
{
  private static final boolean IS_HONEYCOMB;
  SpinnerAdapter mAdapter;
  boolean mBlockLayoutRequests;
  private DataSetObserver mDataSetObserver;
  int mHeightMeasureSpec;
  final RecycleBin mRecycler = new RecycleBin();
  int mSelectionBottomPadding = 0;
  int mSelectionLeftPadding = 0;
  int mSelectionRightPadding = 0;
  int mSelectionTopPadding = 0;
  final Rect mSpinnerPadding = new Rect();
  private Rect mTouchFrame;
  int mWidthMeasureSpec;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (boolean bool = true;; bool = false)
    {
      IS_HONEYCOMB = bool;
      return;
    }
  }
  
  public IcsAbsSpinner(Context paramContext)
  {
    super(paramContext);
    initAbsSpinner();
  }
  
  public IcsAbsSpinner(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public IcsAbsSpinner(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initAbsSpinner();
  }
  
  private void initAbsSpinner()
  {
    setFocusable(true);
    setWillNotDraw(false);
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.LayoutParams(-1, -2);
  }
  
  public SpinnerAdapter getAdapter()
  {
    return mAdapter;
  }
  
  int getChildHeight(View paramView)
  {
    return paramView.getMeasuredHeight();
  }
  
  int getChildWidth(View paramView)
  {
    return paramView.getMeasuredWidth();
  }
  
  public int getCount()
  {
    return mItemCount;
  }
  
  public View getSelectedView()
  {
    if ((mItemCount > 0) && (mSelectedPosition >= 0)) {
      return getChildAt(mSelectedPosition - mFirstPosition);
    }
    return null;
  }
  
  abstract void layout(int paramInt, boolean paramBoolean);
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i2 = View.MeasureSpec.getMode(paramInt1);
    int i = getPaddingLeft();
    int m = getPaddingTop();
    int k = getPaddingRight();
    int j = getPaddingBottom();
    Object localObject = mSpinnerPadding;
    if (i > mSelectionLeftPadding)
    {
      left = i;
      localObject = mSpinnerPadding;
      if (m <= mSelectionTopPadding) {
        break label489;
      }
      i = m;
      label67:
      top = i;
      localObject = mSpinnerPadding;
      if (k <= mSelectionRightPadding) {
        break label497;
      }
      i = k;
      label91:
      right = i;
      localObject = mSpinnerPadding;
      if (j <= mSelectionBottomPadding) {
        break label505;
      }
      i = j;
      label115:
      bottom = i;
      if (mDataChanged) {
        handleDataChanged();
      }
      m = 0;
      int n = 0;
      int i1 = 1;
      int i3 = getSelectedItemPosition();
      k = i1;
      j = m;
      i = n;
      if (i3 >= 0)
      {
        k = i1;
        j = m;
        i = n;
        if (mAdapter != null)
        {
          k = i1;
          j = m;
          i = n;
          if (i3 < mAdapter.getCount())
          {
            View localView = mRecycler.get(i3);
            localObject = localView;
            if (localView == null) {
              localObject = mAdapter.getView(i3, null, this);
            }
            if (localObject != null) {
              mRecycler.put(i3, (View)localObject);
            }
            k = i1;
            j = m;
            i = n;
            if (localObject != null)
            {
              if (((View)localObject).getLayoutParams() == null)
              {
                mBlockLayoutRequests = true;
                ((View)localObject).setLayoutParams(generateDefaultLayoutParams());
                mBlockLayoutRequests = false;
              }
              measureChild((View)localObject, paramInt1, paramInt2);
              j = getChildHeight((View)localObject) + mSpinnerPadding.top + mSpinnerPadding.bottom;
              i = getChildWidth((View)localObject) + mSpinnerPadding.left + mSpinnerPadding.right;
              k = 0;
            }
          }
        }
      }
      m = j;
      j = i;
      if (k != 0)
      {
        k = mSpinnerPadding.top + mSpinnerPadding.bottom;
        m = k;
        j = i;
        if (i2 == 0)
        {
          j = mSpinnerPadding.left + mSpinnerPadding.right;
          m = k;
        }
      }
      i = Math.max(m, getSuggestedMinimumHeight());
      j = Math.max(j, getSuggestedMinimumWidth());
      if (!IS_HONEYCOMB) {
        break label513;
      }
      i = resolveSizeAndState(i, paramInt2, 0);
    }
    for (j = resolveSizeAndState(j, paramInt1, 0);; j = resolveSize(j, paramInt1))
    {
      setMeasuredDimension(j, i);
      mHeightMeasureSpec = paramInt2;
      mWidthMeasureSpec = paramInt1;
      return;
      i = mSelectionLeftPadding;
      break;
      label489:
      i = mSelectionTopPadding;
      break label67;
      label497:
      i = mSelectionRightPadding;
      break label91;
      label505:
      i = mSelectionBottomPadding;
      break label115;
      label513:
      i = resolveSize(i, paramInt2);
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (selectedId >= 0L)
    {
      mDataChanged = true;
      mNeedSync = true;
      mSyncRowId = selectedId;
      mSyncPosition = position;
      mSyncMode = 0;
      requestLayout();
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    selectedId = getSelectedItemId();
    if (selectedId >= 0L)
    {
      position = getSelectedItemPosition();
      return localSavedState;
    }
    position = -1;
    return localSavedState;
  }
  
  public int pointToPosition(int paramInt1, int paramInt2)
  {
    Object localObject2 = mTouchFrame;
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      mTouchFrame = new Rect();
      localObject1 = mTouchFrame;
    }
    int i = getChildCount() - 1;
    while (i >= 0)
    {
      localObject2 = getChildAt(i);
      if (((View)localObject2).getVisibility() == 0)
      {
        ((View)localObject2).getHitRect((Rect)localObject1);
        if (((Rect)localObject1).contains(paramInt1, paramInt2)) {
          return mFirstPosition + i;
        }
      }
      i -= 1;
    }
    return -1;
  }
  
  void recycleAllViews()
  {
    int j = getChildCount();
    RecycleBin localRecycleBin = mRecycler;
    int k = mFirstPosition;
    int i = 0;
    while (i < j)
    {
      localRecycleBin.put(k + i, getChildAt(i));
      i += 1;
    }
  }
  
  public void requestLayout()
  {
    if (!mBlockLayoutRequests) {
      super.requestLayout();
    }
  }
  
  void resetList()
  {
    mDataChanged = false;
    mNeedSync = false;
    removeAllViewsInLayout();
    mOldSelectedPosition = -1;
    mOldSelectedRowId = Long.MIN_VALUE;
    setSelectedPositionInt(-1);
    setNextSelectedPositionInt(-1);
    invalidate();
  }
  
  public void setAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    int i = -1;
    if (mAdapter != null)
    {
      mAdapter.unregisterDataSetObserver(mDataSetObserver);
      resetList();
    }
    mAdapter = paramSpinnerAdapter;
    mOldSelectedPosition = -1;
    mOldSelectedRowId = Long.MIN_VALUE;
    if (mAdapter != null)
    {
      mOldItemCount = mItemCount;
      mItemCount = mAdapter.getCount();
      checkFocus();
      mDataSetObserver = new IcsAdapterView.AdapterDataSetObserver(this);
      mAdapter.registerDataSetObserver(mDataSetObserver);
      if (mItemCount > 0) {
        i = 0;
      }
      setSelectedPositionInt(i);
      setNextSelectedPositionInt(i);
      if (mItemCount == 0) {
        checkSelectionChanged();
      }
    }
    for (;;)
    {
      requestLayout();
      return;
      checkFocus();
      resetList();
      checkSelectionChanged();
    }
  }
  
  public void setSelection(int paramInt)
  {
    setNextSelectedPositionInt(paramInt);
    requestLayout();
    invalidate();
  }
  
  public void setSelection(int paramInt, boolean paramBoolean)
  {
    if ((paramBoolean) && (mFirstPosition <= paramInt) && (paramInt <= mFirstPosition + getChildCount() - 1)) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      setSelectionInt(paramInt, paramBoolean);
      return;
    }
  }
  
  void setSelectionInt(int paramInt, boolean paramBoolean)
  {
    if (paramInt != mOldSelectedPosition)
    {
      mBlockLayoutRequests = true;
      int i = mSelectedPosition;
      setNextSelectedPositionInt(paramInt);
      layout(paramInt - i, paramBoolean);
      mBlockLayoutRequests = false;
    }
  }
  
  class RecycleBin
  {
    private final SparseArray<View> mScrapHeap = new SparseArray();
    
    RecycleBin() {}
    
    void clear()
    {
      SparseArray localSparseArray = mScrapHeap;
      int j = localSparseArray.size();
      int i = 0;
      while (i < j)
      {
        View localView = (View)localSparseArray.valueAt(i);
        if (localView != null) {
          removeDetachedView(localView, true);
        }
        i += 1;
      }
      localSparseArray.clear();
    }
    
    View get(int paramInt)
    {
      View localView = (View)mScrapHeap.get(paramInt);
      if (localView != null) {
        mScrapHeap.delete(paramInt);
      }
      return localView;
    }
    
    public void put(int paramInt, View paramView)
    {
      mScrapHeap.put(paramInt, paramView);
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public IcsAbsSpinner.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new IcsAbsSpinner.SavedState(paramAnonymousParcel, null);
      }
      
      public IcsAbsSpinner.SavedState[] newArray(int paramAnonymousInt)
      {
        return new IcsAbsSpinner.SavedState[paramAnonymousInt];
      }
    };
    int position;
    long selectedId;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      selectedId = paramParcel.readLong();
      position = paramParcel.readInt();
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "AbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + selectedId + " position=" + position + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeLong(selectedId);
      paramParcel.writeInt(position);
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.IcsAbsSpinner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */