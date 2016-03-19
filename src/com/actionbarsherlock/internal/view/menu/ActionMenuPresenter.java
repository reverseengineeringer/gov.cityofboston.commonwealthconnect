package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.DisplayMetrics;
import android.util.SparseBooleanArray;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.ImageButton;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.R.integer;
import com.actionbarsherlock.R.layout;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.view.ActionProvider;
import com.actionbarsherlock.view.ActionProvider.SubUiVisibilityListener;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class ActionMenuPresenter
  extends BaseMenuPresenter
  implements ActionProvider.SubUiVisibilityListener
{
  private final SparseBooleanArray mActionButtonGroups = new SparseBooleanArray();
  private ActionButtonSubmenu mActionButtonPopup;
  private int mActionItemWidthLimit;
  private boolean mExpandedActionViewsExclusive;
  private int mMaxItems;
  private boolean mMaxItemsSet;
  private int mMinCellSize;
  int mOpenSubMenuId;
  private View mOverflowButton;
  private OverflowPopup mOverflowPopup;
  final PopupPresenterCallback mPopupPresenterCallback = new PopupPresenterCallback(null);
  private OpenOverflowRunnable mPostedOpenRunnable;
  private boolean mReserveOverflow;
  private boolean mReserveOverflowSet;
  private View mScrapActionButtonView;
  private boolean mStrictWidthLimit;
  private int mWidthLimit;
  private boolean mWidthLimitSet;
  
  public ActionMenuPresenter(Context paramContext)
  {
    super(paramContext, R.layout.abs__action_menu_layout, R.layout.abs__action_menu_item_layout);
  }
  
  private View findViewForItem(MenuItem paramMenuItem)
  {
    ViewGroup localViewGroup = (ViewGroup)mMenuView;
    Object localObject;
    if (localViewGroup == null)
    {
      localObject = null;
      return (View)localObject;
    }
    int j = localViewGroup.getChildCount();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label74;
      }
      View localView = localViewGroup.getChildAt(i);
      if ((localView instanceof MenuView.ItemView))
      {
        localObject = localView;
        if (((MenuView.ItemView)localView).getItemData() == paramMenuItem) {
          break;
        }
      }
      i += 1;
    }
    label74:
    return null;
  }
  
  public static boolean reserveOverflow(Context paramContext)
  {
    if (Build.VERSION.SDK_INT < 14) {
      if (Build.VERSION.SDK_INT < 11) {}
    }
    while (!HasPermanentMenuKey.get(paramContext))
    {
      return true;
      return false;
    }
    return false;
  }
  
  public void bindItemView(MenuItemImpl paramMenuItemImpl, MenuView.ItemView paramItemView)
  {
    paramItemView.initialize(paramMenuItemImpl, 0);
    paramMenuItemImpl = (ActionMenuView)mMenuView;
    ((ActionMenuItemView)paramItemView).setItemInvoker(paramMenuItemImpl);
  }
  
  public boolean dismissPopupMenus()
  {
    return hideOverflowMenu() | hideSubMenus();
  }
  
  public boolean filterLeftoverView(ViewGroup paramViewGroup, int paramInt)
  {
    if (paramViewGroup.getChildAt(paramInt) == mOverflowButton) {
      return false;
    }
    return super.filterLeftoverView(paramViewGroup, paramInt);
  }
  
  public boolean flagActionItems()
  {
    ArrayList localArrayList = mMenu.getVisibleItems();
    int i6 = localArrayList.size();
    int i = mMaxItems;
    int i4 = mActionItemWidthLimit;
    int i7 = View.MeasureSpec.makeMeasureSpec(0, 0);
    ViewGroup localViewGroup = (ViewGroup)mMenuView;
    int j = 0;
    int m = 0;
    int i2 = 0;
    int n = 0;
    int k = 0;
    int i1;
    if (k < i6)
    {
      localObject1 = (MenuItemImpl)localArrayList.get(k);
      if (((MenuItemImpl)localObject1).requiresActionButton()) {
        j += 1;
      }
      for (;;)
      {
        i1 = i;
        if (mExpandedActionViewsExclusive)
        {
          i1 = i;
          if (((MenuItemImpl)localObject1).isActionViewExpanded()) {
            i1 = 0;
          }
        }
        k += 1;
        i = i1;
        break;
        if (((MenuItemImpl)localObject1).requestsActionButton()) {
          m += 1;
        } else {
          n = 1;
        }
      }
    }
    k = i;
    if (mReserveOverflow) {
      if (n == 0)
      {
        k = i;
        if (j + m <= i) {}
      }
      else
      {
        k = i - 1;
      }
    }
    k -= j;
    Object localObject1 = mActionButtonGroups;
    ((SparseBooleanArray)localObject1).clear();
    int i3 = 0;
    j = 0;
    if (mStrictWidthLimit)
    {
      j = i4 / mMinCellSize;
      i = mMinCellSize;
      i3 = mMinCellSize + i4 % i / j;
    }
    i = 0;
    m = i4;
    i4 = i;
    i = i2;
    if (i4 < i6)
    {
      MenuItemImpl localMenuItemImpl = (MenuItemImpl)localArrayList.get(i4);
      Object localObject2;
      if (localMenuItemImpl.requiresActionButton())
      {
        localObject2 = getItemView(localMenuItemImpl, mScrapActionButtonView, localViewGroup);
        if (mScrapActionButtonView == null) {
          mScrapActionButtonView = ((View)localObject2);
        }
        if (mStrictWidthLimit)
        {
          j -= ActionMenuView.measureChildForCells((View)localObject2, i3, j, i7, 0);
          label310:
          i2 = ((View)localObject2).getMeasuredWidth();
          n = m - i2;
          i1 = i;
          if (i == 0) {
            i1 = i2;
          }
          i = localMenuItemImpl.getGroupId();
          if (i != 0) {
            ((SparseBooleanArray)localObject1).put(i, true);
          }
          localMenuItemImpl.setIsActionButton(true);
          i5 = k;
          i2 = j;
        }
      }
      do
      {
        i4 += 1;
        j = i2;
        i = i1;
        k = i5;
        m = n;
        break;
        ((View)localObject2).measure(i7, i7);
        break label310;
        i2 = j;
        i1 = i;
        i5 = k;
        n = m;
      } while (!localMenuItemImpl.requestsActionButton());
      int i5 = localMenuItemImpl.getGroupId();
      boolean bool = ((SparseBooleanArray)localObject1).get(i5);
      int i8;
      label463:
      int i9;
      if (((k > 0) || (bool)) && (m > 0) && ((!mStrictWidthLimit) || (j > 0)))
      {
        i8 = 1;
        i2 = j;
        i1 = i;
        i9 = i8;
        n = m;
        if (i8 != 0)
        {
          localObject2 = getItemView(localMenuItemImpl, mScrapActionButtonView, localViewGroup);
          if (mScrapActionButtonView == null) {
            mScrapActionButtonView = ((View)localObject2);
          }
          if (!mStrictWidthLimit) {
            break label647;
          }
          i1 = ActionMenuView.measureChildForCells((View)localObject2, i3, j, i7, 0);
          n = j - i1;
          j = n;
          if (i1 == 0)
          {
            i8 = 0;
            j = n;
          }
          label549:
          i2 = ((View)localObject2).getMeasuredWidth();
          n = m - i2;
          i1 = i;
          if (i == 0) {
            i1 = i2;
          }
          if (!mStrictWidthLimit) {
            break label664;
          }
          if (n < 0) {
            break label659;
          }
          i = 1;
          label588:
          i9 = i8 & i;
          i2 = j;
        }
        if ((i9 == 0) || (i5 == 0)) {
          break label691;
        }
        ((SparseBooleanArray)localObject1).put(i5, true);
        i = k;
      }
      label647:
      label659:
      label664:
      label691:
      do
      {
        j = i;
        if (i9 != 0) {
          j = i - 1;
        }
        localMenuItemImpl.setIsActionButton(i9);
        i5 = j;
        break;
        i8 = 0;
        break label463;
        ((View)localObject2).measure(i7, i7);
        break label549;
        i = 0;
        break label588;
        if (n + i1 > 0) {}
        for (i = 1;; i = 0)
        {
          i9 = i8 & i;
          i2 = j;
          break;
        }
        i = k;
      } while (!bool);
      ((SparseBooleanArray)localObject1).put(i5, false);
      j = 0;
      for (;;)
      {
        i = k;
        if (j >= i4) {
          break;
        }
        localObject2 = (MenuItemImpl)localArrayList.get(j);
        i = k;
        if (((MenuItemImpl)localObject2).getGroupId() == i5)
        {
          i = k;
          if (((MenuItemImpl)localObject2).isActionButton()) {
            i = k + 1;
          }
          ((MenuItemImpl)localObject2).setIsActionButton(false);
        }
        j += 1;
        k = i;
      }
    }
    return true;
  }
  
  public View getItemView(MenuItemImpl paramMenuItemImpl, View paramView, ViewGroup paramViewGroup)
  {
    View localView = paramMenuItemImpl.getActionView();
    if ((localView == null) || (paramMenuItemImpl.hasCollapsibleActionView()))
    {
      localView = paramView;
      if (!(paramView instanceof ActionMenuItemView)) {
        localView = null;
      }
      localView = super.getItemView(paramMenuItemImpl, localView, paramViewGroup);
    }
    if (paramMenuItemImpl.isActionViewExpanded()) {}
    for (int i = 8;; i = 0)
    {
      localView.setVisibility(i);
      paramMenuItemImpl = (ActionMenuView)paramViewGroup;
      paramView = localView.getLayoutParams();
      if (!paramMenuItemImpl.checkLayoutParams(paramView)) {
        localView.setLayoutParams(paramMenuItemImpl.generateLayoutParams(paramView));
      }
      return localView;
    }
  }
  
  public MenuView getMenuView(ViewGroup paramViewGroup)
  {
    paramViewGroup = super.getMenuView(paramViewGroup);
    ((ActionMenuView)paramViewGroup).setPresenter(this);
    return paramViewGroup;
  }
  
  public boolean hideOverflowMenu()
  {
    if ((mPostedOpenRunnable != null) && (mMenuView != null))
    {
      ((View)mMenuView).removeCallbacks(mPostedOpenRunnable);
      mPostedOpenRunnable = null;
      return true;
    }
    OverflowPopup localOverflowPopup = mOverflowPopup;
    if (localOverflowPopup != null)
    {
      localOverflowPopup.dismiss();
      return true;
    }
    return false;
  }
  
  public boolean hideSubMenus()
  {
    if (mActionButtonPopup != null)
    {
      mActionButtonPopup.dismiss();
      return true;
    }
    return false;
  }
  
  public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder)
  {
    super.initForMenu(paramContext, paramMenuBuilder);
    paramMenuBuilder = paramContext.getResources();
    if (!mReserveOverflowSet) {
      mReserveOverflow = reserveOverflow(mContext);
    }
    if (!mWidthLimitSet) {
      mWidthLimit = (getDisplayMetricswidthPixels / 2);
    }
    if (!mMaxItemsSet) {
      mMaxItems = ResourcesCompat.getResources_getInteger(paramContext, R.integer.abs__max_action_buttons);
    }
    int i = mWidthLimit;
    if (mReserveOverflow)
    {
      if (mOverflowButton == null)
      {
        mOverflowButton = new OverflowMenuButton(mSystemContext);
        int j = View.MeasureSpec.makeMeasureSpec(0, 0);
        mOverflowButton.measure(j, j);
      }
      i -= mOverflowButton.getMeasuredWidth();
    }
    for (;;)
    {
      mActionItemWidthLimit = i;
      mMinCellSize = ((int)(56.0F * getDisplayMetricsdensity));
      mScrapActionButtonView = null;
      return;
      mOverflowButton = null;
    }
  }
  
  public boolean isOverflowMenuShowing()
  {
    return (mOverflowPopup != null) && (mOverflowPopup.isShowing());
  }
  
  public boolean isOverflowReserved()
  {
    return mReserveOverflow;
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    dismissPopupMenus();
    super.onCloseMenu(paramMenuBuilder, paramBoolean);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (!mMaxItemsSet)
    {
      mMaxItems = ResourcesCompat.getResources_getInteger(mContext, R.integer.abs__max_action_buttons);
      if (mMenu != null) {
        mMenu.onItemsChanged(true);
      }
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    if (openSubMenuId > 0)
    {
      paramParcelable = mMenu.findItem(openSubMenuId);
      if (paramParcelable != null) {
        onSubMenuSelected((SubMenuBuilder)paramParcelable.getSubMenu());
      }
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState();
    openSubMenuId = mOpenSubMenuId;
    return localSavedState;
  }
  
  public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
  {
    if (!paramSubMenuBuilder.hasVisibleItems()) {}
    do
    {
      return false;
      for (localObject = paramSubMenuBuilder; ((SubMenuBuilder)localObject).getParentMenu() != mMenu; localObject = (SubMenuBuilder)((SubMenuBuilder)localObject).getParentMenu()) {}
      View localView = findViewForItem(((SubMenuBuilder)localObject).getItem());
      localObject = localView;
      if (localView != null) {
        break;
      }
    } while (mOverflowButton == null);
    Object localObject = mOverflowButton;
    mOpenSubMenuId = paramSubMenuBuilder.getItem().getItemId();
    mActionButtonPopup = new ActionButtonSubmenu(mContext, paramSubMenuBuilder);
    mActionButtonPopup.setAnchorView((View)localObject);
    mActionButtonPopup.show();
    super.onSubMenuSelected(paramSubMenuBuilder);
    return true;
  }
  
  public void onSubUiVisibilityChanged(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      super.onSubMenuSelected(null);
      return;
    }
    mMenu.close(false);
  }
  
  public void setExpandedActionViewsExclusive(boolean paramBoolean)
  {
    mExpandedActionViewsExclusive = paramBoolean;
  }
  
  public void setItemLimit(int paramInt)
  {
    mMaxItems = paramInt;
    mMaxItemsSet = true;
  }
  
  public void setReserveOverflow(boolean paramBoolean)
  {
    mReserveOverflow = paramBoolean;
    mReserveOverflowSet = true;
  }
  
  public void setWidthLimit(int paramInt, boolean paramBoolean)
  {
    mWidthLimit = paramInt;
    mStrictWidthLimit = paramBoolean;
    mWidthLimitSet = true;
  }
  
  public boolean shouldIncludeItem(int paramInt, MenuItemImpl paramMenuItemImpl)
  {
    return paramMenuItemImpl.isActionButton();
  }
  
  public boolean showOverflowMenu()
  {
    if ((mReserveOverflow) && (!isOverflowMenuShowing()) && (mMenu != null) && (mMenuView != null) && (mPostedOpenRunnable == null) && (!mMenu.getNonActionItems().isEmpty()))
    {
      mPostedOpenRunnable = new OpenOverflowRunnable(new OverflowPopup(mContext, mMenu, mOverflowButton, true));
      ((View)mMenuView).post(mPostedOpenRunnable);
      super.onSubMenuSelected(null);
      return true;
    }
    return false;
  }
  
  public void updateMenuView(boolean paramBoolean)
  {
    super.updateMenuView(paramBoolean);
    Object localObject;
    int j;
    int i;
    if (mMenu != null)
    {
      localObject = mMenu.getActionItems();
      j = ((ArrayList)localObject).size();
      i = 0;
      while (i < j)
      {
        ActionProvider localActionProvider = ((MenuItemImpl)((ArrayList)localObject).get(i)).getActionProvider();
        if (localActionProvider != null) {
          localActionProvider.setSubUiVisibilityListener(this);
        }
        i += 1;
      }
    }
    if (mMenu != null)
    {
      localObject = mMenu.getNonActionItems();
      j = 0;
      i = j;
      if (mReserveOverflow)
      {
        i = j;
        if (localObject != null)
        {
          i = ((ArrayList)localObject).size();
          if (i != 1) {
            break label239;
          }
          if (((MenuItemImpl)((ArrayList)localObject).get(0)).isActionViewExpanded()) {
            break label234;
          }
          i = 1;
        }
      }
      label128:
      if (i == 0) {
        break label253;
      }
      if (mOverflowButton == null) {
        mOverflowButton = new OverflowMenuButton(mSystemContext);
      }
      localObject = (ViewGroup)mOverflowButton.getParent();
      if (localObject != mMenuView)
      {
        if (localObject != null) {
          ((ViewGroup)localObject).removeView(mOverflowButton);
        }
        localObject = (ActionMenuView)mMenuView;
        ((ActionMenuView)localObject).addView(mOverflowButton, ((ActionMenuView)localObject).generateOverflowButtonLayoutParams());
      }
    }
    for (;;)
    {
      ((ActionMenuView)mMenuView).setOverflowReserved(mReserveOverflow);
      return;
      localObject = null;
      break;
      label234:
      i = 0;
      break label128;
      label239:
      if (i > 0) {}
      for (i = 1;; i = 0) {
        break;
      }
      label253:
      if ((mOverflowButton != null) && (mOverflowButton.getParent() == mMenuView)) {
        ((ViewGroup)mMenuView).removeView(mOverflowButton);
      }
    }
  }
  
  private class ActionButtonSubmenu
    extends MenuPopupHelper
  {
    public ActionButtonSubmenu(Context paramContext, SubMenuBuilder paramSubMenuBuilder)
    {
      super(paramSubMenuBuilder);
      boolean bool2;
      int j;
      int i;
      if (!((MenuItemImpl)paramSubMenuBuilder.getItem()).isActionButton())
      {
        if (mOverflowButton == null)
        {
          paramContext = (View)mMenuView;
          setAnchorView(paramContext);
        }
      }
      else
      {
        setCallback(mPopupPresenterCallback);
        bool2 = false;
        j = paramSubMenuBuilder.size();
        i = 0;
      }
      for (;;)
      {
        boolean bool1 = bool2;
        if (i < j)
        {
          this$1 = paramSubMenuBuilder.getItem(i);
          if ((isVisible()) && (getIcon() != null)) {
            bool1 = true;
          }
        }
        else
        {
          setForceShowIcon(bool1);
          return;
          paramContext = mOverflowButton;
          break;
        }
        i += 1;
      }
    }
    
    public void onDismiss()
    {
      super.onDismiss();
      ActionMenuPresenter.access$302(ActionMenuPresenter.this, null);
      mOpenSubMenuId = 0;
    }
  }
  
  private static class HasPermanentMenuKey
  {
    public static boolean get(Context paramContext)
    {
      return ViewConfiguration.get(paramContext).hasPermanentMenuKey();
    }
  }
  
  private class OpenOverflowRunnable
    implements Runnable
  {
    private ActionMenuPresenter.OverflowPopup mPopup;
    
    public OpenOverflowRunnable(ActionMenuPresenter.OverflowPopup paramOverflowPopup)
    {
      mPopup = paramOverflowPopup;
    }
    
    public void run()
    {
      mMenu.changeMenuMode();
      View localView = (View)mMenuView;
      if ((localView != null) && (localView.getWindowToken() != null) && (mPopup.tryShow())) {
        ActionMenuPresenter.access$102(ActionMenuPresenter.this, mPopup);
      }
      ActionMenuPresenter.access$402(ActionMenuPresenter.this, null);
    }
  }
  
  private class OverflowMenuButton
    extends ImageButton
    implements ActionMenuView.ActionMenuChildView, View_HasStateListenerSupport
  {
    private final Set<View_OnAttachStateChangeListener> mListeners = new HashSet();
    
    public OverflowMenuButton(Context paramContext)
    {
      super(null, R.attr.actionOverflowButtonStyle);
      setClickable(true);
      setFocusable(true);
      setVisibility(0);
      setEnabled(true);
    }
    
    public void addOnAttachStateChangeListener(View_OnAttachStateChangeListener paramView_OnAttachStateChangeListener)
    {
      mListeners.add(paramView_OnAttachStateChangeListener);
    }
    
    public boolean needsDividerAfter()
    {
      return false;
    }
    
    public boolean needsDividerBefore()
    {
      return false;
    }
    
    protected void onAttachedToWindow()
    {
      super.onAttachedToWindow();
      Iterator localIterator = mListeners.iterator();
      while (localIterator.hasNext()) {
        ((View_OnAttachStateChangeListener)localIterator.next()).onViewAttachedToWindow(this);
      }
    }
    
    protected void onDetachedFromWindow()
    {
      super.onDetachedFromWindow();
      Iterator localIterator = mListeners.iterator();
      while (localIterator.hasNext()) {
        ((View_OnAttachStateChangeListener)localIterator.next()).onViewDetachedFromWindow(this);
      }
      if (mOverflowPopup != null) {
        mOverflowPopup.dismiss();
      }
    }
    
    public boolean performClick()
    {
      if (super.performClick()) {
        return true;
      }
      playSoundEffect(0);
      showOverflowMenu();
      return true;
    }
    
    public void removeOnAttachStateChangeListener(View_OnAttachStateChangeListener paramView_OnAttachStateChangeListener)
    {
      mListeners.remove(paramView_OnAttachStateChangeListener);
    }
  }
  
  private class OverflowPopup
    extends MenuPopupHelper
  {
    public OverflowPopup(Context paramContext, MenuBuilder paramMenuBuilder, View paramView, boolean paramBoolean)
    {
      super(paramMenuBuilder, paramView, paramBoolean);
      setCallback(mPopupPresenterCallback);
    }
    
    public void onDismiss()
    {
      super.onDismiss();
      mMenu.close();
      ActionMenuPresenter.access$102(ActionMenuPresenter.this, null);
    }
  }
  
  private class PopupPresenterCallback
    implements MenuPresenter.Callback
  {
    private PopupPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
    {
      if ((paramMenuBuilder instanceof SubMenuBuilder)) {
        ((SubMenuBuilder)paramMenuBuilder).getRootMenu().close(false);
      }
    }
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      if (paramMenuBuilder == null) {
        return false;
      }
      mOpenSubMenuId = ((SubMenuBuilder)paramMenuBuilder).getItem().getItemId();
      return false;
    }
  }
  
  private static class SavedState
    implements Parcelable
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public ActionMenuPresenter.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new ActionMenuPresenter.SavedState(paramAnonymousParcel);
      }
      
      public ActionMenuPresenter.SavedState[] newArray(int paramAnonymousInt)
      {
        return new ActionMenuPresenter.SavedState[paramAnonymousInt];
      }
    };
    public int openSubMenuId;
    
    SavedState() {}
    
    SavedState(Parcel paramParcel)
    {
      openSubMenuId = paramParcel.readInt();
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeInt(openSubMenuId);
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.view.menu.ActionMenuPresenter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */