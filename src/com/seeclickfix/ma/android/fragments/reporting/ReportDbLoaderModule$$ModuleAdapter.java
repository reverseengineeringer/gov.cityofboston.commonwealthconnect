package com.seeclickfix.ma.android.fragments.reporting;

import com.seeclickfix.ma.android.objects.modules.ContextModule;
import dagger.internal.ModuleAdapter;

public final class ReportDbLoaderModule$$ModuleAdapter
  extends ModuleAdapter<ReportDbLoaderModule>
{
  private static final Class<?>[] INCLUDES = { ContextModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.fragments.reporting.ReportProvider" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public ReportDbLoaderModule$$ModuleAdapter()
  {
    super(ReportDbLoaderModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, false, false);
  }
  
  public ReportDbLoaderModule newModule()
  {
    return new ReportDbLoaderModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportDbLoaderModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */