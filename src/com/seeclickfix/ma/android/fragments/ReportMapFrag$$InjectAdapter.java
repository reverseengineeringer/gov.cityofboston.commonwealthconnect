package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class ReportMapFrag$$InjectAdapter
  extends Binding<ReportMapFrag>
  implements Provider<ReportMapFrag>, MembersInjector<ReportMapFrag>
{
  private Binding<LocationAdapter> locationAdapter;
  private Binding<MapHelper> mapHelper;
  private Binding<BaseFrag> supertype;
  
  public ReportMapFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.ReportMapFrag", "members/com.seeclickfix.ma.android.fragments.ReportMapFrag", false, ReportMapFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    locationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", ReportMapFrag.class, getClass().getClassLoader());
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", ReportMapFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", ReportMapFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public ReportMapFrag get()
  {
    ReportMapFrag localReportMapFrag = new ReportMapFrag();
    injectMembers(localReportMapFrag);
    return localReportMapFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(locationAdapter);
    paramSet2.add(mapHelper);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(ReportMapFrag paramReportMapFrag)
  {
    locationAdapter = ((LocationAdapter)locationAdapter.get());
    mapHelper = ((MapHelper)mapHelper.get());
    supertype.injectMembers(paramReportMapFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportMapFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */