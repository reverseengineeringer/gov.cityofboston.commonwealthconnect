package com.seeclickfix.ma.android.objects.modules;

import android.content.Context;
import android.location.LocationManager;
import dagger.internal.Binding;
import dagger.internal.Linker;
import dagger.internal.ProvidesBinding;
import java.util.Set;
import javax.inject.Provider;

public final class LocationEnabledModule$$ModuleAdapter$ProvideLocationManagerServiceProvidesAdapter
  extends ProvidesBinding<LocationManager>
  implements Provider<LocationManager>
{
  private Binding<Context> context;
  private final LocationEnabledModule module;
  
  public LocationEnabledModule$$ModuleAdapter$ProvideLocationManagerServiceProvidesAdapter(LocationEnabledModule paramLocationEnabledModule)
  {
    super("android.location.LocationManager", false, "com.seeclickfix.ma.android.objects.modules.LocationEnabledModule", "provideLocationManagerService");
    module = paramLocationEnabledModule;
    setLibrary(false);
  }
  
  public void attach(Linker paramLinker)
  {
    context = paramLinker.requestBinding("android.content.Context", LocationEnabledModule.class, getClass().getClassLoader());
  }
  
  public LocationManager get()
  {
    return module.provideLocationManagerService((Context)context.get());
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet1.add(context);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationEnabledModule..ModuleAdapter.ProvideLocationManagerServiceProvidesAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */