package com.actionbarsherlock.internal.widget;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.R.bool;
import com.actionbarsherlock.R.id;
import com.actionbarsherlock.R.layout;
import com.actionbarsherlock.R.string;
import com.actionbarsherlock.R.styleable;
import com.actionbarsherlock.app.ActionBar.LayoutParams;
import com.actionbarsherlock.app.ActionBar.OnNavigationListener;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.view.menu.ActionMenuItem;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import com.actionbarsherlock.internal.view.menu.MenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.internal.view.menu.SubMenuBuilder;
import com.actionbarsherlock.view.CollapsibleActionView;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuItem;
import com.actionbarsherlock.view.Window.Callback;
import java.util.List;

public class ActionBarView
  extends AbsActionBarView
{
  private static final int DEFAULT_CUSTOM_GRAVITY = 19;
  public static final int DISPLAY_DEFAULT = 0;
  private static final int DISPLAY_RELAYOUT_MASK = 31;
  private static final String TAG = "ActionBarView";
  private ActionBar.OnNavigationListener mCallback;
  private ActionBarContextView mContextView;
  private View mCustomNavView;
  private int mDisplayOptions = -1;
  View mExpandedActionView;
  private final View.OnClickListener mExpandedActionViewUpListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      paramAnonymousView = mExpandedMenuPresenter.mCurrentExpandedItem;
      if (paramAnonymousView != null) {
        paramAnonymousView.collapseActionView();
      }
    }
  };
  private HomeView mExpandedHomeLayout;
  private ExpandedActionViewMenuPresenter mExpandedMenuPresenter;
  private HomeView mHomeLayout;
  private Drawable mIcon;
  private boolean mIncludeTabs;
  private int mIndeterminateProgressStyle;
  private IcsProgressBar mIndeterminateProgressView;
  private boolean mIsCollapsable;
  private boolean mIsCollapsed;
  private int mItemPadding;
  private IcsLinearLayout mListNavLayout;
  private Drawable mLogo;
  private ActionMenuItem mLogoNavItem;
  private final IcsAdapterView.OnItemSelectedListener mNavItemSelectedListener = new IcsAdapterView.OnItemSelectedListener()
  {
    public void onItemSelected(IcsAdapterView paramAnonymousIcsAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      if (mCallback != null) {
        mCallback.onNavigationItemSelected(paramAnonymousInt, paramAnonymousLong);
      }
    }
    
    public void onNothingSelected(IcsAdapterView paramAnonymousIcsAdapterView) {}
  };
  private int mNavigationMode;
  private MenuBuilder mOptionsMenu;
  private int mProgressBarPadding;
  private int mProgressStyle;
  private IcsProgressBar mProgressView;
  private IcsSpinner mSpinner;
  private SpinnerAdapter mSpinnerAdapter;
  private CharSequence mSubtitle;
  private int mSubtitleStyleRes;
  private TextView mSubtitleView;
  private ScrollingTabContainerView mTabScrollView;
  private CharSequence mTitle;
  private LinearLayout mTitleLayout;
  private int mTitleStyleRes;
  private View mTitleUpView;
  private TextView mTitleView;
  private final View.OnClickListener mUpClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      mWindowCallback.onMenuItemSelected(0, mLogoNavItem);
    }
  };
  private boolean mUserTitle;
  Window.Callback mWindowCallback;
  
  public ActionBarView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setBackgroundResource(0);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockActionBar, R.attr.actionBarStyle, 0);
    Object localObject = paramContext.getApplicationInfo();
    PackageManager localPackageManager = paramContext.getPackageManager();
    mNavigationMode = paramAttributeSet.getInt(R.styleable.SherlockActionBar_navigationMode, 0);
    mTitle = paramAttributeSet.getText(R.styleable.SherlockActionBar_title);
    mSubtitle = paramAttributeSet.getText(R.styleable.SherlockActionBar_subtitle);
    mLogo = paramAttributeSet.getDrawable(R.styleable.SherlockActionBar_logo);
    int i;
    if (mLogo == null)
    {
      if (Build.VERSION.SDK_INT >= 11) {
        break label501;
      }
      if ((paramContext instanceof Activity))
      {
        i = ResourcesCompat.loadLogoFromManifest((Activity)paramContext);
        if (i != 0) {
          mLogo = paramContext.getResources().getDrawable(i);
        }
      }
    }
    for (;;)
    {
      mIcon = paramAttributeSet.getDrawable(R.styleable.SherlockActionBar_icon);
      if ((mIcon != null) || ((paramContext instanceof Activity))) {}
      try
      {
        mIcon = localPackageManager.getActivityIcon(((Activity)paramContext).getComponentName());
        if (mIcon == null) {
          mIcon = ((ApplicationInfo)localObject).loadIcon(localPackageManager);
        }
        localObject = LayoutInflater.from(paramContext);
        i = paramAttributeSet.getResourceId(R.styleable.SherlockActionBar_homeLayout, R.layout.abs__action_bar_home);
        mHomeLayout = ((HomeView)((LayoutInflater)localObject).inflate(i, this, false));
        mExpandedHomeLayout = ((HomeView)((LayoutInflater)localObject).inflate(i, this, false));
        mExpandedHomeLayout.setUp(true);
        mExpandedHomeLayout.setOnClickListener(mExpandedActionViewUpListener);
        mExpandedHomeLayout.setContentDescription(getResources().getText(R.string.abs__action_bar_up_description));
        mTitleStyleRes = paramAttributeSet.getResourceId(R.styleable.SherlockActionBar_titleTextStyle, 0);
        mSubtitleStyleRes = paramAttributeSet.getResourceId(R.styleable.SherlockActionBar_subtitleTextStyle, 0);
        mProgressStyle = paramAttributeSet.getResourceId(R.styleable.SherlockActionBar_progressBarStyle, 0);
        mIndeterminateProgressStyle = paramAttributeSet.getResourceId(R.styleable.SherlockActionBar_indeterminateProgressStyle, 0);
        mProgressBarPadding = paramAttributeSet.getDimensionPixelOffset(R.styleable.SherlockActionBar_progressBarPadding, 0);
        mItemPadding = paramAttributeSet.getDimensionPixelOffset(R.styleable.SherlockActionBar_itemPadding, 0);
        setDisplayOptions(paramAttributeSet.getInt(R.styleable.SherlockActionBar_displayOptions, 0));
        i = paramAttributeSet.getResourceId(R.styleable.SherlockActionBar_customNavigationLayout, 0);
        if (i != 0)
        {
          mCustomNavView = ((LayoutInflater)localObject).inflate(i, this, false);
          mNavigationMode = 0;
          setDisplayOptions(mDisplayOptions | 0x10);
        }
        mContentHeight = paramAttributeSet.getLayoutDimension(R.styleable.SherlockActionBar_height, 0);
        paramAttributeSet.recycle();
        mLogoNavItem = new ActionMenuItem(paramContext, 0, 16908332, 0, 0, mTitle);
        mHomeLayout.setOnClickListener(mUpClickListener);
        mHomeLayout.setClickable(true);
        mHomeLayout.setFocusable(true);
        return;
        label501:
        if ((paramContext instanceof Activity)) {}
        try
        {
          mLogo = localPackageManager.getActivityLogo(((Activity)paramContext).getComponentName());
          if (mLogo != null) {
            continue;
          }
          mLogo = ((ApplicationInfo)localObject).loadLogo(localPackageManager);
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException1)
        {
          for (;;)
          {
            Log.e("ActionBarView", "Activity component name not found!", localNameNotFoundException1);
          }
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException2)
      {
        for (;;)
        {
          Log.e("ActionBarView", "Activity component name not found!", localNameNotFoundException2);
        }
      }
    }
  }
  
  private void configPresenters(MenuBuilder paramMenuBuilder)
  {
    if (paramMenuBuilder != null)
    {
      paramMenuBuilder.addMenuPresenter(mActionMenuPresenter);
      paramMenuBuilder.addMenuPresenter(mExpandedMenuPresenter);
      return;
    }
    mActionMenuPresenter.initForMenu(mContext, null);
    mExpandedMenuPresenter.initForMenu(mContext, null);
    mActionMenuPresenter.updateMenuView(true);
    mExpandedMenuPresenter.updateMenuView(true);
  }
  
  private void initTitle()
  {
    boolean bool = true;
    int j;
    int k;
    label201:
    Object localObject;
    int i;
    if (mTitleLayout == null)
    {
      mTitleLayout = ((LinearLayout)LayoutInflater.from(getContext()).inflate(R.layout.abs__action_bar_title_item, this, false));
      mTitleView = ((TextView)mTitleLayout.findViewById(R.id.abs__action_bar_title));
      mSubtitleView = ((TextView)mTitleLayout.findViewById(R.id.abs__action_bar_subtitle));
      mTitleUpView = mTitleLayout.findViewById(R.id.abs__up);
      mTitleLayout.setOnClickListener(mUpClickListener);
      if (mTitleStyleRes != 0) {
        mTitleView.setTextAppearance(mContext, mTitleStyleRes);
      }
      if (mTitle != null) {
        mTitleView.setText(mTitle);
      }
      if (mSubtitleStyleRes != 0) {
        mSubtitleView.setTextAppearance(mContext, mSubtitleStyleRes);
      }
      if (mSubtitle != null)
      {
        mSubtitleView.setText(mSubtitle);
        mSubtitleView.setVisibility(0);
      }
      if ((mDisplayOptions & 0x4) == 0) {
        break label289;
      }
      j = 1;
      if ((mDisplayOptions & 0x2) == 0) {
        break label294;
      }
      k = 1;
      localObject = mTitleUpView;
      if (k != 0) {
        break label304;
      }
      if (j == 0) {
        break label299;
      }
      i = 0;
      label217:
      ((View)localObject).setVisibility(i);
      localObject = mTitleLayout;
      if ((j == 0) || (k != 0)) {
        break label310;
      }
    }
    for (;;)
    {
      ((LinearLayout)localObject).setEnabled(bool);
      addView(mTitleLayout);
      if ((mExpandedActionView != null) || ((TextUtils.isEmpty(mTitle)) && (TextUtils.isEmpty(mSubtitle)))) {
        mTitleLayout.setVisibility(8);
      }
      return;
      label289:
      j = 0;
      break;
      label294:
      k = 0;
      break label201;
      label299:
      i = 4;
      break label217;
      label304:
      i = 8;
      break label217;
      label310:
      bool = false;
    }
  }
  
  private void setTitleImpl(CharSequence paramCharSequence)
  {
    int j = 0;
    mTitle = paramCharSequence;
    LinearLayout localLinearLayout;
    if (mTitleView != null)
    {
      mTitleView.setText(paramCharSequence);
      if ((mExpandedActionView != null) || ((mDisplayOptions & 0x8) == 0) || ((TextUtils.isEmpty(mTitle)) && (TextUtils.isEmpty(mSubtitle)))) {
        break label96;
      }
      i = 1;
      localLinearLayout = mTitleLayout;
      if (i == 0) {
        break label101;
      }
    }
    label96:
    label101:
    for (int i = j;; i = 8)
    {
      localLinearLayout.setVisibility(i);
      if (mLogoNavItem != null) {
        mLogoNavItem.setTitle(paramCharSequence);
      }
      return;
      i = 0;
      break;
    }
  }
  
  public void collapseActionView()
  {
    if (mExpandedMenuPresenter == null) {}
    for (MenuItemImpl localMenuItemImpl = null;; localMenuItemImpl = mExpandedMenuPresenter.mCurrentExpandedItem)
    {
      if (localMenuItemImpl != null) {
        localMenuItemImpl.collapseActionView();
      }
      return;
    }
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ActionBar.LayoutParams(19);
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new ActionBar.LayoutParams(getContext(), paramAttributeSet);
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    ViewGroup.LayoutParams localLayoutParams = paramLayoutParams;
    if (paramLayoutParams == null) {
      localLayoutParams = generateDefaultLayoutParams();
    }
    return localLayoutParams;
  }
  
  public View getCustomNavigationView()
  {
    return mCustomNavView;
  }
  
  public int getDisplayOptions()
  {
    return mDisplayOptions;
  }
  
  public SpinnerAdapter getDropdownAdapter()
  {
    return mSpinnerAdapter;
  }
  
  public int getDropdownSelectedPosition()
  {
    return mSpinner.getSelectedItemPosition();
  }
  
  public int getNavigationMode()
  {
    return mNavigationMode;
  }
  
  public CharSequence getSubtitle()
  {
    return mSubtitle;
  }
  
  public CharSequence getTitle()
  {
    return mTitle;
  }
  
  public boolean hasEmbeddedTabs()
  {
    return mIncludeTabs;
  }
  
  public boolean hasExpandedActionView()
  {
    return (mExpandedMenuPresenter != null) && (mExpandedMenuPresenter.mCurrentExpandedItem != null);
  }
  
  public void initIndeterminateProgress()
  {
    mIndeterminateProgressView = new IcsProgressBar(mContext, null, 0, mIndeterminateProgressStyle);
    mIndeterminateProgressView.setId(R.id.abs__progress_circular);
    addView(mIndeterminateProgressView);
  }
  
  public void initProgress()
  {
    mProgressView = new IcsProgressBar(mContext, null, 0, mProgressStyle);
    mProgressView.setId(R.id.abs__progress_horizontal);
    mProgressView.setMax(10000);
    addView(mProgressView);
  }
  
  public boolean isCollapsed()
  {
    return mIsCollapsed;
  }
  
  public boolean isSplitActionBar()
  {
    return mSplitActionBar;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    mTitleView = null;
    mSubtitleView = null;
    mTitleUpView = null;
    if ((mTitleLayout != null) && (mTitleLayout.getParent() == this)) {
      removeView(mTitleLayout);
    }
    mTitleLayout = null;
    if ((mDisplayOptions & 0x8) != 0) {
      initTitle();
    }
    if ((mTabScrollView != null) && (mIncludeTabs))
    {
      paramConfiguration = mTabScrollView.getLayoutParams();
      if (paramConfiguration != null)
      {
        width = -2;
        height = -1;
      }
      mTabScrollView.setAllowCollapse(true);
    }
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mActionMenuPresenter != null)
    {
      mActionMenuPresenter.hideOverflowMenu();
      mActionMenuPresenter.hideSubMenus();
    }
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    addView(mHomeLayout);
    if ((mCustomNavView != null) && ((mDisplayOptions & 0x10) != 0))
    {
      ViewParent localViewParent = mCustomNavView.getParent();
      if (localViewParent != this)
      {
        if ((localViewParent instanceof ViewGroup)) {
          ((ViewGroup)localViewParent).removeView(mCustomNavView);
        }
        addView(mCustomNavView);
      }
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int j = getPaddingLeft();
    int k = getPaddingTop();
    int m = paramInt4 - paramInt2 - getPaddingTop() - getPaddingBottom();
    if (m <= 0) {
      return;
    }
    Object localObject1;
    label47:
    int i;
    label130:
    label195:
    Object localObject2;
    label321:
    label348:
    label360:
    int n;
    if (mExpandedActionView != null)
    {
      localObject1 = mExpandedHomeLayout;
      i = j;
      if (((HomeView)localObject1).getVisibility() != 8)
      {
        paramInt2 = ((HomeView)localObject1).getLeftOffset();
        i = j + (positionChild((View)localObject1, j + paramInt2, k, m) + paramInt2);
      }
      paramInt2 = i;
      if (mExpandedActionView == null)
      {
        if ((mTitleLayout == null) || (mTitleLayout.getVisibility() == 8) || ((mDisplayOptions & 0x8) == 0)) {
          break label636;
        }
        j = 1;
        paramInt4 = i;
        if (j != 0) {
          paramInt4 = i + positionChild(mTitleLayout, i, k, m);
        }
        paramInt2 = paramInt4;
      }
      switch (mNavigationMode)
      {
      default: 
        paramInt2 = paramInt4;
      case 0: 
        paramInt1 = paramInt3 - paramInt1 - getPaddingRight();
        paramInt3 = paramInt1;
        if (mMenuView != null)
        {
          paramInt3 = paramInt1;
          if (mMenuView.getParent() == this)
          {
            positionChildInverse(mMenuView, paramInt1, k, m);
            paramInt3 = paramInt1 - mMenuView.getMeasuredWidth();
          }
        }
        paramInt1 = paramInt3;
        if (mIndeterminateProgressView != null)
        {
          paramInt1 = paramInt3;
          if (mIndeterminateProgressView.getVisibility() != 8)
          {
            positionChildInverse(mIndeterminateProgressView, paramInt3, k, m);
            paramInt1 = paramInt3 - mIndeterminateProgressView.getMeasuredWidth();
          }
        }
        localObject2 = null;
        if (mExpandedActionView != null)
        {
          localObject1 = mExpandedActionView;
          if (localObject1 != null)
          {
            localObject2 = ((View)localObject1).getLayoutParams();
            if (!(localObject2 instanceof ActionBar.LayoutParams)) {
              break label776;
            }
            localObject2 = (ActionBar.LayoutParams)localObject2;
            if (localObject2 == null) {
              break label782;
            }
            paramInt4 = gravity;
            n = ((View)localObject1).getMeasuredWidth();
            i = 0;
            j = 0;
            k = paramInt1;
            paramInt3 = paramInt2;
            if (localObject2 != null)
            {
              paramInt3 = paramInt2 + leftMargin;
              k = paramInt1 - rightMargin;
              i = topMargin;
              j = bottomMargin;
            }
            paramInt2 = paramInt4 & 0x7;
            if (paramInt2 != 1) {
              break label803;
            }
            paramInt1 = (getRight() - getLeft() - n) / 2;
            if (paramInt1 >= paramInt3) {
              break label789;
            }
            paramInt2 = 3;
            label450:
            m = 0;
            paramInt1 = m;
            switch (paramInt2)
            {
            default: 
              paramInt1 = m;
            case 2: 
            case 4: 
              label495:
              paramInt2 = paramInt4 & 0x70;
              if (paramInt4 == -1) {
                paramInt2 = 16;
              }
              paramInt3 = 0;
              switch (paramInt2)
              {
              default: 
                paramInt2 = paramInt3;
              }
              break;
            }
          }
        }
        break;
      }
    }
    for (;;)
    {
      paramInt3 = ((View)localObject1).getMeasuredWidth();
      ((View)localObject1).layout(paramInt1, paramInt2, paramInt1 + paramInt3, ((View)localObject1).getMeasuredHeight() + paramInt2);
      if (mProgressView == null) {
        break;
      }
      mProgressView.bringToFront();
      paramInt1 = mProgressView.getMeasuredHeight() / 2;
      mProgressView.layout(mProgressBarPadding, -paramInt1, mProgressBarPadding + mProgressView.getMeasuredWidth(), paramInt1);
      return;
      localObject1 = mHomeLayout;
      break label47;
      label636:
      j = 0;
      break label130;
      paramInt2 = paramInt4;
      if (mListNavLayout == null) {
        break label195;
      }
      paramInt2 = paramInt4;
      if (j != 0) {
        paramInt2 = paramInt4 + mItemPadding;
      }
      paramInt2 += positionChild(mListNavLayout, paramInt2, k, m) + mItemPadding;
      break label195;
      paramInt2 = paramInt4;
      if (mTabScrollView == null) {
        break label195;
      }
      paramInt2 = paramInt4;
      if (j != 0) {
        paramInt2 = paramInt4 + mItemPadding;
      }
      paramInt2 += positionChild(mTabScrollView, paramInt2, k, m) + mItemPadding;
      break label195;
      localObject1 = localObject2;
      if ((mDisplayOptions & 0x10) == 0) {
        break label321;
      }
      localObject1 = localObject2;
      if (mCustomNavView == null) {
        break label321;
      }
      localObject1 = mCustomNavView;
      break label321;
      label776:
      localObject2 = null;
      break label348;
      label782:
      paramInt4 = 19;
      break label360;
      label789:
      if (paramInt1 + n <= k) {
        break label450;
      }
      paramInt2 = 5;
      break label450;
      label803:
      if (paramInt4 != -1) {
        break label450;
      }
      paramInt2 = 3;
      break label450;
      paramInt1 = (getRight() - getLeft() - n) / 2;
      break label495;
      paramInt1 = paramInt3;
      break label495;
      paramInt1 = k - n;
      break label495;
      paramInt2 = getPaddingTop();
      paramInt2 = (getBottom() - getTop() - getPaddingBottom() - paramInt2 - ((View)localObject1).getMeasuredHeight()) / 2;
      continue;
      paramInt2 = getPaddingTop() + i;
      continue;
      paramInt2 = getHeight() - getPaddingBottom() - ((View)localObject1).getMeasuredHeight() - j;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i5 = getChildCount();
    int j;
    int i;
    Object localObject1;
    int k;
    if (mIsCollapsable)
    {
      j = 0;
      i = 0;
      while (i < i5)
      {
        localObject1 = getChildAt(i);
        k = j;
        if (((View)localObject1).getVisibility() != 8) {
          if (localObject1 == mMenuView)
          {
            k = j;
            if (mMenuView.getChildCount() == 0) {}
          }
          else
          {
            k = j + 1;
          }
        }
        i += 1;
        j = k;
      }
      if (j == 0)
      {
        setMeasuredDimension(0, 0);
        mIsCollapsed = true;
        return;
      }
    }
    mIsCollapsed = false;
    if (View.MeasureSpec.getMode(paramInt1) != 1073741824) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_width=\"match_parent\" (or fill_parent)");
    }
    if (View.MeasureSpec.getMode(paramInt2) != Integer.MIN_VALUE) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_height=\"wrap_content\"");
    }
    int i6 = View.MeasureSpec.getSize(paramInt1);
    int m;
    int i7;
    int i3;
    int i1;
    label293:
    Object localObject2;
    label330:
    int n;
    label527:
    label569:
    label585:
    ViewGroup.LayoutParams localLayoutParams;
    label618:
    int i8;
    label716:
    label735:
    int i4;
    if (mContentHeight > 0)
    {
      m = mContentHeight;
      i7 = getPaddingTop() + getPaddingBottom();
      paramInt1 = getPaddingLeft();
      paramInt2 = getPaddingRight();
      i3 = m - i7;
      i1 = View.MeasureSpec.makeMeasureSpec(i3, Integer.MIN_VALUE);
      k = i6 - paramInt1 - paramInt2;
      i = k / 2;
      j = i;
      if (mExpandedActionView == null) {
        break label929;
      }
      localObject1 = mExpandedHomeLayout;
      paramInt2 = k;
      if (((HomeView)localObject1).getVisibility() != 8)
      {
        localObject2 = ((HomeView)localObject1).getLayoutParams();
        if (width >= 0) {
          break label938;
        }
        paramInt1 = View.MeasureSpec.makeMeasureSpec(k, Integer.MIN_VALUE);
        ((HomeView)localObject1).measure(paramInt1, View.MeasureSpec.makeMeasureSpec(i3, 1073741824));
        paramInt1 = ((HomeView)localObject1).getMeasuredWidth() + ((HomeView)localObject1).getLeftOffset();
        paramInt2 = Math.max(0, k - paramInt1);
        i = Math.max(0, paramInt2 - paramInt1);
      }
      k = paramInt2;
      paramInt1 = j;
      if (mMenuView != null)
      {
        k = paramInt2;
        paramInt1 = j;
        if (mMenuView.getParent() == this)
        {
          k = measureChildView(mMenuView, paramInt2, i1, 0);
          paramInt1 = Math.max(0, j - mMenuView.getMeasuredWidth());
        }
      }
      j = k;
      n = paramInt1;
      if (mIndeterminateProgressView != null)
      {
        j = k;
        n = paramInt1;
        if (mIndeterminateProgressView.getVisibility() != 8)
        {
          j = measureChildView(mIndeterminateProgressView, k, i1, 0);
          n = Math.max(0, paramInt1 - mIndeterminateProgressView.getMeasuredWidth());
        }
      }
      if ((mTitleLayout == null) || (mTitleLayout.getVisibility() == 8) || ((mDisplayOptions & 0x8) == 0)) {
        break label953;
      }
      k = 1;
      paramInt1 = j;
      paramInt2 = i;
      if (mExpandedActionView == null) {}
      switch (mNavigationMode)
      {
      default: 
        paramInt2 = i;
        paramInt1 = j;
        localObject2 = null;
        if (mExpandedActionView != null)
        {
          localObject1 = mExpandedActionView;
          i = paramInt1;
          if (localObject1 != null)
          {
            localLayoutParams = generateLayoutParams(((View)localObject1).getLayoutParams());
            if (!(localLayoutParams instanceof ActionBar.LayoutParams)) {
              break label1195;
            }
            localObject2 = (ActionBar.LayoutParams)localLayoutParams;
            j = 0;
            i1 = 0;
            if (localObject2 != null)
            {
              j = leftMargin + rightMargin;
              i1 = topMargin + bottomMargin;
            }
            if (mContentHeight > 0) {
              break label1201;
            }
            i = Integer.MIN_VALUE;
            i2 = i3;
            if (height >= 0) {
              i2 = Math.min(height, i3);
            }
            i8 = Math.max(0, i2 - i1);
            if (width == -2) {
              break label1225;
            }
            i1 = 1073741824;
            if (width < 0) {
              break label1233;
            }
            i2 = Math.min(width, paramInt1);
            i4 = Math.max(0, i2 - j);
            if (localObject2 == null) {
              break label1239;
            }
          }
        }
        break;
      }
    }
    label929:
    label938:
    label953:
    label1195:
    label1201:
    label1225:
    label1233:
    label1239:
    for (int i2 = gravity;; i2 = 19)
    {
      i3 = i4;
      if ((i2 & 0x7) == 1)
      {
        i3 = i4;
        if (width == -1) {
          i3 = Math.min(paramInt2, n) * 2;
        }
      }
      ((View)localObject1).measure(View.MeasureSpec.makeMeasureSpec(i3, i1), View.MeasureSpec.makeMeasureSpec(i8, i));
      i = paramInt1 - (((View)localObject1).getMeasuredWidth() + j);
      if ((mExpandedActionView == null) && (k != 0))
      {
        measureChildView(mTitleLayout, i, View.MeasureSpec.makeMeasureSpec(mContentHeight, 1073741824), 0);
        Math.max(0, paramInt2 - mTitleLayout.getMeasuredWidth());
      }
      if (mContentHeight > 0) {
        break label1323;
      }
      paramInt2 = 0;
      paramInt1 = 0;
      while (paramInt1 < i5)
      {
        j = getChildAt(paramInt1).getMeasuredHeight() + i7;
        i = paramInt2;
        if (j > paramInt2) {
          i = j;
        }
        paramInt1 += 1;
        paramInt2 = i;
      }
      m = View.MeasureSpec.getSize(paramInt2);
      break;
      localObject1 = mHomeLayout;
      break label293;
      paramInt1 = View.MeasureSpec.makeMeasureSpec(width, 1073741824);
      break label330;
      k = 0;
      break label527;
      paramInt1 = j;
      paramInt2 = i;
      if (mListNavLayout == null) {
        break label569;
      }
      if (k != 0) {}
      for (paramInt1 = mItemPadding * 2;; paramInt1 = mItemPadding)
      {
        paramInt2 = Math.max(0, j - paramInt1);
        i = Math.max(0, i - paramInt1);
        mListNavLayout.measure(View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE), View.MeasureSpec.makeMeasureSpec(i3, 1073741824));
        j = mListNavLayout.getMeasuredWidth();
        paramInt1 = Math.max(0, paramInt2 - j);
        paramInt2 = Math.max(0, i - j);
        break;
      }
      paramInt1 = j;
      paramInt2 = i;
      if (mTabScrollView == null) {
        break label569;
      }
      if (k != 0) {}
      for (paramInt1 = mItemPadding * 2;; paramInt1 = mItemPadding)
      {
        paramInt2 = Math.max(0, j - paramInt1);
        i = Math.max(0, i - paramInt1);
        mTabScrollView.measure(View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE), View.MeasureSpec.makeMeasureSpec(i3, 1073741824));
        j = mTabScrollView.getMeasuredWidth();
        paramInt1 = Math.max(0, paramInt2 - j);
        paramInt2 = Math.max(0, i - j);
        break;
      }
      localObject1 = localObject2;
      if ((mDisplayOptions & 0x10) == 0) {
        break label585;
      }
      localObject1 = localObject2;
      if (mCustomNavView == null) {
        break label585;
      }
      localObject1 = mCustomNavView;
      break label585;
      localObject2 = null;
      break label618;
      if (height != -2) {}
      for (i = 1073741824;; i = Integer.MIN_VALUE) {
        break;
      }
      i1 = Integer.MIN_VALUE;
      break label716;
      i2 = paramInt1;
      break label735;
    }
    setMeasuredDimension(i6, paramInt2);
    for (;;)
    {
      if (mContextView != null) {
        mContextView.setContentHeight(getMeasuredHeight());
      }
      if ((mProgressView == null) || (mProgressView.getVisibility() == 8)) {
        break;
      }
      mProgressView.measure(View.MeasureSpec.makeMeasureSpec(i6 - mProgressBarPadding * 2, 1073741824), View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), Integer.MIN_VALUE));
      return;
      label1323:
      setMeasuredDimension(i6, m);
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if ((expandedMenuItemId != 0) && (mExpandedMenuPresenter != null) && (mOptionsMenu != null))
    {
      MenuItem localMenuItem = mOptionsMenu.findItem(expandedMenuItemId);
      if (localMenuItem != null) {
        localMenuItem.expandActionView();
      }
    }
    if (isOverflowOpen) {
      postShowOverflowMenu();
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    if ((mExpandedMenuPresenter != null) && (mExpandedMenuPresenter.mCurrentExpandedItem != null)) {
      expandedMenuItemId = mExpandedMenuPresenter.mCurrentExpandedItem.getItemId();
    }
    isOverflowOpen = isOverflowMenuShowing();
    return localSavedState;
  }
  
  public void setCallback(ActionBar.OnNavigationListener paramOnNavigationListener)
  {
    mCallback = paramOnNavigationListener;
  }
  
  public void setCollapsable(boolean paramBoolean)
  {
    mIsCollapsable = paramBoolean;
  }
  
  public void setContextView(ActionBarContextView paramActionBarContextView)
  {
    mContextView = paramActionBarContextView;
  }
  
  public void setCustomNavigationView(View paramView)
  {
    if ((mDisplayOptions & 0x10) != 0) {}
    for (int i = 1;; i = 0)
    {
      if ((mCustomNavView != null) && (i != 0)) {
        removeView(mCustomNavView);
      }
      mCustomNavView = paramView;
      if ((mCustomNavView != null) && (i != 0)) {
        addView(mCustomNavView);
      }
      return;
    }
  }
  
  public void setDisplayOptions(int paramInt)
  {
    int n = 8;
    int j = -1;
    boolean bool2 = true;
    int k;
    label38:
    int i;
    label52:
    boolean bool1;
    label75:
    label115:
    Object localObject;
    label131:
    label156:
    int m;
    if (mDisplayOptions == -1)
    {
      mDisplayOptions = paramInt;
      if ((j & 0x1F) == 0) {
        break label369;
      }
      if ((paramInt & 0x2) == 0) {
        break label298;
      }
      k = 1;
      if ((k == 0) || (mExpandedActionView != null)) {
        break label304;
      }
      i = 0;
      mHomeLayout.setVisibility(i);
      if ((j & 0x4) != 0)
      {
        if ((paramInt & 0x4) == 0) {
          break label310;
        }
        bool1 = true;
        mHomeLayout.setUp(bool1);
        if (bool1) {
          setHomeButtonEnabled(true);
        }
      }
      if ((j & 0x1) != 0)
      {
        if ((mLogo == null) || ((paramInt & 0x1) == 0)) {
          break label316;
        }
        i = 1;
        HomeView localHomeView = mHomeLayout;
        if (i == 0) {
          break label321;
        }
        localObject = mLogo;
        localHomeView.setIcon((Drawable)localObject);
      }
      if ((j & 0x8) != 0)
      {
        if ((paramInt & 0x8) == 0) {
          break label330;
        }
        initTitle();
      }
      if ((mTitleLayout != null) && ((j & 0x6) != 0))
      {
        if ((mDisplayOptions & 0x4) == 0) {
          break label341;
        }
        m = 1;
        label182:
        localObject = mTitleUpView;
        i = n;
        if (k == 0)
        {
          if (m == 0) {
            break label347;
          }
          i = 0;
        }
        label203:
        ((View)localObject).setVisibility(i);
        localObject = mTitleLayout;
        if ((k != 0) || (m == 0)) {
          break label352;
        }
        bool1 = bool2;
        label229:
        ((LinearLayout)localObject).setEnabled(bool1);
      }
      if (((j & 0x10) != 0) && (mCustomNavView != null))
      {
        if ((paramInt & 0x10) == 0) {
          break label358;
        }
        addView(mCustomNavView);
      }
      label265:
      requestLayout();
    }
    for (;;)
    {
      if (mHomeLayout.isEnabled()) {
        break label376;
      }
      mHomeLayout.setContentDescription(null);
      return;
      j = paramInt ^ mDisplayOptions;
      break;
      label298:
      k = 0;
      break label38;
      label304:
      i = 8;
      break label52;
      label310:
      bool1 = false;
      break label75;
      label316:
      i = 0;
      break label115;
      label321:
      localObject = mIcon;
      break label131;
      label330:
      removeView(mTitleLayout);
      break label156;
      label341:
      m = 0;
      break label182;
      label347:
      i = 4;
      break label203;
      label352:
      bool1 = false;
      break label229;
      label358:
      removeView(mCustomNavView);
      break label265;
      label369:
      invalidate();
    }
    label376:
    if ((paramInt & 0x4) != 0)
    {
      mHomeLayout.setContentDescription(mContext.getResources().getText(R.string.abs__action_bar_up_description));
      return;
    }
    mHomeLayout.setContentDescription(mContext.getResources().getText(R.string.abs__action_bar_home_description));
  }
  
  public void setDropdownAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    mSpinnerAdapter = paramSpinnerAdapter;
    if (mSpinner != null) {
      mSpinner.setAdapter(paramSpinnerAdapter);
    }
  }
  
  public void setDropdownSelectedPosition(int paramInt)
  {
    mSpinner.setSelection(paramInt);
  }
  
  public void setEmbeddedTabView(ScrollingTabContainerView paramScrollingTabContainerView)
  {
    if (mTabScrollView != null) {
      removeView(mTabScrollView);
    }
    mTabScrollView = paramScrollingTabContainerView;
    if (paramScrollingTabContainerView != null) {}
    for (boolean bool = true;; bool = false)
    {
      mIncludeTabs = bool;
      if ((mIncludeTabs) && (mNavigationMode == 2))
      {
        addView(mTabScrollView);
        ViewGroup.LayoutParams localLayoutParams = mTabScrollView.getLayoutParams();
        width = -2;
        height = -1;
        paramScrollingTabContainerView.setAllowCollapse(true);
      }
      return;
    }
  }
  
  public void setHomeButtonContentDescription(int paramInt)
  {
    mHomeLayout.setContentDescription(mContext.getResources().getText(paramInt));
  }
  
  public void setHomeButtonEnabled(boolean paramBoolean)
  {
    mHomeLayout.setEnabled(paramBoolean);
    mHomeLayout.setFocusable(paramBoolean);
    if (!paramBoolean)
    {
      mHomeLayout.setContentDescription(null);
      return;
    }
    if ((mDisplayOptions & 0x4) != 0)
    {
      mHomeLayout.setContentDescription(mContext.getResources().getText(R.string.abs__action_bar_up_description));
      return;
    }
    mHomeLayout.setContentDescription(mContext.getResources().getText(R.string.abs__action_bar_home_description));
  }
  
  public void setIcon(int paramInt)
  {
    setIcon(mContext.getResources().getDrawable(paramInt));
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mIcon = paramDrawable;
    if ((paramDrawable != null) && (((mDisplayOptions & 0x1) == 0) || (mLogo == null))) {
      mHomeLayout.setIcon(paramDrawable);
    }
  }
  
  public void setLogo(int paramInt)
  {
    setLogo(mContext.getResources().getDrawable(paramInt));
  }
  
  public void setLogo(Drawable paramDrawable)
  {
    mLogo = paramDrawable;
    if ((paramDrawable != null) && ((mDisplayOptions & 0x1) != 0)) {
      mHomeLayout.setIcon(paramDrawable);
    }
  }
  
  public void setMenu(Menu paramMenu, MenuPresenter.Callback paramCallback)
  {
    if (paramMenu == mOptionsMenu) {
      return;
    }
    if (mOptionsMenu != null)
    {
      mOptionsMenu.removeMenuPresenter(mActionMenuPresenter);
      mOptionsMenu.removeMenuPresenter(mExpandedMenuPresenter);
    }
    paramMenu = (MenuBuilder)paramMenu;
    mOptionsMenu = paramMenu;
    ViewGroup localViewGroup;
    if (mMenuView != null)
    {
      localViewGroup = (ViewGroup)mMenuView.getParent();
      if (localViewGroup != null) {
        localViewGroup.removeView(mMenuView);
      }
    }
    if (mActionMenuPresenter == null)
    {
      mActionMenuPresenter = new ActionMenuPresenter(mContext);
      mActionMenuPresenter.setCallback(paramCallback);
      mActionMenuPresenter.setId(R.id.abs__action_menu_presenter);
      mExpandedMenuPresenter = new ExpandedActionViewMenuPresenter(null);
    }
    paramCallback = new ViewGroup.LayoutParams(-2, -1);
    if (!mSplitActionBar)
    {
      mActionMenuPresenter.setExpandedActionViewsExclusive(ResourcesCompat.getResources_getBoolean(getContext(), R.bool.abs__action_bar_expanded_action_views_exclusive));
      configPresenters(paramMenu);
      paramMenu = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
      localViewGroup = (ViewGroup)paramMenu.getParent();
      if ((localViewGroup != null) && (localViewGroup != this)) {
        localViewGroup.removeView(paramMenu);
      }
      addView(paramMenu, paramCallback);
    }
    for (;;)
    {
      mMenuView = paramMenu;
      return;
      mActionMenuPresenter.setExpandedActionViewsExclusive(false);
      mActionMenuPresenter.setWidthLimit(getContextgetResourcesgetDisplayMetricswidthPixels, true);
      mActionMenuPresenter.setItemLimit(Integer.MAX_VALUE);
      width = -1;
      configPresenters(paramMenu);
      paramMenu = (ActionMenuView)mActionMenuPresenter.getMenuView(this);
      if (mSplitView != null)
      {
        localViewGroup = (ViewGroup)paramMenu.getParent();
        if ((localViewGroup != null) && (localViewGroup != mSplitView)) {
          localViewGroup.removeView(paramMenu);
        }
        paramMenu.setVisibility(getAnimatedVisibility());
        mSplitView.addView(paramMenu, paramCallback);
      }
      else
      {
        paramMenu.setLayoutParams(paramCallback);
      }
    }
  }
  
  public void setNavigationMode(int paramInt)
  {
    int i = mNavigationMode;
    if (paramInt != i) {
      switch (i)
      {
      default: 
        switch (paramInt)
        {
        }
        break;
      }
    }
    for (;;)
    {
      mNavigationMode = paramInt;
      requestLayout();
      return;
      if (mListNavLayout == null) {
        break;
      }
      removeView(mListNavLayout);
      break;
      if ((mTabScrollView == null) || (!mIncludeTabs)) {
        break;
      }
      removeView(mTabScrollView);
      break;
      if (mSpinner == null)
      {
        mSpinner = new IcsSpinner(mContext, null, R.attr.actionDropDownStyle);
        mListNavLayout = ((IcsLinearLayout)LayoutInflater.from(mContext).inflate(R.layout.abs__action_bar_tab_bar_view, null));
        LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -1);
        gravity = 17;
        mListNavLayout.addView(mSpinner, localLayoutParams);
      }
      if (mSpinner.getAdapter() != mSpinnerAdapter) {
        mSpinner.setAdapter(mSpinnerAdapter);
      }
      mSpinner.setOnItemSelectedListener(mNavItemSelectedListener);
      addView(mListNavLayout);
      continue;
      if ((mTabScrollView != null) && (mIncludeTabs)) {
        addView(mTabScrollView);
      }
    }
  }
  
  public void setSplitActionBar(boolean paramBoolean)
  {
    Object localObject;
    if (mSplitActionBar != paramBoolean)
    {
      if (mMenuView != null)
      {
        localObject = (ViewGroup)mMenuView.getParent();
        if (localObject != null) {
          ((ViewGroup)localObject).removeView(mMenuView);
        }
        if (!paramBoolean) {
          break label89;
        }
        if (mSplitView != null) {
          mSplitView.addView(mMenuView);
        }
      }
      if (mSplitView != null)
      {
        localObject = mSplitView;
        if (!paramBoolean) {
          break label100;
        }
      }
    }
    label89:
    label100:
    for (int i = 0;; i = 8)
    {
      ((ActionBarContainer)localObject).setVisibility(i);
      super.setSplitActionBar(paramBoolean);
      return;
      addView(mMenuView);
      break;
    }
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    int j = 0;
    mSubtitle = paramCharSequence;
    if (mSubtitleView != null)
    {
      mSubtitleView.setText(paramCharSequence);
      TextView localTextView = mSubtitleView;
      if (paramCharSequence == null) {
        break label96;
      }
      i = 0;
      localTextView.setVisibility(i);
      if ((mExpandedActionView != null) || ((mDisplayOptions & 0x8) == 0) || ((TextUtils.isEmpty(mTitle)) && (TextUtils.isEmpty(mSubtitle)))) {
        break label102;
      }
      i = 1;
      label79:
      paramCharSequence = mTitleLayout;
      if (i == 0) {
        break label107;
      }
    }
    label96:
    label102:
    label107:
    for (int i = j;; i = 8)
    {
      paramCharSequence.setVisibility(i);
      return;
      i = 8;
      break;
      i = 0;
      break label79;
    }
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mUserTitle = true;
    setTitleImpl(paramCharSequence);
  }
  
  public void setWindowCallback(Window.Callback paramCallback)
  {
    mWindowCallback = paramCallback;
  }
  
  public void setWindowTitle(CharSequence paramCharSequence)
  {
    if (!mUserTitle) {
      setTitleImpl(paramCharSequence);
    }
  }
  
  public boolean shouldDelayChildPressedState()
  {
    return false;
  }
  
  private class ExpandedActionViewMenuPresenter
    implements MenuPresenter
  {
    MenuItemImpl mCurrentExpandedItem;
    MenuBuilder mMenu;
    
    private ExpandedActionViewMenuPresenter() {}
    
    public boolean collapseItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
    {
      if ((mExpandedActionView instanceof CollapsibleActionView)) {
        ((CollapsibleActionView)mExpandedActionView).onActionViewCollapsed();
      }
      removeView(mExpandedActionView);
      removeView(mExpandedHomeLayout);
      mExpandedActionView = null;
      if ((mDisplayOptions & 0x2) != 0) {
        mHomeLayout.setVisibility(0);
      }
      if ((mDisplayOptions & 0x8) != 0)
      {
        if (mTitleLayout != null) {
          break label245;
        }
        ActionBarView.this.initTitle();
      }
      for (;;)
      {
        if ((mTabScrollView != null) && (mNavigationMode == 2)) {
          mTabScrollView.setVisibility(0);
        }
        if ((mSpinner != null) && (mNavigationMode == 1)) {
          mSpinner.setVisibility(0);
        }
        if ((mCustomNavView != null) && ((mDisplayOptions & 0x10) != 0)) {
          mCustomNavView.setVisibility(0);
        }
        mExpandedHomeLayout.setIcon(null);
        mCurrentExpandedItem = null;
        requestLayout();
        paramMenuItemImpl.setActionViewExpanded(false);
        return true;
        label245:
        mTitleLayout.setVisibility(0);
      }
    }
    
    public boolean expandItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
    {
      mExpandedActionView = paramMenuItemImpl.getActionView();
      mExpandedHomeLayout.setIcon(mIcon.getConstantState().newDrawable());
      mCurrentExpandedItem = paramMenuItemImpl;
      if (mExpandedActionView.getParent() != ActionBarView.this) {
        addView(mExpandedActionView);
      }
      if (mExpandedHomeLayout.getParent() != ActionBarView.this) {
        addView(mExpandedHomeLayout);
      }
      mHomeLayout.setVisibility(8);
      if (mTitleLayout != null) {
        mTitleLayout.setVisibility(8);
      }
      if (mTabScrollView != null) {
        mTabScrollView.setVisibility(8);
      }
      if (mSpinner != null) {
        mSpinner.setVisibility(8);
      }
      if (mCustomNavView != null) {
        mCustomNavView.setVisibility(8);
      }
      requestLayout();
      paramMenuItemImpl.setActionViewExpanded(true);
      if ((mExpandedActionView instanceof CollapsibleActionView)) {
        ((CollapsibleActionView)mExpandedActionView).onActionViewExpanded();
      }
      return true;
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
      return null;
    }
    
    public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder)
    {
      if ((mMenu != null) && (mCurrentExpandedItem != null)) {
        mMenu.collapseItemActionView(mCurrentExpandedItem);
      }
      mMenu = paramMenuBuilder;
    }
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean) {}
    
    public void onRestoreInstanceState(Parcelable paramParcelable) {}
    
    public Parcelable onSaveInstanceState()
    {
      return null;
    }
    
    public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
    {
      return false;
    }
    
    public void setCallback(MenuPresenter.Callback paramCallback) {}
    
    public void updateMenuView(boolean paramBoolean)
    {
      int k;
      int j;
      int m;
      int i;
      if (mCurrentExpandedItem != null)
      {
        k = 0;
        j = k;
        if (mMenu != null)
        {
          m = mMenu.size();
          i = 0;
        }
      }
      for (;;)
      {
        j = k;
        if (i < m)
        {
          if (mMenu.getItem(i) == mCurrentExpandedItem) {
            j = 1;
          }
        }
        else
        {
          if (j == 0) {
            collapseItemActionView(mMenu, mCurrentExpandedItem);
          }
          return;
        }
        i += 1;
      }
    }
  }
  
  public static class HomeView
    extends FrameLayout
  {
    private ImageView mIconView;
    private View mUpView;
    private int mUpWidth;
    
    public HomeView(Context paramContext)
    {
      this(paramContext, null);
    }
    
    public HomeView(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public boolean dispatchHoverEvent(MotionEvent paramMotionEvent)
    {
      return onHoverEvent(paramMotionEvent);
    }
    
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
    {
      onPopulateAccessibilityEvent(paramAccessibilityEvent);
      return true;
    }
    
    public int getLeftOffset()
    {
      if (mUpView.getVisibility() == 8) {
        return mUpWidth;
      }
      return 0;
    }
    
    protected void onFinishInflate()
    {
      mUpView = findViewById(R.id.abs__up);
      mIconView = ((ImageView)findViewById(R.id.abs__home));
    }
    
    protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      int i = (paramInt4 - paramInt2) / 2;
      paramInt2 = 0;
      paramInt4 = paramInt1;
      if (mUpView.getVisibility() != 8)
      {
        localLayoutParams = (FrameLayout.LayoutParams)mUpView.getLayoutParams();
        paramInt2 = mUpView.getMeasuredHeight();
        paramInt4 = mUpView.getMeasuredWidth();
        j = i - paramInt2 / 2;
        mUpView.layout(0, j, paramInt4, j + paramInt2);
        paramInt2 = leftMargin + paramInt4 + rightMargin;
        paramInt4 = paramInt1 + paramInt2;
      }
      FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)mIconView.getLayoutParams();
      paramInt1 = mIconView.getMeasuredHeight();
      int j = mIconView.getMeasuredWidth();
      paramInt3 = (paramInt3 - paramInt4) / 2;
      paramInt2 += Math.max(leftMargin, paramInt3 - j / 2);
      paramInt3 = Math.max(topMargin, i - paramInt1 / 2);
      mIconView.layout(paramInt2, paramInt3, paramInt2 + j, paramInt3 + paramInt1);
    }
    
    protected void onMeasure(int paramInt1, int paramInt2)
    {
      measureChildWithMargins(mUpView, paramInt1, 0, paramInt2, 0);
      FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)mUpView.getLayoutParams();
      mUpWidth = (leftMargin + mUpView.getMeasuredWidth() + rightMargin);
      int i;
      int j;
      if (mUpView.getVisibility() == 8)
      {
        i = 0;
        j = topMargin;
        int k = mUpView.getMeasuredHeight();
        int m = bottomMargin;
        measureChildWithMargins(mIconView, paramInt1, i, paramInt2, 0);
        localLayoutParams = (FrameLayout.LayoutParams)mIconView.getLayoutParams();
        i += leftMargin + mIconView.getMeasuredWidth() + rightMargin;
        j = Math.max(j + k + m, topMargin + mIconView.getMeasuredHeight() + bottomMargin);
        m = View.MeasureSpec.getMode(paramInt1);
        k = View.MeasureSpec.getMode(paramInt2);
        paramInt1 = View.MeasureSpec.getSize(paramInt1);
        paramInt2 = View.MeasureSpec.getSize(paramInt2);
        switch (m)
        {
        default: 
          paramInt1 = i;
          switch (k)
          {
          default: 
            label214:
            paramInt2 = j;
          }
          break;
        }
      }
      for (;;)
      {
        setMeasuredDimension(paramInt1, paramInt2);
        return;
        i = mUpWidth;
        break;
        paramInt1 = Math.min(i, paramInt1);
        break label214;
        break label214;
        paramInt2 = Math.min(j, paramInt2);
      }
    }
    
    public void onPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
    {
      if (Build.VERSION.SDK_INT >= 14) {
        super.onPopulateAccessibilityEvent(paramAccessibilityEvent);
      }
      CharSequence localCharSequence = getContentDescription();
      if (!TextUtils.isEmpty(localCharSequence)) {
        paramAccessibilityEvent.getText().add(localCharSequence);
      }
    }
    
    public void setIcon(Drawable paramDrawable)
    {
      mIconView.setImageDrawable(paramDrawable);
    }
    
    public void setUp(boolean paramBoolean)
    {
      View localView = mUpView;
      if (paramBoolean) {}
      for (int i = 0;; i = 8)
      {
        localView.setVisibility(i);
        return;
      }
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public ActionBarView.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new ActionBarView.SavedState(paramAnonymousParcel, null);
      }
      
      public ActionBarView.SavedState[] newArray(int paramAnonymousInt)
      {
        return new ActionBarView.SavedState[paramAnonymousInt];
      }
    };
    int expandedMenuItemId;
    boolean isOverflowOpen;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      expandedMenuItemId = paramParcel.readInt();
      if (paramParcel.readInt() != 0) {}
      for (boolean bool = true;; bool = false)
      {
        isOverflowOpen = bool;
        return;
      }
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(expandedMenuItemId);
      if (isOverflowOpen) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        return;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.ActionBarView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */