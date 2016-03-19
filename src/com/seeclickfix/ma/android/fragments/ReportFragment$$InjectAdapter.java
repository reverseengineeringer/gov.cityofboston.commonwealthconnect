package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn;
import com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone;
import com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes;
import com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper;
import com.seeclickfix.ma.android.fragments.reporting.ReportProvider;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class ReportFragment$$InjectAdapter
  extends Binding<ReportFragment>
  implements Provider<ReportFragment>, MembersInjector<ReportFragment>
{
  private Binding<AccuracyWarn> accuracyWarning;
  private Binding<LocationAdapter> locationAdapter;
  private Binding<DefaultOtherZone> mDefaultOtherZone;
  private Binding<NonDedicatedReqTypes> mNonDedicatedReqTypes;
  private Binding<ReportProvider> mReportProvider;
  private Binding<MapHelper> mapHelper;
  private Binding<OutsideAreaHelper> outsideAreaHelper;
  private Binding<BaseFrag> supertype;
  
  public ReportFragment$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.ReportFragment", "members/com.seeclickfix.ma.android.fragments.ReportFragment", false, ReportFragment.class);
  }
  
  public void attach(Linker paramLinker)
  {
    locationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", ReportFragment.class, getClass().getClassLoader());
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", ReportFragment.class, getClass().getClassLoader());
    outsideAreaHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper", ReportFragment.class, getClass().getClassLoader());
    mDefaultOtherZone = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone", ReportFragment.class, getClass().getClassLoader());
    accuracyWarning = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn", ReportFragment.class, getClass().getClassLoader());
    mReportProvider = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.reporting.ReportProvider", ReportFragment.class, getClass().getClassLoader());
    mNonDedicatedReqTypes = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes", ReportFragment.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", ReportFragment.class, getClass().getClassLoader(), false, true);
  }
  
  public ReportFragment get()
  {
    ReportFragment localReportFragment = new ReportFragment();
    injectMembers(localReportFragment);
    return localReportFragment;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(locationAdapter);
    paramSet2.add(mapHelper);
    paramSet2.add(outsideAreaHelper);
    paramSet2.add(mDefaultOtherZone);
    paramSet2.add(accuracyWarning);
    paramSet2.add(mReportProvider);
    paramSet2.add(mNonDedicatedReqTypes);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(ReportFragment paramReportFragment)
  {
    locationAdapter = ((LocationAdapter)locationAdapter.get());
    mapHelper = ((MapHelper)mapHelper.get());
    outsideAreaHelper = ((OutsideAreaHelper)outsideAreaHelper.get());
    mDefaultOtherZone = ((DefaultOtherZone)mDefaultOtherZone.get());
    accuracyWarning = ((AccuracyWarn)accuracyWarning.get());
    mReportProvider = ((ReportProvider)mReportProvider.get());
    mNonDedicatedReqTypes = ((NonDedicatedReqTypes)mNonDedicatedReqTypes.get());
    supertype.injectMembers(paramReportFragment);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */