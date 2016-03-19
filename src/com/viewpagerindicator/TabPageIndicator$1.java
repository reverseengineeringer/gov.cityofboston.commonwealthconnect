package com.viewpagerindicator;

import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.View.OnClickListener;

class TabPageIndicator$1
  implements View.OnClickListener
{
  TabPageIndicator$1(TabPageIndicator paramTabPageIndicator) {}
  
  public void onClick(View paramView)
  {
    paramView = (TabPageIndicator.TabView)paramView;
    int i = TabPageIndicator.access$000(this$0).getCurrentItem();
    int j = paramView.getIndex();
    TabPageIndicator.access$000(this$0).setCurrentItem(j);
    if ((i == j) && (TabPageIndicator.access$100(this$0) != null)) {
      TabPageIndicator.access$100(this$0).onTabReselected(j);
    }
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.TabPageIndicator.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */