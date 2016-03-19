package com.seeclickfix.ma.android.fragments;

import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.events.SplashContinueEvent;

class SplashFrag$1
  implements View.OnClickListener
{
  SplashFrag$1(SplashFrag paramSplashFrag) {}
  
  public void onClick(View paramView)
  {
    SplashFrag.handler.removeCallbacksAndMessages(null);
    SplashFrag.access$000(new SplashContinueEvent());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.SplashFrag.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */