package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.R.layout;
import com.actionbarsherlock.R.styleable;
import com.actionbarsherlock.app.ActionBar.Tab;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineHorizontalScrollView;

public class ScrollingTabContainerView
  extends NineHorizontalScrollView
  implements IcsAdapterView.OnItemSelectedListener
{
  private static final int FADE_DURATION = 200;
  private static final Interpolator sAlphaInterpolator = new DecelerateInterpolator();
  private boolean mAllowCollapse;
  private int mContentHeight;
  private LayoutInflater mInflater;
  int mMaxTabWidth;
  private int mSelectedTabIndex;
  private TabClickListener mTabClickListener;
  private IcsLinearLayout mTabLayout;
  Runnable mTabSelector;
  private IcsSpinner mTabSpinner;
  protected final VisibilityAnimListener mVisAnimListener = new VisibilityAnimListener();
  protected Animator mVisibilityAnim;
  
  public ScrollingTabContainerView(Context paramContext)
  {
    super(paramContext);
    setHorizontalScrollBarEnabled(false);
    TypedArray localTypedArray = getContext().obtainStyledAttributes(null, R.styleable.SherlockActionBar, R.attr.actionBarStyle, 0);
    setContentHeight(localTypedArray.getLayoutDimension(R.styleable.SherlockActionBar_height, 0));
    localTypedArray.recycle();
    mInflater = LayoutInflater.from(paramContext);
    mTabLayout = createTabLayout();
    addView(mTabLayout, new ViewGroup.LayoutParams(-2, -1));
  }
  
  private IcsSpinner createSpinner()
  {
    IcsSpinner localIcsSpinner = new IcsSpinner(getContext(), null, R.attr.actionDropDownStyle);
    localIcsSpinner.setLayoutParams(new LinearLayout.LayoutParams(-2, -1));
    localIcsSpinner.setOnItemSelectedListener(this);
    return localIcsSpinner;
  }
  
  private IcsLinearLayout createTabLayout()
  {
    TabsLinearLayout localTabsLinearLayout = (TabsLinearLayout)LayoutInflater.from(getContext()).inflate(R.layout.abs__action_bar_tab_bar_view, null);
    localTabsLinearLayout.setMeasureWithLargestChildEnabled(true);
    localTabsLinearLayout.setLayoutParams(new LinearLayout.LayoutParams(-2, -1));
    return localTabsLinearLayout;
  }
  
  private TabView createTabView(ActionBar.Tab paramTab, boolean paramBoolean)
  {
    TabView localTabView = (TabView)mInflater.inflate(R.layout.abs__action_bar_tab, null);
    localTabView.init(this, paramTab, paramBoolean);
    if (paramBoolean)
    {
      localTabView.setBackgroundDrawable(null);
      localTabView.setLayoutParams(new AbsListView.LayoutParams(-1, mContentHeight));
      return localTabView;
    }
    localTabView.setFocusable(true);
    if (mTabClickListener == null) {
      mTabClickListener = new TabClickListener(null);
    }
    localTabView.setOnClickListener(mTabClickListener);
    return localTabView;
  }
  
  private boolean isCollapsed()
  {
    return (mTabSpinner != null) && (mTabSpinner.getParent() == this);
  }
  
  private void performCollapse()
  {
    if (isCollapsed()) {
      return;
    }
    if (mTabSpinner == null) {
      mTabSpinner = createSpinner();
    }
    removeView(mTabLayout);
    addView(mTabSpinner, new ViewGroup.LayoutParams(-2, -1));
    if (mTabSpinner.getAdapter() == null) {
      mTabSpinner.setAdapter(new TabAdapter(null));
    }
    if (mTabSelector != null)
    {
      removeCallbacks(mTabSelector);
      mTabSelector = null;
    }
    mTabSpinner.setSelection(mSelectedTabIndex);
  }
  
  private boolean performExpand()
  {
    if (!isCollapsed()) {
      return false;
    }
    removeView(mTabSpinner);
    addView(mTabLayout, new ViewGroup.LayoutParams(-2, -1));
    setTabSelected(mTabSpinner.getSelectedItemPosition());
    return false;
  }
  
  public void addTab(ActionBar.Tab paramTab, int paramInt, boolean paramBoolean)
  {
    paramTab = createTabView(paramTab, false);
    mTabLayout.addView(paramTab, paramInt, new LinearLayout.LayoutParams(0, -1, 1.0F));
    if (mTabSpinner != null) {
      ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
    }
    if (paramBoolean) {
      paramTab.setSelected(true);
    }
    if (mAllowCollapse) {
      requestLayout();
    }
  }
  
  public void addTab(ActionBar.Tab paramTab, boolean paramBoolean)
  {
    paramTab = createTabView(paramTab, false);
    mTabLayout.addView(paramTab, new LinearLayout.LayoutParams(0, -1, 1.0F));
    if (mTabSpinner != null) {
      ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
    }
    if (paramBoolean) {
      paramTab.setSelected(true);
    }
    if (mAllowCollapse) {
      requestLayout();
    }
  }
  
  public void animateToTab(int paramInt)
  {
    final View localView = mTabLayout.getChildAt(paramInt);
    if (mTabSelector != null) {
      removeCallbacks(mTabSelector);
    }
    mTabSelector = new Runnable()
    {
      public void run()
      {
        int i = localView.getLeft();
        int j = (getWidth() - localView.getWidth()) / 2;
        smoothScrollTo(i - j, 0);
        mTabSelector = null;
      }
    };
    post(mTabSelector);
  }
  
  public void animateToVisibility(int paramInt)
  {
    if (mVisibilityAnim != null) {
      mVisibilityAnim.cancel();
    }
    if (paramInt == 0)
    {
      if (getVisibility() != 0) {
        setAlpha(0.0F);
      }
      localObjectAnimator = ObjectAnimator.ofFloat(this, "alpha", new float[] { 1.0F });
      localObjectAnimator.setDuration(200L);
      localObjectAnimator.setInterpolator(sAlphaInterpolator);
      localObjectAnimator.addListener(mVisAnimListener.withFinalVisibility(paramInt));
      localObjectAnimator.start();
      return;
    }
    ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(this, "alpha", new float[] { 0.0F });
    localObjectAnimator.setDuration(200L);
    localObjectAnimator.setInterpolator(sAlphaInterpolator);
    localObjectAnimator.addListener(mVisAnimListener.withFinalVisibility(paramInt));
    localObjectAnimator.start();
  }
  
  public void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mTabSelector != null) {
      post(mTabSelector);
    }
  }
  
  protected void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    paramConfiguration = getContext().obtainStyledAttributes(null, R.styleable.SherlockActionBar, R.attr.actionBarStyle, 0);
    setContentHeight(paramConfiguration.getLayoutDimension(R.styleable.SherlockActionBar_height, 0));
    paramConfiguration.recycle();
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mTabSelector != null) {
      removeCallbacks(mTabSelector);
    }
  }
  
  public void onItemSelected(IcsAdapterView<?> paramIcsAdapterView, View paramView, int paramInt, long paramLong)
  {
    ((TabView)paramView).getTab().select();
  }
  
  public void onMeasure(int paramInt1, int paramInt2)
  {
    paramInt2 = View.MeasureSpec.getMode(paramInt1);
    boolean bool;
    int i;
    if (paramInt2 == 1073741824)
    {
      bool = true;
      setFillViewport(bool);
      i = mTabLayout.getChildCount();
      if ((i <= 1) || ((paramInt2 != 1073741824) && (paramInt2 != Integer.MIN_VALUE))) {
        break label177;
      }
      if (i <= 2) {
        break label164;
      }
      mMaxTabWidth = ((int)(View.MeasureSpec.getSize(paramInt1) * 0.4F));
      label67:
      i = View.MeasureSpec.makeMeasureSpec(mContentHeight, 1073741824);
      if ((bool) || (!mAllowCollapse)) {
        break label185;
      }
      paramInt2 = 1;
      label92:
      if (paramInt2 == 0) {
        break label198;
      }
      mTabLayout.measure(0, i);
      if (mTabLayout.getMeasuredWidth() <= View.MeasureSpec.getSize(paramInt1)) {
        break label190;
      }
      performCollapse();
    }
    for (;;)
    {
      paramInt2 = getMeasuredWidth();
      super.onMeasure(paramInt1, i);
      paramInt1 = getMeasuredWidth();
      if ((bool) && (paramInt2 != paramInt1)) {
        setTabSelected(mSelectedTabIndex);
      }
      return;
      bool = false;
      break;
      label164:
      mMaxTabWidth = (View.MeasureSpec.getSize(paramInt1) / 2);
      break label67;
      label177:
      mMaxTabWidth = -1;
      break label67;
      label185:
      paramInt2 = 0;
      break label92;
      label190:
      performExpand();
      continue;
      label198:
      performExpand();
    }
  }
  
  public void onNothingSelected(IcsAdapterView<?> paramIcsAdapterView) {}
  
  public void removeAllTabs()
  {
    mTabLayout.removeAllViews();
    if (mTabSpinner != null) {
      ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
    }
    if (mAllowCollapse) {
      requestLayout();
    }
  }
  
  public void removeTabAt(int paramInt)
  {
    mTabLayout.removeViewAt(paramInt);
    if (mTabSpinner != null) {
      ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
    }
    if (mAllowCollapse) {
      requestLayout();
    }
  }
  
  public void setAllowCollapse(boolean paramBoolean)
  {
    mAllowCollapse = paramBoolean;
  }
  
  public void setContentHeight(int paramInt)
  {
    mContentHeight = paramInt;
    requestLayout();
  }
  
  public void setTabSelected(int paramInt)
  {
    mSelectedTabIndex = paramInt;
    int j = mTabLayout.getChildCount();
    int i = 0;
    if (i < j)
    {
      View localView = mTabLayout.getChildAt(i);
      if (i == paramInt) {}
      for (boolean bool = true;; bool = false)
      {
        localView.setSelected(bool);
        if (bool) {
          animateToTab(paramInt);
        }
        i += 1;
        break;
      }
    }
  }
  
  public void updateTab(int paramInt)
  {
    ((TabView)mTabLayout.getChildAt(paramInt)).update();
    if (mTabSpinner != null) {
      ((TabAdapter)mTabSpinner.getAdapter()).notifyDataSetChanged();
    }
    if (mAllowCollapse) {
      requestLayout();
    }
  }
  
  private class TabAdapter
    extends BaseAdapter
  {
    private TabAdapter() {}
    
    public int getCount()
    {
      return mTabLayout.getChildCount();
    }
    
    public Object getItem(int paramInt)
    {
      return ((ScrollingTabContainerView.TabView)mTabLayout.getChildAt(paramInt)).getTab();
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (paramView == null) {
        return ScrollingTabContainerView.this.createTabView((ActionBar.Tab)getItem(paramInt), true);
      }
      ((ScrollingTabContainerView.TabView)paramView).bindTab((ActionBar.Tab)getItem(paramInt));
      return paramView;
    }
  }
  
  private class TabClickListener
    implements View.OnClickListener
  {
    private TabClickListener() {}
    
    public void onClick(View paramView)
    {
      ((ScrollingTabContainerView.TabView)paramView).getTab().select();
      int j = mTabLayout.getChildCount();
      int i = 0;
      if (i < j)
      {
        View localView = mTabLayout.getChildAt(i);
        if (localView == paramView) {}
        for (boolean bool = true;; bool = false)
        {
          localView.setSelected(bool);
          i += 1;
          break;
        }
      }
    }
  }
  
  public static class TabView
    extends LinearLayout
  {
    private View mCustomView;
    private ImageView mIconView;
    private ScrollingTabContainerView mParent;
    private ActionBar.Tab mTab;
    private CapitalizingTextView mTextView;
    
    public TabView(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public void bindTab(ActionBar.Tab paramTab)
    {
      mTab = paramTab;
      update();
    }
    
    public ActionBar.Tab getTab()
    {
      return mTab;
    }
    
    public void init(ScrollingTabContainerView paramScrollingTabContainerView, ActionBar.Tab paramTab, boolean paramBoolean)
    {
      mParent = paramScrollingTabContainerView;
      mTab = paramTab;
      if (paramBoolean) {
        setGravity(19);
      }
      update();
    }
    
    public void onMeasure(int paramInt1, int paramInt2)
    {
      super.onMeasure(paramInt1, paramInt2);
      if ((mParent.mMaxTabWidth > 0) && (getMeasuredWidth() > mParent.mMaxTabWidth)) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(mParent.mMaxTabWidth, 1073741824), paramInt2);
      }
    }
    
    public void update()
    {
      Object localObject1 = mTab;
      Object localObject2 = ((ActionBar.Tab)localObject1).getCustomView();
      if (localObject2 != null)
      {
        localObject1 = ((View)localObject2).getParent();
        if (localObject1 != this)
        {
          if (localObject1 != null) {
            ((ViewGroup)localObject1).removeView((View)localObject2);
          }
          addView((View)localObject2);
        }
        mCustomView = ((View)localObject2);
        if (mTextView != null) {
          mTextView.setVisibility(8);
        }
        if (mIconView != null)
        {
          mIconView.setVisibility(8);
          mIconView.setImageDrawable(null);
        }
      }
      label329:
      label354:
      for (;;)
      {
        return;
        if (mCustomView != null)
        {
          removeView(mCustomView);
          mCustomView = null;
        }
        Object localObject3 = ((ActionBar.Tab)localObject1).getIcon();
        localObject2 = ((ActionBar.Tab)localObject1).getText();
        if (localObject3 != null)
        {
          Object localObject4;
          if (mIconView == null)
          {
            localObject4 = new ImageView(getContext());
            LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
            gravity = 16;
            ((ImageView)localObject4).setLayoutParams(localLayoutParams);
            addView((View)localObject4, 0);
            mIconView = ((ImageView)localObject4);
          }
          mIconView.setImageDrawable((Drawable)localObject3);
          mIconView.setVisibility(0);
          if (localObject2 == null) {
            break label329;
          }
          if (mTextView == null)
          {
            localObject3 = new CapitalizingTextView(getContext(), null, R.attr.actionBarTabTextStyle);
            ((CapitalizingTextView)localObject3).setEllipsize(TextUtils.TruncateAt.END);
            localObject4 = new LinearLayout.LayoutParams(-2, -2);
            gravity = 16;
            ((CapitalizingTextView)localObject3).setLayoutParams((ViewGroup.LayoutParams)localObject4);
            addView((View)localObject3);
            mTextView = ((CapitalizingTextView)localObject3);
          }
          mTextView.setTextCompat((CharSequence)localObject2);
          mTextView.setVisibility(0);
        }
        for (;;)
        {
          if (mIconView == null) {
            break label354;
          }
          mIconView.setContentDescription(((ActionBar.Tab)localObject1).getContentDescription());
          return;
          if (mIconView == null) {
            break;
          }
          mIconView.setVisibility(8);
          mIconView.setImageDrawable(null);
          break;
          if (mTextView != null)
          {
            mTextView.setVisibility(8);
            mTextView.setText(null);
          }
        }
      }
    }
  }
  
  protected class VisibilityAnimListener
    implements Animator.AnimatorListener
  {
    private boolean mCanceled = false;
    private int mFinalVisibility;
    
    protected VisibilityAnimListener() {}
    
    public void onAnimationCancel(Animator paramAnimator)
    {
      mCanceled = true;
    }
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      if (mCanceled) {
        return;
      }
      mVisibilityAnim = null;
      setVisibility(mFinalVisibility);
    }
    
    public void onAnimationRepeat(Animator paramAnimator) {}
    
    public void onAnimationStart(Animator paramAnimator)
    {
      setVisibility(0);
      mVisibilityAnim = paramAnimator;
      mCanceled = false;
    }
    
    public VisibilityAnimListener withFinalVisibility(int paramInt)
    {
      mFinalVisibility = paramInt;
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.ScrollingTabContainerView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */