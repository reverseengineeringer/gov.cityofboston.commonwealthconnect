package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.R.dimen;
import com.actionbarsherlock.R.layout;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.internal.widget.IcsListPopupWindow;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;

public class MenuPopupHelper
  implements AdapterView.OnItemClickListener, View.OnKeyListener, ViewTreeObserver.OnGlobalLayoutListener, PopupWindow.OnDismissListener, View_OnAttachStateChangeListener, MenuPresenter
{
  static final int ITEM_LAYOUT = R.layout.abs__popup_menu_item_layout;
  private MenuAdapter mAdapter;
  private View mAnchorView;
  private Context mContext;
  boolean mForceShowIcon;
  private LayoutInflater mInflater;
  private ViewGroup mMeasureParent;
  private MenuBuilder mMenu;
  private boolean mOverflowOnly;
  private IcsListPopupWindow mPopup;
  private int mPopupMaxWidth;
  private MenuPresenter.Callback mPresenterCallback;
  private ViewTreeObserver mTreeObserver;
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder)
  {
    this(paramContext, paramMenuBuilder, null, false);
  }
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView)
  {
    this(paramContext, paramMenuBuilder, paramView, false);
  }
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView, boolean paramBoolean)
  {
    mContext = paramContext;
    mInflater = LayoutInflater.from(paramContext);
    mMenu = paramMenuBuilder;
    mOverflowOnly = paramBoolean;
    paramContext = paramContext.getResources();
    mPopupMaxWidth = Math.max(getDisplayMetricswidthPixels / 2, paramContext.getDimensionPixelSize(R.dimen.abs__config_prefDialogWidth));
    mAnchorView = paramView;
    paramMenuBuilder.addMenuPresenter(this);
  }
  
  private int measureContentWidth(ListAdapter paramListAdapter)
  {
    int i = 0;
    View localView = null;
    int k = 0;
    int i1 = View.MeasureSpec.makeMeasureSpec(0, 0);
    int i2 = View.MeasureSpec.makeMeasureSpec(0, 0);
    int i3 = paramListAdapter.getCount();
    int j = 0;
    while (j < i3)
    {
      int n = paramListAdapter.getItemViewType(j);
      int m = k;
      if (n != k)
      {
        m = n;
        localView = null;
      }
      if (mMeasureParent == null) {
        mMeasureParent = new FrameLayout(mContext);
      }
      localView = paramListAdapter.getView(j, localView, mMeasureParent);
      localView.measure(i1, i2);
      i = Math.max(i, localView.getMeasuredWidth());
      j += 1;
      k = m;
    }
    return i;
  }
  
  public boolean collapseItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
  }
  
  public void dismiss()
  {
    if (isShowing()) {
      mPopup.dismiss();
    }
  }
  
  public boolean expandItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
  }
  
  public boolean flagActionItems()
  {
    return false;
  }
  
  public int getId()
  {
    return 0;
  }
  
  public MenuView getMenuView(ViewGroup paramViewGroup)
  {
    throw new UnsupportedOperationException("MenuPopupHelpers manage their own views");
  }
  
  public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder) {}
  
  public boolean isShowing()
  {
    return (mPopup != null) && (mPopup.isShowing());
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if (paramMenuBuilder != mMenu) {}
    do
    {
      return;
      dismiss();
    } while (mPresenterCallback == null);
    mPresenterCallback.onCloseMenu(paramMenuBuilder, paramBoolean);
  }
  
  public void onDismiss()
  {
    mPopup = null;
    mMenu.close();
    if (mTreeObserver != null)
    {
      if (mTreeObserver.isAlive()) {
        mTreeObserver.removeGlobalOnLayoutListener(this);
      }
      mTreeObserver = null;
    }
    while (!(mAnchorView instanceof View_HasStateListenerSupport)) {
      return;
    }
    ((View_HasStateListenerSupport)mAnchorView).removeOnAttachStateChangeListener(this);
  }
  
  public void onGlobalLayout()
  {
    if (isShowing())
    {
      View localView = mAnchorView;
      if ((localView != null) && (localView.isShown())) {
        break label28;
      }
      dismiss();
    }
    label28:
    while (!isShowing()) {
      return;
    }
    mPopup.show();
  }
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = mAdapter;
    mAdapterMenu.performItemAction(paramAdapterView.getItem(paramInt), 0);
  }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramKeyEvent.getAction() == 1) && (paramInt == 82))
    {
      dismiss();
      return true;
    }
    return false;
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable) {}
  
  public Parcelable onSaveInstanceState()
  {
    return null;
  }
  
  public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    MenuPopupHelper localMenuPopupHelper;
    boolean bool3;
    int j;
    int i;
    if (paramSubMenuBuilder.hasVisibleItems())
    {
      localMenuPopupHelper = new MenuPopupHelper(mContext, paramSubMenuBuilder, mAnchorView, false);
      localMenuPopupHelper.setCallback(mPresenterCallback);
      bool3 = false;
      j = paramSubMenuBuilder.size();
      i = 0;
    }
    for (;;)
    {
      bool1 = bool3;
      if (i < j)
      {
        MenuItem localMenuItem = paramSubMenuBuilder.getItem(i);
        if ((localMenuItem.isVisible()) && (localMenuItem.getIcon() != null)) {
          bool1 = true;
        }
      }
      else
      {
        localMenuPopupHelper.setForceShowIcon(bool1);
        bool1 = bool2;
        if (localMenuPopupHelper.tryShow())
        {
          if (mPresenterCallback != null) {
            mPresenterCallback.onOpenSubMenu(paramSubMenuBuilder);
          }
          bool1 = true;
        }
        return bool1;
      }
      i += 1;
    }
  }
  
  public void onViewAttachedToWindow(View paramView)
  {
    ((View_HasStateListenerSupport)paramView).removeOnAttachStateChangeListener(this);
    if ((mPopup != null) && (mTreeObserver == null))
    {
      paramView = paramView.getViewTreeObserver();
      mTreeObserver = paramView;
      paramView.addOnGlobalLayoutListener(this);
    }
  }
  
  public void onViewDetachedFromWindow(View paramView) {}
  
  public void setAnchorView(View paramView)
  {
    mAnchorView = paramView;
  }
  
  public void setCallback(MenuPresenter.Callback paramCallback)
  {
    mPresenterCallback = paramCallback;
  }
  
  public void setForceShowIcon(boolean paramBoolean)
  {
    mForceShowIcon = paramBoolean;
  }
  
  public void show()
  {
    if (!tryShow()) {
      throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
    }
  }
  
  public boolean tryShow()
  {
    mPopup = new IcsListPopupWindow(mContext, null, R.attr.popupMenuStyle);
    mPopup.setOnDismissListener(this);
    mPopup.setOnItemClickListener(this);
    mAdapter = new MenuAdapter(mMenu);
    mPopup.setAdapter(mAdapter);
    mPopup.setModal(true);
    View localView = mAnchorView;
    if (localView != null)
    {
      if (localView.getWindowToken() != null)
      {
        ViewTreeObserver localViewTreeObserver = localView.getViewTreeObserver();
        if (localViewTreeObserver != mTreeObserver)
        {
          if ((mTreeObserver != null) && (mTreeObserver.isAlive())) {
            mTreeObserver.removeGlobalOnLayoutListener(this);
          }
          mTreeObserver = localViewTreeObserver;
          if (localViewTreeObserver != null) {
            localViewTreeObserver.addOnGlobalLayoutListener(this);
          }
        }
      }
      for (;;)
      {
        mPopup.setAnchorView(localView);
        mPopup.setContentWidth(Math.min(measureContentWidth(mAdapter), mPopupMaxWidth));
        mPopup.setInputMethodMode(2);
        mPopup.show();
        mPopup.getListView().setOnKeyListener(this);
        return true;
        if ((localView instanceof View_HasStateListenerSupport)) {
          ((View_HasStateListenerSupport)localView).addOnAttachStateChangeListener(this);
        }
      }
    }
    return false;
  }
  
  public void updateMenuView(boolean paramBoolean)
  {
    if (mAdapter != null) {
      mAdapter.notifyDataSetChanged();
    }
  }
  
  private class ExpandedIndexObserver
    extends DataSetObserver
  {
    private ExpandedIndexObserver() {}
    
    public void onChanged()
    {
      mAdapter.findExpandedIndex();
    }
  }
  
  private class MenuAdapter
    extends BaseAdapter
  {
    private MenuBuilder mAdapterMenu;
    private int mExpandedIndex = -1;
    
    public MenuAdapter(MenuBuilder paramMenuBuilder)
    {
      mAdapterMenu = paramMenuBuilder;
      registerDataSetObserver(new MenuPopupHelper.ExpandedIndexObserver(MenuPopupHelper.this, null));
      findExpandedIndex();
    }
    
    void findExpandedIndex()
    {
      MenuItemImpl localMenuItemImpl = mMenu.getExpandedItem();
      if (localMenuItemImpl != null)
      {
        ArrayList localArrayList = mMenu.getNonActionItems();
        int j = localArrayList.size();
        int i = 0;
        while (i < j)
        {
          if ((MenuItemImpl)localArrayList.get(i) == localMenuItemImpl)
          {
            mExpandedIndex = i;
            return;
          }
          i += 1;
        }
      }
      mExpandedIndex = -1;
    }
    
    public int getCount()
    {
      if (mOverflowOnly) {}
      for (ArrayList localArrayList = mAdapterMenu.getNonActionItems(); mExpandedIndex < 0; localArrayList = mAdapterMenu.getVisibleItems()) {
        return localArrayList.size();
      }
      return localArrayList.size() - 1;
    }
    
    public MenuItemImpl getItem(int paramInt)
    {
      if (mOverflowOnly) {}
      for (ArrayList localArrayList = mAdapterMenu.getNonActionItems();; localArrayList = mAdapterMenu.getVisibleItems())
      {
        int i = paramInt;
        if (mExpandedIndex >= 0)
        {
          i = paramInt;
          if (paramInt >= mExpandedIndex) {
            i = paramInt + 1;
          }
        }
        return (MenuItemImpl)localArrayList.get(i);
      }
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = paramView;
      if (paramView == null) {
        localView = mInflater.inflate(MenuPopupHelper.ITEM_LAYOUT, paramViewGroup, false);
      }
      paramView = (MenuView.ItemView)localView;
      if (mForceShowIcon) {
        ((ListMenuItemView)localView).setForceShowIcon(true);
      }
      paramView.initialize(getItem(paramInt), 0);
      return localView;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.view.menu.MenuPopupHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */