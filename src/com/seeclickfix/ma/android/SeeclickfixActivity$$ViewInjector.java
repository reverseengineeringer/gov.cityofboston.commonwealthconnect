package com.seeclickfix.ma.android;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout;
import butterknife.ButterKnife.Finder;

public class SeeclickfixActivity$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, SeeclickfixActivity paramSeeclickfixActivity, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131361859);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361859' for field 'mNavBtnAbout' and method 'showAbout' was not found. If this view is optional add '@Optional' annotation.");
    }
    mNavBtnAbout = ((Button)localView);
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.showAbout();
      }
    });
    localView = paramFinder.findById(paramObject, 2131361858);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361858' for field 'mNavBtnHelp' and method 'showHelp' was not found. If this view is optional add '@Optional' annotation.");
    }
    mNavBtnHelp = ((Button)localView);
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.showHelp();
      }
    });
    paramFinder = paramFinder.findById(paramObject, 2131361856);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131361856' for field 'mDrawerContainer' was not found. If this view is optional add '@Optional' annotation.");
    }
    mDrawerContainer = ((RelativeLayout)paramFinder);
  }
  
  public static void reset(SeeclickfixActivity paramSeeclickfixActivity)
  {
    mNavBtnAbout = null;
    mNavBtnHelp = null;
    mDrawerContainer = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SeeclickfixActivity..ViewInjector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */