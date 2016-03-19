package com.seeclickfix.ma.android.location;

import android.content.Context;
import android.location.LocationManager;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class LocationEnabledHelper$$InjectAdapter
  extends Binding<LocationEnabledHelper>
  implements Provider<LocationEnabledHelper>, MembersInjector<LocationEnabledHelper>
{
  private Binding<Context> context;
  private Binding<LocationManager> locationManager;
  
  public LocationEnabledHelper$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.location.LocationEnabledHelper", "members/com.seeclickfix.ma.android.location.LocationEnabledHelper", true, LocationEnabledHelper.class);
  }
  
  public void attach(Linker paramLinker)
  {
    locationManager = paramLinker.requestBinding("android.location.LocationManager", LocationEnabledHelper.class, getClass().getClassLoader());
    context = paramLinker.requestBinding("android.content.Context", LocationEnabledHelper.class, getClass().getClassLoader());
  }
  
  public LocationEnabledHelper get()
  {
    LocationEnabledHelper localLocationEnabledHelper = new LocationEnabledHelper();
    injectMembers(localLocationEnabledHelper);
    return localLocationEnabledHelper;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(locationManager);
    paramSet2.add(context);
  }
  
  public void injectMembers(LocationEnabledHelper paramLocationEnabledHelper)
  {
    locationManager = ((LocationManager)locationManager.get());
    context = ((Context)context.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationEnabledHelper..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */