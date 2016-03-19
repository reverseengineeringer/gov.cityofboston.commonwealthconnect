package com.seeclickfix.ma.android.objects.modules;

import android.content.Context;
import android.location.LocationManager;
import com.seeclickfix.ma.android.location.LocationEnabledHelper;
import dagger.Module;
import dagger.Provides;

@Module(includes={ContextModule.class}, injects={LocationEnabledHelper.class})
public class LocationEnabledModule
{
  @Provides
  LocationManager provideLocationManagerService(Context paramContext)
  {
    return (LocationManager)paramContext.getSystemService("location");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationEnabledModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */