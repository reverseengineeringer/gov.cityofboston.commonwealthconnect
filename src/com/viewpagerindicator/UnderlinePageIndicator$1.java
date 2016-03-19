package com.viewpagerindicator;

import android.graphics.Paint;

class UnderlinePageIndicator$1
  implements Runnable
{
  UnderlinePageIndicator$1(UnderlinePageIndicator paramUnderlinePageIndicator) {}
  
  public void run()
  {
    if (!UnderlinePageIndicator.access$000(this$0)) {}
    int i;
    do
    {
      return;
      i = Math.max(UnderlinePageIndicator.access$100(this$0).getAlpha() - UnderlinePageIndicator.access$200(this$0), 0);
      UnderlinePageIndicator.access$100(this$0).setAlpha(i);
      this$0.invalidate();
    } while (i <= 0);
    this$0.postDelayed(this, 30L);
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.UnderlinePageIndicator.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */