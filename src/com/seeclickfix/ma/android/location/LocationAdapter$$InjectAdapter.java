package com.seeclickfix.ma.android.location;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class LocationAdapter$$InjectAdapter
  extends Binding<LocationAdapter>
  implements Provider<LocationAdapter>, MembersInjector<LocationAdapter>
{
  private Binding<Context> context;
  private Binding<LocationEnabledHelper> locationEnabledHelper;
  
  public LocationAdapter$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.location.LocationAdapter", "members/com.seeclickfix.ma.android.location.LocationAdapter", true, LocationAdapter.class);
  }
  
  public void attach(Linker paramLinker)
  {
    context = paramLinker.requestBinding("android.content.Context", LocationAdapter.class, getClass().getClassLoader());
    locationEnabledHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationEnabledHelper", LocationAdapter.class, getClass().getClassLoader());
  }
  
  public LocationAdapter get()
  {
    LocationAdapter localLocationAdapter = new LocationAdapter();
    injectMembers(localLocationAdapter);
    return localLocationAdapter;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(context);
    paramSet2.add(locationEnabledHelper);
  }
  
  public void injectMembers(LocationAdapter paramLocationAdapter)
  {
    context = ((Context)context.get());
    locationEnabledHelper = ((LocationEnabledHelper)locationEnabledHelper.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationAdapter..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */