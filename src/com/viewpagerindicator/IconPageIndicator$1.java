package com.viewpagerindicator;

import android.view.View;

class IconPageIndicator$1
  implements Runnable
{
  IconPageIndicator$1(IconPageIndicator paramIconPageIndicator, View paramView) {}
  
  public void run()
  {
    int i = val$iconView.getLeft();
    int j = (this$0.getWidth() - val$iconView.getWidth()) / 2;
    this$0.smoothScrollTo(i - j, 0);
    IconPageIndicator.access$002(this$0, null);
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.IconPageIndicator.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */