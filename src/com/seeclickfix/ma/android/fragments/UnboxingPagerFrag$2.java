package com.seeclickfix.ma.android.fragments;

import android.support.v4.view.ViewPager.OnPageChangeListener;

class UnboxingPagerFrag$2
  implements ViewPager.OnPageChangeListener
{
  UnboxingPagerFrag$2(UnboxingPagerFrag paramUnboxingPagerFrag) {}
  
  public void onPageScrollStateChanged(int paramInt) {}
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2) {}
  
  public void onPageSelected(int paramInt)
  {
    if (paramInt <= 0) {
      UnboxingPagerFrag.access$202(this$0, 0);
    }
    while (paramInt >= 3) {
      return;
    }
    UnboxingPagerFrag.access$202(this$0, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.UnboxingPagerFrag.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */