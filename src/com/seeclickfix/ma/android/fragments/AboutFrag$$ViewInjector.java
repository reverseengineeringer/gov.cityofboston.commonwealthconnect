package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class AboutFrag$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, AboutFrag paramAboutFrag, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131361889);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361889' for field 'aboutContent' was not found. If this view is optional add '@Optional' annotation.");
    }
    aboutContent = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131361899);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361899' for field 'versionCodeView' was not found. If this view is optional add '@Optional' annotation.");
    }
    versionCodeView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131361891);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361891' for field 'versionStringView' was not found. If this view is optional add '@Optional' annotation.");
    }
    versionStringView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131361896);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361896' for field 'environmentTextView' was not found. If this view is optional add '@Optional' annotation.");
    }
    environmentTextView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131361892);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361892' for field 'deviceTextView' was not found. If this view is optional add '@Optional' annotation.");
    }
    deviceTextView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131361893);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361893' for field 'osTextView' was not found. If this view is optional add '@Optional' annotation.");
    }
    osTextView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131361895);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361895' for field 'devConsoleViewGroup' was not found. If this view is optional add '@Optional' annotation.");
    }
    devConsoleViewGroup = ((ViewGroup)localView);
    localView = paramFinder.findById(paramObject, 2131361900);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361900' for field 'localeSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    localeSpinner = ((Spinner)localView);
    localView = paramFinder.findById(paramObject, 2131361901);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361901' for field 'envirnmentSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    envirnmentSpinner = ((Spinner)localView);
    localView = paramFinder.findById(paramObject, 2131361902);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361902' for field 'mServerEditText' was not found. If this view is optional add '@Optional' annotation.");
    }
    mServerEditText = ((EditText)localView);
    localView = paramFinder.findById(paramObject, 2131361904);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361904' for field 'mPresetLocationSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    mPresetLocationSpinner = ((Spinner)localView);
    localView = paramFinder.findById(paramObject, 2131361905);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361905' for field 'mLatEditText' was not found. If this view is optional add '@Optional' annotation.");
    }
    mLatEditText = ((EditText)localView);
    localView = paramFinder.findById(paramObject, 2131361906);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361906' for field 'mLngEditText' was not found. If this view is optional add '@Optional' annotation.");
    }
    mLngEditText = ((EditText)localView);
    localView = paramFinder.findById(paramObject, 2131362083);
    if (localView != null) {
      localView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          val$target.launchMockLocationActivity();
        }
      });
    }
    localView = paramFinder.findById(paramObject, 2131361910);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361910' for method 'reloadCityData' was not found. If this view is optional add '@Optional' annotation.");
    }
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.reloadCityData();
      }
    });
    localView = paramFinder.findById(paramObject, 2131361909);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361909' for method 'clearDatabase' was not found. If this view is optional add '@Optional' annotation.");
    }
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.clearDatabase();
      }
    });
    localView = paramFinder.findById(paramObject, 2131361908);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361908' for method 'stopFakingLocation' was not found. If this view is optional add '@Optional' annotation.");
    }
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.stopFakingLocation();
      }
    });
    localView = paramFinder.findById(paramObject, 2131361907);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131361907' for method 'setCustonLocation' was not found. If this view is optional add '@Optional' annotation.");
    }
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.setCustonLocation();
      }
    });
    paramFinder = paramFinder.findById(paramObject, 2131361903);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131361903' for method 'setCustomServer' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramFinder.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        val$target.setCustomServer();
      }
    });
  }
  
  public static void reset(AboutFrag paramAboutFrag)
  {
    aboutContent = null;
    versionCodeView = null;
    versionStringView = null;
    environmentTextView = null;
    deviceTextView = null;
    osTextView = null;
    devConsoleViewGroup = null;
    localeSpinner = null;
    envirnmentSpinner = null;
    mServerEditText = null;
    mPresetLocationSpinner = null;
    mLatEditText = null;
    mLngEditText = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.AboutFrag..ViewInjector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */