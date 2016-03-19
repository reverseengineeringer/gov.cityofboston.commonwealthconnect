package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import butterknife.ButterKnife.Finder;

public class LoginFrag$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, LoginFrag paramLoginFrag, Object paramObject)
  {
    paramFinder = paramFinder.findById(paramObject, 2131361969);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131361969' for field 'skipButton' and method 'skipLogin' was not found. If this view is optional add '@Optional' annotation.");
    }
    skipButton = ((Button)paramFinder);
    paramFinder.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.skipLogin();
      }
    });
  }
  
  public static void reset(LoginFrag paramLoginFrag)
  {
    skipButton = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.LoginFrag..ViewInjector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */