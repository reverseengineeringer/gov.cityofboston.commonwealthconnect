package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.Module;

@Module(includes={ContextModule.class, LocationEnabledModule.class}, injects={LocationAdapter.class})
public class LocationAdapterModule {}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationAdapterModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */