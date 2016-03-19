package com.viewpagerindicator;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;

public class TabPageIndicator
  extends HorizontalScrollView
  implements PageIndicator
{
  private static final CharSequence EMPTY_TITLE = "";
  private ViewPager.OnPageChangeListener mListener;
  private int mMaxTabWidth;
  private int mSelectedTabIndex;
  private final View.OnClickListener mTabClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      paramAnonymousView = (TabPageIndicator.TabView)paramAnonymousView;
      int i = mViewPager.getCurrentItem();
      int j = paramAnonymousView.getIndex();
      mViewPager.setCurrentItem(j);
      if ((i == j) && (mTabReselectedListener != null)) {
        mTabReselectedListener.onTabReselected(j);
      }
    }
  };
  private final IcsLinearLayout mTabLayout;
  private OnTabReselectedListener mTabReselectedListener;
  private Runnable mTabSelector;
  private ViewPager mViewPager;
  
  public TabPageIndicator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public TabPageIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setHorizontalScrollBarEnabled(false);
    mTabLayout = new IcsLinearLayout(paramContext, R.attr.vpiTabPageIndicatorStyle);
    addView(mTabLayout, new ViewGroup.LayoutParams(-2, -1));
  }
  
  private void addTab(int paramInt1, CharSequence paramCharSequence, int paramInt2)
  {
    TabView localTabView = new TabView(getContext());
    TabView.access$302(localTabView, paramInt1);
    localTabView.setFocusable(true);
    localTabView.setOnClickListener(mTabClickListener);
    localTabView.setText(paramCharSequence);
    if (paramInt2 != 0) {
      localTabView.setCompoundDrawablesWithIntrinsicBounds(paramInt2, 0, 0, 0);
    }
    mTabLayout.addView(localTabView, new LinearLayout.LayoutParams(0, -1, 1.0F));
  }
  
  private void animateToTab(int paramInt)
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
        TabPageIndicator.access$202(TabPageIndicator.this, null);
      }
    };
    post(mTabSelector);
  }
  
  public void notifyDataSetChanged()
  {
    mTabLayout.removeAllViews();
    PagerAdapter localPagerAdapter = mViewPager.getAdapter();
    IconPagerAdapter localIconPagerAdapter = null;
    if ((localPagerAdapter instanceof IconPagerAdapter)) {
      localIconPagerAdapter = (IconPagerAdapter)localPagerAdapter;
    }
    int k = localPagerAdapter.getCount();
    int i = 0;
    while (i < k)
    {
      CharSequence localCharSequence2 = localPagerAdapter.getPageTitle(i);
      CharSequence localCharSequence1 = localCharSequence2;
      if (localCharSequence2 == null) {
        localCharSequence1 = EMPTY_TITLE;
      }
      int j = 0;
      if (localIconPagerAdapter != null) {
        j = localIconPagerAdapter.getIconResId(i);
      }
      addTab(i, localCharSequence1, j);
      i += 1;
    }
    if (mSelectedTabIndex > k) {
      mSelectedTabIndex = (k - 1);
    }
    setCurrentItem(mSelectedTabIndex);
    requestLayout();
  }
  
  public void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mTabSelector != null) {
      post(mTabSelector);
    }
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mTabSelector != null) {
      removeCallbacks(mTabSelector);
    }
  }
  
  public void onMeasure(int paramInt1, int paramInt2)
  {
    setFillViewport(false);
    if (mTabLayout.getChildCount() > 1) {}
    mMaxTabWidth = -1;
    getMeasuredWidth();
    super.onMeasure(paramInt1, paramInt2);
    getMeasuredWidth();
  }
  
  public void onPageScrollStateChanged(int paramInt)
  {
    if (mListener != null) {
      mListener.onPageScrollStateChanged(paramInt);
    }
  }
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
  {
    if (mListener != null) {
      mListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
    }
  }
  
  public void onPageSelected(int paramInt)
  {
    setCurrentItem(paramInt);
    if (mListener != null) {
      mListener.onPageSelected(paramInt);
    }
  }
  
  public void setCurrentItem(int paramInt)
  {
    if (mViewPager == null) {
      throw new IllegalStateException("ViewPager has not been bound.");
    }
    mSelectedTabIndex = paramInt;
    mViewPager.setCurrentItem(paramInt);
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
  
  public void setOnPageChangeListener(ViewPager.OnPageChangeListener paramOnPageChangeListener)
  {
    mListener = paramOnPageChangeListener;
  }
  
  public void setOnTabReselectedListener(OnTabReselectedListener paramOnTabReselectedListener)
  {
    mTabReselectedListener = paramOnTabReselectedListener;
  }
  
  public void setViewPager(ViewPager paramViewPager)
  {
    if (mViewPager == paramViewPager) {
      return;
    }
    if (mViewPager != null) {
      mViewPager.setOnPageChangeListener(null);
    }
    if (paramViewPager.getAdapter() == null) {
      throw new IllegalStateException("ViewPager does not have adapter instance.");
    }
    mViewPager = paramViewPager;
    paramViewPager.setOnPageChangeListener(this);
    notifyDataSetChanged();
  }
  
  public void setViewPager(ViewPager paramViewPager, int paramInt)
  {
    setViewPager(paramViewPager);
    setCurrentItem(paramInt);
  }
  
  public static abstract interface OnTabReselectedListener
  {
    public abstract void onTabReselected(int paramInt);
  }
  
  private class TabView
    extends TextView
  {
    private int mIndex;
    
    public TabView(Context paramContext)
    {
      super(null, R.attr.vpiTabPageIndicatorStyle);
    }
    
    public int getIndex()
    {
      return mIndex;
    }
    
    public void onMeasure(int paramInt1, int paramInt2)
    {
      super.onMeasure(paramInt1, paramInt2);
      if ((mMaxTabWidth > 0) && (getMeasuredWidth() > mMaxTabWidth)) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(mMaxTabWidth, 0), paramInt2);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.TabPageIndicator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */