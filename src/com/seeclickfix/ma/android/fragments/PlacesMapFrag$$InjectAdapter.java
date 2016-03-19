package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class PlacesMapFrag$$InjectAdapter
  extends Binding<PlacesMapFrag>
  implements Provider<PlacesMapFrag>, MembersInjector<PlacesMapFrag>
{
  private Binding<LocationAdapter> locationAdapter;
  private Binding<MapHelper> mapHelper;
  private Binding<BaseFrag> supertype;
  
  public PlacesMapFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.PlacesMapFrag", "members/com.seeclickfix.ma.android.fragments.PlacesMapFrag", false, PlacesMapFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    locationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", PlacesMapFrag.class, getClass().getClassLoader());
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", PlacesMapFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", PlacesMapFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public PlacesMapFrag get()
  {
    PlacesMapFrag localPlacesMapFrag = new PlacesMapFrag();
    injectMembers(localPlacesMapFrag);
    return localPlacesMapFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(locationAdapter);
    paramSet2.add(mapHelper);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(PlacesMapFrag paramPlacesMapFrag)
  {
    locationAdapter = ((LocationAdapter)locationAdapter.get());
    mapHelper = ((MapHelper)mapHelper.get());
    supertype.injectMembers(paramPlacesMapFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesMapFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */