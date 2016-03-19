package com.seeclickfix.ma.android.fragments;

import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.seeclickfix.ma.android.events.SplashContinueEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;

public class SplashFrag
  extends BaseFrag
{
  static Handler handler = new Handler();
  private static Runnable runnable = new Runnable()
  {
    public void run()
    {
      SplashFrag.postEvent(new SplashContinueEvent());
    }
  };
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public boolean getShouldShowActionBar()
  {
    return false;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903097, paramViewGroup, false));
    return rootFrag;
  }
  
  public void onPause()
  {
    super.onPause();
    handler.removeCallbacks(runnable);
  }
  
  public void onResume()
  {
    super.onResume();
    rootFrag.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        SplashFrag.handler.removeCallbacksAndMessages(null);
        SplashFrag.postEvent(new SplashContinueEvent());
      }
    });
    handler.postDelayed(runnable, 2500L);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.SplashFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */