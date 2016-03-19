package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;

class UnboxingPagerFrag$1
  implements View.OnClickListener
{
  UnboxingPagerFrag$1(UnboxingPagerFrag paramUnboxingPagerFrag) {}
  
  public void onClick(View paramView)
  {
    paramView = ObjectAnimator.ofFloat(UnboxingPagerFrag.access$000(this$0), "alpha", new float[] { 0.0F, 1.0F });
    paramView.setDuration(50L);
    paramView.start();
    UnboxingPagerFrag.access$100(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.UnboxingPagerFrag.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */