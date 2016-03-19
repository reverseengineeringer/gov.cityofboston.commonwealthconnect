package com.viewpagerindicator;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout.LayoutParams;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;

public class IconPageIndicator
  extends HorizontalScrollView
  implements PageIndicator
{
  private Runnable mIconSelector;
  private final IcsLinearLayout mIconsLayout;
  private ViewPager.OnPageChangeListener mListener;
  private int mSelectedIndex;
  private ViewPager mViewPager;
  
  public IconPageIndicator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public IconPageIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setHorizontalScrollBarEnabled(false);
    mIconsLayout = new IcsLinearLayout(paramContext, R.attr.vpiIconPageIndicatorStyle);
    addView(mIconsLayout, new FrameLayout.LayoutParams(-2, -1, 17));
  }
  
  private void animateToIcon(int paramInt)
  {
    final View localView = mIconsLayout.getChildAt(paramInt);
    if (mIconSelector != null) {
      removeCallbacks(mIconSelector);
    }
    mIconSelector = new Runnable()
    {
      public void run()
      {
        int i = localView.getLeft();
        int j = (getWidth() - localView.getWidth()) / 2;
        smoothScrollTo(i - j, 0);
        IconPageIndicator.access$002(IconPageIndicator.this, null);
      }
    };
    post(mIconSelector);
  }
  
  public void notifyDataSetChanged()
  {
    mIconsLayout.removeAllViews();
    IconPagerAdapter localIconPagerAdapter = (IconPagerAdapter)mViewPager.getAdapter();
    int j = localIconPagerAdapter.getCount();
    int i = 0;
    while (i < j)
    {
      ImageView localImageView = new ImageView(getContext(), null, R.attr.vpiIconPageIndicatorStyle);
      localImageView.setImageResource(localIconPagerAdapter.getIconResId(i));
      mIconsLayout.addView(localImageView);
      i += 1;
    }
    if (mSelectedIndex > j) {
      mSelectedIndex = (j - 1);
    }
    setCurrentItem(mSelectedIndex);
    requestLayout();
  }
  
  public void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mIconSelector != null) {
      post(mIconSelector);
    }
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mIconSelector != null) {
      removeCallbacks(mIconSelector);
    }
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
    mSelectedIndex = paramInt;
    mViewPager.setCurrentItem(paramInt);
    int j = mIconsLayout.getChildCount();
    int i = 0;
    if (i < j)
    {
      View localView = mIconsLayout.getChildAt(i);
      if (i == paramInt) {}
      for (boolean bool = true;; bool = false)
      {
        localView.setSelected(bool);
        if (bool) {
          animateToIcon(paramInt);
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
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.IconPageIndicator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */