package com.actionbarsherlock.internal.app;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.SpinnerAdapter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class ActionBarWrapper
  extends com.actionbarsherlock.app.ActionBar
  implements android.app.ActionBar.OnNavigationListener, android.app.ActionBar.OnMenuVisibilityListener
{
  private final android.app.ActionBar mActionBar;
  private final Activity mActivity;
  private android.support.v4.app.FragmentTransaction mFragmentTransaction;
  private Set<com.actionbarsherlock.app.ActionBar.OnMenuVisibilityListener> mMenuVisibilityListeners = new HashSet(1);
  private com.actionbarsherlock.app.ActionBar.OnNavigationListener mNavigationListener;
  
  public ActionBarWrapper(Activity paramActivity)
  {
    mActivity = paramActivity;
    mActionBar = paramActivity.getActionBar();
    if (mActionBar != null)
    {
      mActionBar.addOnMenuVisibilityListener(this);
      int i = mActionBar.getDisplayOptions();
      paramActivity = mActionBar;
      if ((i & 0x4) == 0) {
        break label71;
      }
    }
    for (;;)
    {
      paramActivity.setHomeButtonEnabled(bool);
      return;
      label71:
      bool = false;
    }
  }
  
  public void addOnMenuVisibilityListener(com.actionbarsherlock.app.ActionBar.OnMenuVisibilityListener paramOnMenuVisibilityListener)
  {
    mMenuVisibilityListeners.add(paramOnMenuVisibilityListener);
  }
  
  public void addTab(com.actionbarsherlock.app.ActionBar.Tab paramTab)
  {
    mActionBar.addTab(mNativeTab);
  }
  
  public void addTab(com.actionbarsherlock.app.ActionBar.Tab paramTab, int paramInt)
  {
    mActionBar.addTab(mNativeTab, paramInt);
  }
  
  public void addTab(com.actionbarsherlock.app.ActionBar.Tab paramTab, int paramInt, boolean paramBoolean)
  {
    mActionBar.addTab(mNativeTab, paramInt, paramBoolean);
  }
  
  public void addTab(com.actionbarsherlock.app.ActionBar.Tab paramTab, boolean paramBoolean)
  {
    mActionBar.addTab(mNativeTab, paramBoolean);
  }
  
  public View getCustomView()
  {
    return mActionBar.getCustomView();
  }
  
  public int getDisplayOptions()
  {
    return mActionBar.getDisplayOptions();
  }
  
  public int getHeight()
  {
    return mActionBar.getHeight();
  }
  
  public int getNavigationItemCount()
  {
    return mActionBar.getNavigationItemCount();
  }
  
  public int getNavigationMode()
  {
    return mActionBar.getNavigationMode();
  }
  
  public int getSelectedNavigationIndex()
  {
    return mActionBar.getSelectedNavigationIndex();
  }
  
  public com.actionbarsherlock.app.ActionBar.Tab getSelectedTab()
  {
    android.app.ActionBar.Tab localTab = mActionBar.getSelectedTab();
    if (localTab != null) {
      return (com.actionbarsherlock.app.ActionBar.Tab)localTab.getTag();
    }
    return null;
  }
  
  public CharSequence getSubtitle()
  {
    return mActionBar.getSubtitle();
  }
  
  public com.actionbarsherlock.app.ActionBar.Tab getTabAt(int paramInt)
  {
    android.app.ActionBar.Tab localTab = mActionBar.getTabAt(paramInt);
    if (localTab != null) {
      return (com.actionbarsherlock.app.ActionBar.Tab)localTab.getTag();
    }
    return null;
  }
  
  public int getTabCount()
  {
    return mActionBar.getTabCount();
  }
  
  public Context getThemedContext()
  {
    return mActionBar.getThemedContext();
  }
  
  public CharSequence getTitle()
  {
    return mActionBar.getTitle();
  }
  
  public void hide()
  {
    mActionBar.hide();
  }
  
  public boolean isShowing()
  {
    return mActionBar.isShowing();
  }
  
  public com.actionbarsherlock.app.ActionBar.Tab newTab()
  {
    return new TabWrapper(mActionBar.newTab());
  }
  
  public void onMenuVisibilityChanged(boolean paramBoolean)
  {
    Iterator localIterator = mMenuVisibilityListeners.iterator();
    while (localIterator.hasNext()) {
      ((com.actionbarsherlock.app.ActionBar.OnMenuVisibilityListener)localIterator.next()).onMenuVisibilityChanged(paramBoolean);
    }
  }
  
  public boolean onNavigationItemSelected(int paramInt, long paramLong)
  {
    return mNavigationListener.onNavigationItemSelected(paramInt, paramLong);
  }
  
  public void removeAllTabs()
  {
    mActionBar.removeAllTabs();
  }
  
  public void removeOnMenuVisibilityListener(com.actionbarsherlock.app.ActionBar.OnMenuVisibilityListener paramOnMenuVisibilityListener)
  {
    mMenuVisibilityListeners.remove(paramOnMenuVisibilityListener);
  }
  
  public void removeTab(com.actionbarsherlock.app.ActionBar.Tab paramTab)
  {
    mActionBar.removeTab(mNativeTab);
  }
  
  public void removeTabAt(int paramInt)
  {
    mActionBar.removeTabAt(paramInt);
  }
  
  public void selectTab(com.actionbarsherlock.app.ActionBar.Tab paramTab)
  {
    mActionBar.selectTab(mNativeTab);
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    mActionBar.setBackgroundDrawable(paramDrawable);
  }
  
  public void setCustomView(int paramInt)
  {
    mActionBar.setCustomView(paramInt);
  }
  
  public void setCustomView(View paramView)
  {
    mActionBar.setCustomView(paramView);
  }
  
  public void setCustomView(View paramView, com.actionbarsherlock.app.ActionBar.LayoutParams paramLayoutParams)
  {
    android.app.ActionBar.LayoutParams localLayoutParams = new android.app.ActionBar.LayoutParams(paramLayoutParams);
    gravity = gravity;
    bottomMargin = bottomMargin;
    topMargin = topMargin;
    leftMargin = leftMargin;
    rightMargin = rightMargin;
    mActionBar.setCustomView(paramView, localLayoutParams);
  }
  
  public void setDisplayHomeAsUpEnabled(boolean paramBoolean)
  {
    mActionBar.setDisplayHomeAsUpEnabled(paramBoolean);
  }
  
  public void setDisplayOptions(int paramInt)
  {
    mActionBar.setDisplayOptions(paramInt);
    android.app.ActionBar localActionBar = mActionBar;
    if ((paramInt & 0x4) != 0) {}
    for (boolean bool = true;; bool = false)
    {
      localActionBar.setHomeButtonEnabled(bool);
      return;
    }
  }
  
  public void setDisplayOptions(int paramInt1, int paramInt2)
  {
    mActionBar.setDisplayOptions(paramInt1, paramInt2);
    android.app.ActionBar localActionBar;
    if ((paramInt2 & 0x4) != 0)
    {
      localActionBar = mActionBar;
      if ((paramInt1 & 0x4) == 0) {
        break label36;
      }
    }
    label36:
    for (boolean bool = true;; bool = false)
    {
      localActionBar.setHomeButtonEnabled(bool);
      return;
    }
  }
  
  public void setDisplayShowCustomEnabled(boolean paramBoolean)
  {
    mActionBar.setDisplayShowCustomEnabled(paramBoolean);
  }
  
  public void setDisplayShowHomeEnabled(boolean paramBoolean)
  {
    mActionBar.setDisplayShowHomeEnabled(paramBoolean);
  }
  
  public void setDisplayShowTitleEnabled(boolean paramBoolean)
  {
    mActionBar.setDisplayShowTitleEnabled(paramBoolean);
  }
  
  public void setDisplayUseLogoEnabled(boolean paramBoolean)
  {
    mActionBar.setDisplayUseLogoEnabled(paramBoolean);
  }
  
  public void setHomeActionContentDescription(int paramInt) {}
  
  public void setHomeAsUpIndicator(Drawable paramDrawable)
  {
    Object localObject1 = mActivity.findViewById(16908332);
    if (localObject1 == null) {}
    for (;;)
    {
      return;
      Object localObject2 = (ViewGroup)((View)localObject1).getParent();
      if (((ViewGroup)localObject2).getChildCount() == 2)
      {
        localObject1 = ((ViewGroup)localObject2).getChildAt(0);
        localObject2 = ((ViewGroup)localObject2).getChildAt(1);
        if (((View)localObject1).getId() == 16908332) {
          localObject1 = localObject2;
        }
        while ((localObject1 instanceof ImageView))
        {
          ((ImageView)localObject1).setImageDrawable(paramDrawable);
          return;
        }
      }
    }
  }
  
  public void setHomeButtonEnabled(boolean paramBoolean)
  {
    mActionBar.setHomeButtonEnabled(paramBoolean);
  }
  
  public void setIcon(int paramInt)
  {
    mActionBar.setIcon(paramInt);
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mActionBar.setIcon(paramDrawable);
  }
  
  public void setListNavigationCallbacks(SpinnerAdapter paramSpinnerAdapter, com.actionbarsherlock.app.ActionBar.OnNavigationListener paramOnNavigationListener)
  {
    mNavigationListener = paramOnNavigationListener;
    android.app.ActionBar localActionBar = mActionBar;
    if (paramOnNavigationListener != null) {}
    for (paramOnNavigationListener = this;; paramOnNavigationListener = null)
    {
      localActionBar.setListNavigationCallbacks(paramSpinnerAdapter, paramOnNavigationListener);
      return;
    }
  }
  
  public void setLogo(int paramInt)
  {
    mActionBar.setLogo(paramInt);
  }
  
  public void setLogo(Drawable paramDrawable)
  {
    mActionBar.setLogo(paramDrawable);
  }
  
  public void setNavigationMode(int paramInt)
  {
    mActionBar.setNavigationMode(paramInt);
  }
  
  public void setSelectedNavigationItem(int paramInt)
  {
    mActionBar.setSelectedNavigationItem(paramInt);
  }
  
  public void setSplitBackgroundDrawable(Drawable paramDrawable)
  {
    mActionBar.setSplitBackgroundDrawable(paramDrawable);
  }
  
  public void setStackedBackgroundDrawable(Drawable paramDrawable)
  {
    mActionBar.setStackedBackgroundDrawable(paramDrawable);
  }
  
  public void setSubtitle(int paramInt)
  {
    mActionBar.setSubtitle(paramInt);
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    mActionBar.setSubtitle(paramCharSequence);
  }
  
  public void setTitle(int paramInt)
  {
    mActionBar.setTitle(paramInt);
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mActionBar.setTitle(paramCharSequence);
  }
  
  public void show()
  {
    mActionBar.show();
  }
  
  public class TabWrapper
    extends com.actionbarsherlock.app.ActionBar.Tab
    implements android.app.ActionBar.TabListener
  {
    private com.actionbarsherlock.app.ActionBar.TabListener mListener;
    final android.app.ActionBar.Tab mNativeTab;
    private Object mTag;
    
    public TabWrapper(android.app.ActionBar.Tab paramTab)
    {
      mNativeTab = paramTab;
      mNativeTab.setTag(this);
    }
    
    public CharSequence getContentDescription()
    {
      return mNativeTab.getContentDescription();
    }
    
    public View getCustomView()
    {
      return mNativeTab.getCustomView();
    }
    
    public Drawable getIcon()
    {
      return mNativeTab.getIcon();
    }
    
    public int getPosition()
    {
      return mNativeTab.getPosition();
    }
    
    public Object getTag()
    {
      return mTag;
    }
    
    public CharSequence getText()
    {
      return mNativeTab.getText();
    }
    
    public void onTabReselected(android.app.ActionBar.Tab paramTab, android.app.FragmentTransaction paramFragmentTransaction)
    {
      if (mListener != null)
      {
        paramTab = null;
        if ((mActivity instanceof FragmentActivity)) {
          paramTab = ((FragmentActivity)mActivity).getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
        }
        mListener.onTabReselected(this, paramTab);
        if ((paramTab != null) && (!paramTab.isEmpty())) {
          paramTab.commit();
        }
      }
    }
    
    public void onTabSelected(android.app.ActionBar.Tab paramTab, android.app.FragmentTransaction paramFragmentTransaction)
    {
      if (mListener != null)
      {
        if ((mFragmentTransaction == null) && ((mActivity instanceof FragmentActivity))) {
          ActionBarWrapper.access$102(ActionBarWrapper.this, ((FragmentActivity)mActivity).getSupportFragmentManager().beginTransaction().disallowAddToBackStack());
        }
        mListener.onTabSelected(this, mFragmentTransaction);
        if (mFragmentTransaction != null)
        {
          if (!mFragmentTransaction.isEmpty()) {
            mFragmentTransaction.commit();
          }
          ActionBarWrapper.access$102(ActionBarWrapper.this, null);
        }
      }
    }
    
    public void onTabUnselected(android.app.ActionBar.Tab paramTab, android.app.FragmentTransaction paramFragmentTransaction)
    {
      if (mListener != null)
      {
        paramTab = null;
        if ((mActivity instanceof FragmentActivity))
        {
          paramTab = ((FragmentActivity)mActivity).getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
          ActionBarWrapper.access$102(ActionBarWrapper.this, paramTab);
        }
        mListener.onTabUnselected(this, paramTab);
      }
    }
    
    public void select()
    {
      mNativeTab.select();
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setContentDescription(int paramInt)
    {
      mNativeTab.setContentDescription(paramInt);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setContentDescription(CharSequence paramCharSequence)
    {
      mNativeTab.setContentDescription(paramCharSequence);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setCustomView(int paramInt)
    {
      mNativeTab.setCustomView(paramInt);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setCustomView(View paramView)
    {
      mNativeTab.setCustomView(paramView);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setIcon(int paramInt)
    {
      mNativeTab.setIcon(paramInt);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setIcon(Drawable paramDrawable)
    {
      mNativeTab.setIcon(paramDrawable);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setTabListener(com.actionbarsherlock.app.ActionBar.TabListener paramTabListener)
    {
      android.app.ActionBar.Tab localTab = mNativeTab;
      if (paramTabListener != null) {}
      for (TabWrapper localTabWrapper = this;; localTabWrapper = null)
      {
        localTab.setTabListener(localTabWrapper);
        mListener = paramTabListener;
        return this;
      }
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setTag(Object paramObject)
    {
      mTag = paramObject;
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setText(int paramInt)
    {
      mNativeTab.setText(paramInt);
      return this;
    }
    
    public com.actionbarsherlock.app.ActionBar.Tab setText(CharSequence paramCharSequence)
    {
      mNativeTab.setText(paramCharSequence);
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.app.ActionBarWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */