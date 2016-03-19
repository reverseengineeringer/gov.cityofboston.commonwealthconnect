package com.seeclickfix.ma.android.objects.modules;

import dagger.internal.ModuleAdapter;

public final class LocationUsingFragModule$$ModuleAdapter
  extends ModuleAdapter<LocationUsingFragModule>
{
  private static final Class<?>[] INCLUDES = { LocationAdapterModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.fragments.FeedFrag", "members/com.seeclickfix.ma.android.fragments.PlacesFrag", "members/com.seeclickfix.ma.android.fragments.PlacesMapFrag", "members/com.seeclickfix.ma.android.fragments.ReportFragment", "members/com.seeclickfix.ma.android.fragments.ReportMapFrag", "members/com.seeclickfix.ma.android.fragments.AboutFrag" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public LocationUsingFragModule$$ModuleAdapter()
  {
    super(LocationUsingFragModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, false, false);
  }
  
  public LocationUsingFragModule newModule()
  {
    return new LocationUsingFragModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationUsingFragModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */