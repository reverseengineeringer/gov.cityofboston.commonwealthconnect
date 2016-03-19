package com.seeclickfix.ma.android.fragments.reporting;

import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class ReportProvider$$InjectAdapter
  extends Binding<ReportProvider>
  implements Provider<ReportProvider>, MembersInjector<ReportProvider>
{
  private Binding<ReportDbLoader> mReportDbLoader;
  
  public ReportProvider$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.reporting.ReportProvider", "members/com.seeclickfix.ma.android.fragments.reporting.ReportProvider", true, ReportProvider.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mReportDbLoader = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.reporting.ReportDbLoader", ReportProvider.class, getClass().getClassLoader());
  }
  
  public ReportProvider get()
  {
    ReportProvider localReportProvider = new ReportProvider();
    injectMembers(localReportProvider);
    return localReportProvider;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mReportDbLoader);
  }
  
  public void injectMembers(ReportProvider paramReportProvider)
  {
    mReportDbLoader = ((ReportDbLoader)mReportDbLoader.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportProvider..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */