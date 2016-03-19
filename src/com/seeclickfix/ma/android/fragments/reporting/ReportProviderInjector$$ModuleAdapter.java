package com.seeclickfix.ma.android.fragments.reporting;

import dagger.internal.ModuleAdapter;

public final class ReportProviderInjector$$ModuleAdapter
  extends ModuleAdapter<ReportProviderInjector>
{
  private static final Class<?>[] INCLUDES = new Class[0];
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.fragments.ReportFragment" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public ReportProviderInjector$$ModuleAdapter()
  {
    super(ReportProviderInjector.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, false, false);
  }
  
  public ReportProviderInjector newModule()
  {
    return new ReportProviderInjector();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportProviderInjector..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */