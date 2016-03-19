package com.seeclickfix.ma.android.objects.modules;

import dagger.internal.ModuleAdapter;

public final class LocationAdapterModule$$ModuleAdapter
  extends ModuleAdapter<LocationAdapterModule>
{
  private static final Class<?>[] INCLUDES = { ContextModule.class, LocationEnabledModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.location.LocationAdapter" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public LocationAdapterModule$$ModuleAdapter()
  {
    super(LocationAdapterModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, false);
  }
  
  public LocationAdapterModule newModule()
  {
    return new LocationAdapterModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationAdapterModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */