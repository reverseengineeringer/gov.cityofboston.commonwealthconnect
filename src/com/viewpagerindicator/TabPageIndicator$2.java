package com.viewpagerindicator;

import android.view.View;

class TabPageIndicator$2
  implements Runnable
{
  TabPageIndicator$2(TabPageIndicator paramTabPageIndicator, View paramView) {}
  
  public void run()
  {
    int i = val$tabView.getLeft();
    int j = (this$0.getWidth() - val$tabView.getWidth()) / 2;
    this$0.smoothScrollTo(i - j, 0);
    TabPageIndicator.access$202(this$0, null);
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.TabPageIndicator.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */