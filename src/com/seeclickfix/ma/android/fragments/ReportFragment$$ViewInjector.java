package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class ReportFragment$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, ReportFragment paramReportFragment, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131362046);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131362046' for field 'descriptionLabel' was not found. If this view is optional add '@Optional' annotation.");
    }
    descriptionLabel = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131362035);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131362035' for field 'alertContainerView' was not found. If this view is optional add '@Optional' annotation.");
    }
    alertContainerView = ((ViewGroup)localView);
    paramFinder = paramFinder.findById(paramObject, 2131362034);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131362034' for field 'accuracyContainerView' was not found. If this view is optional add '@Optional' annotation.");
    }
    accuracyContainerView = ((ViewGroup)paramFinder);
  }
  
  public static void reset(ReportFragment paramReportFragment)
  {
    descriptionLabel = null;
    alertContainerView = null;
    accuracyContainerView = null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment..ViewInjector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */