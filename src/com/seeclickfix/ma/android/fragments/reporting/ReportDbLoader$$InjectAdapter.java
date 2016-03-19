package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class ReportDbLoader$$InjectAdapter
  extends Binding<ReportDbLoader>
  implements Provider<ReportDbLoader>, MembersInjector<ReportDbLoader>
{
  private Binding<Context> c;
  
  public ReportDbLoader$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader", "members/com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader", true, ReportDbLoader.class);
  }
  
  public void attach(Linker paramLinker)
  {
    c = paramLinker.requestBinding("android.content.Context", ReportDbLoader.class, getClass().getClassLoader());
  }
  
  public ReportDbLoader get()
  {
    ReportDbLoader localReportDbLoader = new ReportDbLoader();
    injectMembers(localReportDbLoader);
    return localReportDbLoader;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(c);
  }
  
  public void injectMembers(ReportDbLoader paramReportDbLoader)
  {
    c = ((Context)c.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */