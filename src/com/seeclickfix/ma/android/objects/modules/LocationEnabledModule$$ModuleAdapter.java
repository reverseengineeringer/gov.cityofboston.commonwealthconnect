package com.seeclickfix.ma.android.objects.modules;

import android.content.Context;
import android.location.LocationManager;
import dagger.internal.Binding;
import dagger.internal.BindingsGroup;
import dagger.internal.Linker;
import dagger.internal.ModuleAdapter;
import dagger.internal.ProvidesBinding;
import java.util.Set;
import javax.inject.Provider;

public final class LocationEnabledModule$$ModuleAdapter
  extends ModuleAdapter<LocationEnabledModule>
{
  private static final Class<?>[] INCLUDES = { ContextModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.location.LocationEnabledHelper" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public LocationEnabledModule$$ModuleAdapter()
  {
    super(LocationEnabledModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, false);
  }
  
  public void getBindings(BindingsGroup paramBindingsGroup, LocationEnabledModule paramLocationEnabledModule)
  {
    paramBindingsGroup.contributeProvidesBinding("android.location.LocationManager", new ProvideLocationManagerServiceProvidesAdapter(paramLocationEnabledModule));
  }
  
  public LocationEnabledModule newModule()
  {
    return new LocationEnabledModule();
  }
  
  public static final class ProvideLocationManagerServiceProvidesAdapter
    extends ProvidesBinding<LocationManager>
    implements Provider<LocationManager>
  {
    private Binding<Context> context;
    private final LocationEnabledModule module;
    
    public ProvideLocationManagerServiceProvidesAdapter(LocationEnabledModule paramLocationEnabledModule)
    {
      super(false, "com.seeclickfix.ma.android.objects.modules.LocationEnabledModule", "provideLocationManagerService");
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
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationEnabledModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */