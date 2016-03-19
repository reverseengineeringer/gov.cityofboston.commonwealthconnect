package com.actionbarsherlock.internal.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.SpinnerAdapter;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.R.bool;
import com.actionbarsherlock.R.id;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.ActionBar.LayoutParams;
import com.actionbarsherlock.app.ActionBar.OnMenuVisibilityListener;
import com.actionbarsherlock.app.ActionBar.OnNavigationListener;
import com.actionbarsherlock.app.ActionBar.Tab;
import com.actionbarsherlock.app.ActionBar.TabListener;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorListenerAdapter;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet.Builder;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineFrameLayout;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback;
import com.actionbarsherlock.internal.view.menu.MenuPopupHelper;
import com.actionbarsherlock.internal.view.menu.SubMenuBuilder;
import com.actionbarsherlock.internal.widget.ActionBarContainer;
import com.actionbarsherlock.internal.widget.ActionBarContextView;
import com.actionbarsherlock.internal.widget.ActionBarView;
import com.actionbarsherlock.internal.widget.ScrollingTabContainerView;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.ActionMode.Callback;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class ActionBarImpl
  extends ActionBar
{
  private static final int CONTEXT_DISPLAY_NORMAL = 0;
  private static final int CONTEXT_DISPLAY_SPLIT = 1;
  private static final int INVALID_POSITION = -1;
  ActionModeImpl mActionMode;
  private ActionBarView mActionView;
  private Activity mActivity;
  private ActionBarContainer mContainerView;
  private NineFrameLayout mContentView;
  private Context mContext;
  private int mContextDisplayMode;
  private ActionBarContextView mContextView;
  private Animator mCurrentModeAnim;
  private Animator mCurrentShowAnim;
  ActionMode mDeferredDestroyActionMode;
  ActionMode.Callback mDeferredModeDestroyCallback;
  final Handler mHandler = new Handler();
  private boolean mHasEmbeddedTabs;
  final Animator.AnimatorListener mHideListener = new AnimatorListenerAdapter()
  {
    public void onAnimationEnd(Animator paramAnonymousAnimator)
    {
      if (mContentView != null)
      {
        mContentView.setTranslationY(0.0F);
        mContainerView.setTranslationY(0.0F);
      }
      if ((mSplitView != null) && (mContextDisplayMode == 1)) {
        mSplitView.setVisibility(8);
      }
      mContainerView.setVisibility(8);
      mContainerView.setTransitioning(false);
      ActionBarImpl.access$402(ActionBarImpl.this, null);
      completeDeferredDestroyActionMode();
    }
  };
  private boolean mLastMenuVisibility;
  private ArrayList<ActionBar.OnMenuVisibilityListener> mMenuVisibilityListeners = new ArrayList();
  private int mSavedTabPosition = -1;
  private TabImpl mSelectedTab;
  private boolean mShowHideAnimationEnabled;
  final Animator.AnimatorListener mShowListener = new AnimatorListenerAdapter()
  {
    public void onAnimationEnd(Animator paramAnonymousAnimator)
    {
      ActionBarImpl.access$402(ActionBarImpl.this, null);
      mContainerView.requestLayout();
    }
  };
  private ActionBarContainer mSplitView;
  private ScrollingTabContainerView mTabScrollView;
  Runnable mTabSelector;
  private ArrayList<TabImpl> mTabs = new ArrayList();
  private Context mThemedContext;
  boolean mWasHiddenBeforeMode;
  
  public ActionBarImpl(Activity paramActivity, int paramInt)
  {
    mActivity = paramActivity;
    paramActivity = paramActivity.getWindow().getDecorView();
    init(paramActivity);
    if ((paramInt & 0x200) == 0) {
      mContentView = ((NineFrameLayout)paramActivity.findViewById(16908290));
    }
  }
  
  public ActionBarImpl(Dialog paramDialog)
  {
    init(paramDialog.getWindow().getDecorView());
  }
  
  private void cleanupTabs()
  {
    if (mSelectedTab != null) {
      selectTab(null);
    }
    mTabs.clear();
    if (mTabScrollView != null) {
      mTabScrollView.removeAllTabs();
    }
    mSavedTabPosition = -1;
  }
  
  private void configureTab(ActionBar.Tab paramTab, int paramInt)
  {
    paramTab = (TabImpl)paramTab;
    if (paramTab.getCallback() == null) {
      throw new IllegalStateException("Action Bar Tab must have a Callback");
    }
    paramTab.setPosition(paramInt);
    mTabs.add(paramInt, paramTab);
    int i = mTabs.size();
    paramInt += 1;
    while (paramInt < i)
    {
      ((TabImpl)mTabs.get(paramInt)).setPosition(paramInt);
      paramInt += 1;
    }
  }
  
  private void ensureTabsExist()
  {
    int i = 0;
    if (mTabScrollView != null) {
      return;
    }
    ScrollingTabContainerView localScrollingTabContainerView = new ScrollingTabContainerView(mContext);
    if (mHasEmbeddedTabs)
    {
      localScrollingTabContainerView.setVisibility(0);
      mActionView.setEmbeddedTabView(localScrollingTabContainerView);
      mTabScrollView = localScrollingTabContainerView;
      return;
    }
    if (getNavigationMode() == 2) {}
    for (;;)
    {
      localScrollingTabContainerView.setVisibility(i);
      mContainerView.setTabContainer(localScrollingTabContainerView);
      break;
      i = 8;
    }
  }
  
  private void init(View paramView)
  {
    int j = 1;
    mContext = paramView.getContext();
    mActionView = ((ActionBarView)paramView.findViewById(R.id.abs__action_bar));
    mContextView = ((ActionBarContextView)paramView.findViewById(R.id.abs__action_context_bar));
    mContainerView = ((ActionBarContainer)paramView.findViewById(R.id.abs__action_bar_container));
    mSplitView = ((ActionBarContainer)paramView.findViewById(R.id.abs__split_action_bar));
    if ((mActionView == null) || (mContextView == null) || (mContainerView == null)) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with a compatible window decor layout");
    }
    mActionView.setContextView(mContextView);
    int i;
    if (mActionView.isSplitActionBar())
    {
      i = 1;
      mContextDisplayMode = i;
      if (mContext.getApplicationInfo().targetSdkVersion >= 14) {
        break label211;
      }
      i = 1;
      label172:
      if ((mActionView.getDisplayOptions() & 0x4) == 0) {
        break label216;
      }
    }
    for (;;)
    {
      setHomeButtonEnabled(i | j);
      setHasEmbeddedTabs(ResourcesCompat.getResources_getBoolean(mContext, R.bool.abs__action_bar_embed_tabs));
      return;
      i = 0;
      break;
      label211:
      i = 0;
      break label172;
      label216:
      j = 0;
    }
  }
  
  private void setHasEmbeddedTabs(boolean paramBoolean)
  {
    boolean bool = true;
    mHasEmbeddedTabs = paramBoolean;
    int i;
    label44:
    Object localObject;
    int j;
    if (!mHasEmbeddedTabs)
    {
      mActionView.setEmbeddedTabView(null);
      mContainerView.setTabContainer(mTabScrollView);
      if (getNavigationMode() != 2) {
        break label118;
      }
      i = 1;
      if (mTabScrollView != null)
      {
        localObject = mTabScrollView;
        if (i == 0) {
          break label123;
        }
        j = 0;
        label63:
        ((ScrollingTabContainerView)localObject).setVisibility(j);
      }
      localObject = mActionView;
      if ((mHasEmbeddedTabs) || (i == 0)) {
        break label129;
      }
    }
    label118:
    label123:
    label129:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      ((ActionBarView)localObject).setCollapsable(paramBoolean);
      return;
      mContainerView.setTabContainer(null);
      mActionView.setEmbeddedTabView(mTabScrollView);
      break;
      i = 0;
      break label44;
      j = 8;
      break label63;
    }
  }
  
  public void addOnMenuVisibilityListener(ActionBar.OnMenuVisibilityListener paramOnMenuVisibilityListener)
  {
    mMenuVisibilityListeners.add(paramOnMenuVisibilityListener);
  }
  
  public void addTab(ActionBar.Tab paramTab)
  {
    addTab(paramTab, mTabs.isEmpty());
  }
  
  public void addTab(ActionBar.Tab paramTab, int paramInt)
  {
    addTab(paramTab, paramInt, mTabs.isEmpty());
  }
  
  public void addTab(ActionBar.Tab paramTab, int paramInt, boolean paramBoolean)
  {
    ensureTabsExist();
    mTabScrollView.addTab(paramTab, paramInt, paramBoolean);
    configureTab(paramTab, paramInt);
    if (paramBoolean) {
      selectTab(paramTab);
    }
  }
  
  public void addTab(ActionBar.Tab paramTab, boolean paramBoolean)
  {
    ensureTabsExist();
    mTabScrollView.addTab(paramTab, paramBoolean);
    configureTab(paramTab, mTabs.size());
    if (paramBoolean) {
      selectTab(paramTab);
    }
  }
  
  void animateToMode(boolean paramBoolean)
  {
    int j = 8;
    if (paramBoolean) {
      show(false);
    }
    if (mCurrentModeAnim != null) {
      mCurrentModeAnim.end();
    }
    Object localObject = mActionView;
    if (paramBoolean)
    {
      i = 8;
      ((ActionBarView)localObject).animateToVisibility(i);
      localObject = mContextView;
      if (!paramBoolean) {
        break label114;
      }
      i = 0;
      label57:
      ((ActionBarContextView)localObject).animateToVisibility(i);
      if ((mTabScrollView != null) && (!mActionView.hasEmbeddedTabs()) && (mActionView.isCollapsed()))
      {
        localObject = mTabScrollView;
        if (!paramBoolean) {
          break label120;
        }
      }
    }
    label114:
    label120:
    for (int i = j;; i = 0)
    {
      ((ScrollingTabContainerView)localObject).animateToVisibility(i);
      return;
      i = 0;
      break;
      i = 8;
      break label57;
    }
  }
  
  void completeDeferredDestroyActionMode()
  {
    if (mDeferredModeDestroyCallback != null)
    {
      mDeferredModeDestroyCallback.onDestroyActionMode(mDeferredDestroyActionMode);
      mDeferredDestroyActionMode = null;
      mDeferredModeDestroyCallback = null;
    }
  }
  
  public void dispatchMenuVisibilityChanged(boolean paramBoolean)
  {
    if (paramBoolean == mLastMenuVisibility) {}
    for (;;)
    {
      return;
      mLastMenuVisibility = paramBoolean;
      int j = mMenuVisibilityListeners.size();
      int i = 0;
      while (i < j)
      {
        ((ActionBar.OnMenuVisibilityListener)mMenuVisibilityListeners.get(i)).onMenuVisibilityChanged(paramBoolean);
        i += 1;
      }
    }
  }
  
  public View getCustomView()
  {
    return mActionView.getCustomNavigationView();
  }
  
  public int getDisplayOptions()
  {
    return mActionView.getDisplayOptions();
  }
  
  public int getHeight()
  {
    return mContainerView.getHeight();
  }
  
  public int getNavigationItemCount()
  {
    switch (mActionView.getNavigationMode())
    {
    }
    SpinnerAdapter localSpinnerAdapter;
    do
    {
      return 0;
      return mTabs.size();
      localSpinnerAdapter = mActionView.getDropdownAdapter();
    } while (localSpinnerAdapter == null);
    return localSpinnerAdapter.getCount();
  }
  
  public int getNavigationMode()
  {
    return mActionView.getNavigationMode();
  }
  
  public int getSelectedNavigationIndex()
  {
    switch (mActionView.getNavigationMode())
    {
    default: 
    case 2: 
      do
      {
        return -1;
      } while (mSelectedTab == null);
      return mSelectedTab.getPosition();
    }
    return mActionView.getDropdownSelectedPosition();
  }
  
  public ActionBar.Tab getSelectedTab()
  {
    return mSelectedTab;
  }
  
  public CharSequence getSubtitle()
  {
    return mActionView.getSubtitle();
  }
  
  public ActionBar.Tab getTabAt(int paramInt)
  {
    return (ActionBar.Tab)mTabs.get(paramInt);
  }
  
  public int getTabCount()
  {
    return mTabs.size();
  }
  
  public Context getThemedContext()
  {
    int i;
    if (mThemedContext == null)
    {
      TypedValue localTypedValue = new TypedValue();
      mContext.getTheme().resolveAttribute(R.attr.actionBarWidgetTheme, localTypedValue, true);
      i = resourceId;
      if (i == 0) {
        break label61;
      }
    }
    label61:
    for (mThemedContext = new ContextThemeWrapper(mContext, i);; mThemedContext = mContext) {
      return mThemedContext;
    }
  }
  
  public CharSequence getTitle()
  {
    return mActionView.getTitle();
  }
  
  public void hide()
  {
    if (mCurrentShowAnim != null) {
      mCurrentShowAnim.end();
    }
    if (mContainerView.getVisibility() == 8) {
      return;
    }
    if (mShowHideAnimationEnabled)
    {
      mContainerView.setAlpha(1.0F);
      mContainerView.setTransitioning(true);
      AnimatorSet localAnimatorSet = new AnimatorSet();
      AnimatorSet.Builder localBuilder = localAnimatorSet.play(ObjectAnimator.ofFloat(mContainerView, "alpha", new float[] { 0.0F }));
      if (mContentView != null)
      {
        localBuilder.with(ObjectAnimator.ofFloat(mContentView, "translationY", new float[] { 0.0F, -mContainerView.getHeight() }));
        localBuilder.with(ObjectAnimator.ofFloat(mContainerView, "translationY", new float[] { -mContainerView.getHeight() }));
      }
      if ((mSplitView != null) && (mSplitView.getVisibility() == 0))
      {
        mSplitView.setAlpha(1.0F);
        localBuilder.with(ObjectAnimator.ofFloat(mSplitView, "alpha", new float[] { 0.0F }));
      }
      localAnimatorSet.addListener(mHideListener);
      mCurrentShowAnim = localAnimatorSet;
      localAnimatorSet.start();
      return;
    }
    mHideListener.onAnimationEnd(null);
  }
  
  public boolean isShowing()
  {
    return mContainerView.getVisibility() == 0;
  }
  
  public ActionBar.Tab newTab()
  {
    return new TabImpl();
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    setHasEmbeddedTabs(ResourcesCompat.getResources_getBoolean(mContext, R.bool.abs__action_bar_embed_tabs));
    if (Build.VERSION.SDK_INT < 8)
    {
      mActionView.onConfigurationChanged(paramConfiguration);
      if (mContextView != null) {
        mContextView.onConfigurationChanged(paramConfiguration);
      }
    }
  }
  
  public void removeAllTabs()
  {
    cleanupTabs();
  }
  
  public void removeOnMenuVisibilityListener(ActionBar.OnMenuVisibilityListener paramOnMenuVisibilityListener)
  {
    mMenuVisibilityListeners.remove(paramOnMenuVisibilityListener);
  }
  
  public void removeTab(ActionBar.Tab paramTab)
  {
    removeTabAt(paramTab.getPosition());
  }
  
  public void removeTabAt(int paramInt)
  {
    if (mTabScrollView == null) {}
    int i;
    do
    {
      return;
      if (mSelectedTab != null) {}
      for (i = mSelectedTab.getPosition();; i = mSavedTabPosition)
      {
        mTabScrollView.removeTabAt(paramInt);
        localTabImpl = (TabImpl)mTabs.remove(paramInt);
        if (localTabImpl != null) {
          localTabImpl.setPosition(-1);
        }
        int k = mTabs.size();
        int j = paramInt;
        while (j < k)
        {
          ((TabImpl)mTabs.get(j)).setPosition(j);
          j += 1;
        }
      }
    } while (i != paramInt);
    if (mTabs.isEmpty()) {}
    for (TabImpl localTabImpl = null;; localTabImpl = (TabImpl)mTabs.get(Math.max(0, paramInt - 1)))
    {
      selectTab(localTabImpl);
      return;
    }
  }
  
  public void selectTab(ActionBar.Tab paramTab)
  {
    int i = -1;
    if (getNavigationMode() != 2) {
      if (paramTab != null)
      {
        i = paramTab.getPosition();
        mSavedTabPosition = i;
      }
    }
    for (;;)
    {
      return;
      i = -1;
      break;
      FragmentTransaction localFragmentTransaction = null;
      if ((mActivity instanceof FragmentActivity)) {
        localFragmentTransaction = ((FragmentActivity)mActivity).getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
      }
      if (mSelectedTab == paramTab) {
        if (mSelectedTab != null)
        {
          mSelectedTab.getCallback().onTabReselected(mSelectedTab, localFragmentTransaction);
          mTabScrollView.animateToTab(paramTab.getPosition());
        }
      }
      while ((localFragmentTransaction != null) && (!localFragmentTransaction.isEmpty()))
      {
        localFragmentTransaction.commit();
        return;
        ScrollingTabContainerView localScrollingTabContainerView = mTabScrollView;
        if (paramTab != null) {
          i = paramTab.getPosition();
        }
        localScrollingTabContainerView.setTabSelected(i);
        if (mSelectedTab != null) {
          mSelectedTab.getCallback().onTabUnselected(mSelectedTab, localFragmentTransaction);
        }
        mSelectedTab = ((TabImpl)paramTab);
        if (mSelectedTab != null) {
          mSelectedTab.getCallback().onTabSelected(mSelectedTab, localFragmentTransaction);
        }
      }
    }
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    mContainerView.setPrimaryBackground(paramDrawable);
  }
  
  public void setCustomView(int paramInt)
  {
    setCustomView(LayoutInflater.from(getThemedContext()).inflate(paramInt, mActionView, false));
  }
  
  public void setCustomView(View paramView)
  {
    mActionView.setCustomNavigationView(paramView);
  }
  
  public void setCustomView(View paramView, ActionBar.LayoutParams paramLayoutParams)
  {
    paramView.setLayoutParams(paramLayoutParams);
    mActionView.setCustomNavigationView(paramView);
  }
  
  public void setDisplayHomeAsUpEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 4;; i = 0)
    {
      setDisplayOptions(i, 4);
      return;
    }
  }
  
  public void setDisplayOptions(int paramInt)
  {
    mActionView.setDisplayOptions(paramInt);
  }
  
  public void setDisplayOptions(int paramInt1, int paramInt2)
  {
    int i = mActionView.getDisplayOptions();
    mActionView.setDisplayOptions(paramInt1 & paramInt2 | (paramInt2 ^ 0xFFFFFFFF) & i);
  }
  
  public void setDisplayShowCustomEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 16;; i = 0)
    {
      setDisplayOptions(i, 16);
      return;
    }
  }
  
  public void setDisplayShowHomeEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 2;; i = 0)
    {
      setDisplayOptions(i, 2);
      return;
    }
  }
  
  public void setDisplayShowTitleEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 8;; i = 0)
    {
      setDisplayOptions(i, 8);
      return;
    }
  }
  
  public void setDisplayUseLogoEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      setDisplayOptions(i, 1);
      return;
    }
  }
  
  public void setHomeActionContentDescription(int paramInt)
  {
    mActionView.setHomeButtonContentDescription(paramInt);
  }
  
  public void setHomeAsUpIndicator(Drawable paramDrawable)
  {
    Object localObject1 = mActivity.findViewById(R.id.abs__home);
    if (localObject1 == null) {}
    for (;;)
    {
      return;
      Object localObject2 = (ViewGroup)((View)localObject1).getParent();
      if (((ViewGroup)localObject2).getChildCount() == 2)
      {
        localObject1 = ((ViewGroup)localObject2).getChildAt(0);
        localObject2 = ((ViewGroup)localObject2).getChildAt(1);
        if (((View)localObject1).getId() == R.id.abs__home) {
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
    mActionView.setHomeButtonEnabled(paramBoolean);
  }
  
  public void setIcon(int paramInt)
  {
    mActionView.setIcon(paramInt);
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mActionView.setIcon(paramDrawable);
  }
  
  public void setListNavigationCallbacks(SpinnerAdapter paramSpinnerAdapter, ActionBar.OnNavigationListener paramOnNavigationListener)
  {
    mActionView.setDropdownAdapter(paramSpinnerAdapter);
    mActionView.setCallback(paramOnNavigationListener);
  }
  
  public void setLogo(int paramInt)
  {
    mActionView.setLogo(paramInt);
  }
  
  public void setLogo(Drawable paramDrawable)
  {
    mActionView.setLogo(paramDrawable);
  }
  
  public void setNavigationMode(int paramInt)
  {
    boolean bool2 = false;
    switch (mActionView.getNavigationMode())
    {
    default: 
      mActionView.setNavigationMode(paramInt);
      switch (paramInt)
      {
      }
      break;
    }
    for (;;)
    {
      ActionBarView localActionBarView = mActionView;
      boolean bool1 = bool2;
      if (paramInt == 2)
      {
        bool1 = bool2;
        if (!mHasEmbeddedTabs) {
          bool1 = true;
        }
      }
      localActionBarView.setCollapsable(bool1);
      return;
      mSavedTabPosition = getSelectedNavigationIndex();
      selectTab(null);
      mTabScrollView.setVisibility(8);
      break;
      ensureTabsExist();
      mTabScrollView.setVisibility(0);
      if (mSavedTabPosition != -1)
      {
        setSelectedNavigationItem(mSavedTabPosition);
        mSavedTabPosition = -1;
      }
    }
  }
  
  public void setSelectedNavigationItem(int paramInt)
  {
    switch (mActionView.getNavigationMode())
    {
    default: 
      throw new IllegalStateException("setSelectedNavigationItem not valid for current navigation mode");
    case 2: 
      selectTab((ActionBar.Tab)mTabs.get(paramInt));
      return;
    }
    mActionView.setDropdownSelectedPosition(paramInt);
  }
  
  public void setShowHideAnimationEnabled(boolean paramBoolean)
  {
    mShowHideAnimationEnabled = paramBoolean;
    if ((!paramBoolean) && (mCurrentShowAnim != null)) {
      mCurrentShowAnim.end();
    }
  }
  
  public void setSplitBackgroundDrawable(Drawable paramDrawable)
  {
    if (mSplitView != null) {
      mSplitView.setSplitBackground(paramDrawable);
    }
  }
  
  public void setStackedBackgroundDrawable(Drawable paramDrawable)
  {
    mContainerView.setStackedBackground(paramDrawable);
  }
  
  public void setSubtitle(int paramInt)
  {
    setSubtitle(mContext.getString(paramInt));
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    mActionView.setSubtitle(paramCharSequence);
  }
  
  public void setTitle(int paramInt)
  {
    setTitle(mContext.getString(paramInt));
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mActionView.setTitle(paramCharSequence);
  }
  
  public void show()
  {
    show(true);
  }
  
  void show(boolean paramBoolean)
  {
    if (mCurrentShowAnim != null) {
      mCurrentShowAnim.end();
    }
    if (mContainerView.getVisibility() == 0)
    {
      if (paramBoolean) {
        mWasHiddenBeforeMode = false;
      }
      return;
    }
    mContainerView.setVisibility(0);
    if (mShowHideAnimationEnabled)
    {
      mContainerView.setAlpha(0.0F);
      AnimatorSet localAnimatorSet = new AnimatorSet();
      AnimatorSet.Builder localBuilder = localAnimatorSet.play(ObjectAnimator.ofFloat(mContainerView, "alpha", new float[] { 1.0F }));
      if (mContentView != null)
      {
        localBuilder.with(ObjectAnimator.ofFloat(mContentView, "translationY", new float[] { -mContainerView.getHeight(), 0.0F }));
        mContainerView.setTranslationY(-mContainerView.getHeight());
        localBuilder.with(ObjectAnimator.ofFloat(mContainerView, "translationY", new float[] { 0.0F }));
      }
      if ((mSplitView != null) && (mContextDisplayMode == 1))
      {
        mSplitView.setAlpha(0.0F);
        mSplitView.setVisibility(0);
        localBuilder.with(ObjectAnimator.ofFloat(mSplitView, "alpha", new float[] { 1.0F }));
      }
      localAnimatorSet.addListener(mShowListener);
      mCurrentShowAnim = localAnimatorSet;
      localAnimatorSet.start();
      return;
    }
    mContainerView.setAlpha(1.0F);
    mContainerView.setTranslationY(0.0F);
    mShowListener.onAnimationEnd(null);
  }
  
  public ActionMode startActionMode(ActionMode.Callback paramCallback)
  {
    boolean bool = false;
    if (mActionMode != null)
    {
      bool = mWasHiddenBeforeMode;
      mActionMode.finish();
    }
    mContextView.killMode();
    paramCallback = new ActionModeImpl(paramCallback);
    if (paramCallback.dispatchOnCreate())
    {
      if ((!isShowing()) || (bool)) {}
      for (bool = true;; bool = false)
      {
        mWasHiddenBeforeMode = bool;
        paramCallback.invalidate();
        mContextView.initForMode(paramCallback);
        animateToMode(true);
        if ((mSplitView != null) && (mContextDisplayMode == 1)) {
          mSplitView.setVisibility(0);
        }
        mContextView.sendAccessibilityEvent(32);
        mActionMode = paramCallback;
        return paramCallback;
      }
    }
    return null;
  }
  
  public class ActionModeImpl
    extends ActionMode
    implements MenuBuilder.Callback
  {
    private ActionMode.Callback mCallback;
    private WeakReference<View> mCustomView;
    private MenuBuilder mMenu;
    
    public ActionModeImpl(ActionMode.Callback paramCallback)
    {
      mCallback = paramCallback;
      mMenu = new MenuBuilder(getThemedContext()).setDefaultShowAsAction(1);
      mMenu.setCallback(this);
    }
    
    public boolean dispatchOnCreate()
    {
      mMenu.stopDispatchingItemsChanged();
      try
      {
        boolean bool = mCallback.onCreateActionMode(this, mMenu);
        return bool;
      }
      finally
      {
        mMenu.startDispatchingItemsChanged();
      }
    }
    
    public void finish()
    {
      if (mActionMode != this) {
        return;
      }
      if (mWasHiddenBeforeMode)
      {
        mDeferredDestroyActionMode = this;
        mDeferredModeDestroyCallback = mCallback;
      }
      for (;;)
      {
        mCallback = null;
        animateToMode(false);
        mContextView.closeMode();
        mActionView.sendAccessibilityEvent(32);
        mActionMode = null;
        if (!mWasHiddenBeforeMode) {
          break;
        }
        hide();
        return;
        mCallback.onDestroyActionMode(this);
      }
    }
    
    public View getCustomView()
    {
      if (mCustomView != null) {
        return (View)mCustomView.get();
      }
      return null;
    }
    
    public Menu getMenu()
    {
      return mMenu;
    }
    
    public MenuInflater getMenuInflater()
    {
      return new MenuInflater(getThemedContext());
    }
    
    public CharSequence getSubtitle()
    {
      return mContextView.getSubtitle();
    }
    
    public CharSequence getTitle()
    {
      return mContextView.getTitle();
    }
    
    public void invalidate()
    {
      mMenu.stopDispatchingItemsChanged();
      try
      {
        mCallback.onPrepareActionMode(this, mMenu);
        return;
      }
      finally
      {
        mMenu.startDispatchingItemsChanged();
      }
    }
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean) {}
    
    public void onCloseSubMenu(SubMenuBuilder paramSubMenuBuilder) {}
    
    public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
    {
      if (mCallback != null) {
        return mCallback.onActionItemClicked(this, paramMenuItem);
      }
      return false;
    }
    
    public void onMenuModeChange(MenuBuilder paramMenuBuilder)
    {
      if (mCallback == null) {
        return;
      }
      invalidate();
      mContextView.showOverflowMenu();
    }
    
    public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
    {
      boolean bool = true;
      if (mCallback == null) {
        bool = false;
      }
      while (!paramSubMenuBuilder.hasVisibleItems()) {
        return bool;
      }
      new MenuPopupHelper(getThemedContext(), paramSubMenuBuilder).show();
      return true;
    }
    
    public void setCustomView(View paramView)
    {
      mContextView.setCustomView(paramView);
      mCustomView = new WeakReference(paramView);
    }
    
    public void setSubtitle(int paramInt)
    {
      setSubtitle(mContext.getResources().getString(paramInt));
    }
    
    public void setSubtitle(CharSequence paramCharSequence)
    {
      mContextView.setSubtitle(paramCharSequence);
    }
    
    public void setTitle(int paramInt)
    {
      setTitle(mContext.getResources().getString(paramInt));
    }
    
    public void setTitle(CharSequence paramCharSequence)
    {
      mContextView.setTitle(paramCharSequence);
    }
  }
  
  public class TabImpl
    extends ActionBar.Tab
  {
    private ActionBar.TabListener mCallback;
    private CharSequence mContentDesc;
    private View mCustomView;
    private Drawable mIcon;
    private int mPosition = -1;
    private Object mTag;
    private CharSequence mText;
    
    public TabImpl() {}
    
    public ActionBar.TabListener getCallback()
    {
      return mCallback;
    }
    
    public CharSequence getContentDescription()
    {
      return mContentDesc;
    }
    
    public View getCustomView()
    {
      return mCustomView;
    }
    
    public Drawable getIcon()
    {
      return mIcon;
    }
    
    public int getPosition()
    {
      return mPosition;
    }
    
    public Object getTag()
    {
      return mTag;
    }
    
    public CharSequence getText()
    {
      return mText;
    }
    
    public void select()
    {
      selectTab(this);
    }
    
    public ActionBar.Tab setContentDescription(int paramInt)
    {
      return setContentDescription(mContext.getResources().getText(paramInt));
    }
    
    public ActionBar.Tab setContentDescription(CharSequence paramCharSequence)
    {
      mContentDesc = paramCharSequence;
      if (mPosition >= 0) {
        mTabScrollView.updateTab(mPosition);
      }
      return this;
    }
    
    public ActionBar.Tab setCustomView(int paramInt)
    {
      return setCustomView(LayoutInflater.from(getThemedContext()).inflate(paramInt, null));
    }
    
    public ActionBar.Tab setCustomView(View paramView)
    {
      mCustomView = paramView;
      if (mPosition >= 0) {
        mTabScrollView.updateTab(mPosition);
      }
      return this;
    }
    
    public ActionBar.Tab setIcon(int paramInt)
    {
      return setIcon(mContext.getResources().getDrawable(paramInt));
    }
    
    public ActionBar.Tab setIcon(Drawable paramDrawable)
    {
      mIcon = paramDrawable;
      if (mPosition >= 0) {
        mTabScrollView.updateTab(mPosition);
      }
      return this;
    }
    
    public void setPosition(int paramInt)
    {
      mPosition = paramInt;
    }
    
    public ActionBar.Tab setTabListener(ActionBar.TabListener paramTabListener)
    {
      mCallback = paramTabListener;
      return this;
    }
    
    public ActionBar.Tab setTag(Object paramObject)
    {
      mTag = paramObject;
      return this;
    }
    
    public ActionBar.Tab setText(int paramInt)
    {
      return setText(mContext.getResources().getText(paramInt));
    }
    
    public ActionBar.Tab setText(CharSequence paramCharSequence)
    {
      mText = paramCharSequence;
      if (mPosition >= 0) {
        mTabScrollView.updateTab(mPosition);
      }
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.app.ActionBarImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */