package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class PlacesFrag$$InjectAdapter
  extends Binding<PlacesFrag>
  implements Provider<PlacesFrag>, MembersInjector<PlacesFrag>
{
  private Binding<LocationAdapter> locationAdapter;
  private Binding<MapHelper> mapHelper;
  private Binding<BaseFrag> supertype;
  
  public PlacesFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.PlacesFrag", "members/com.seeclickfix.ma.android.fragments.PlacesFrag", false, PlacesFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    locationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", PlacesFrag.class, getClass().getClassLoader());
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", PlacesFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", PlacesFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public PlacesFrag get()
  {
    PlacesFrag localPlacesFrag = new PlacesFrag();
    injectMembers(localPlacesFrag);
    return localPlacesFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(locationAdapter);
    paramSet2.add(mapHelper);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(PlacesFrag paramPlacesFrag)
  {
    locationAdapter = ((LocationAdapter)locationAdapter.get());
    mapHelper = ((MapHelper)mapHelper.get());
    supertype.injectMembers(paramPlacesFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */