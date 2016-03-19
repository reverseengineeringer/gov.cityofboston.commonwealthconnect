package com.seeclickfix.ma.android.objects.modules;

import android.content.Context;
import dagger.internal.BindingsGroup;
import dagger.internal.ModuleAdapter;
import dagger.internal.ProvidesBinding;
import javax.inject.Provider;

public final class ContextModule$$ModuleAdapter
  extends ModuleAdapter<ContextModule>
{
  private static final Class<?>[] INCLUDES = new Class[0];
  private static final String[] INJECTS = new String[0];
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public ContextModule$$ModuleAdapter()
  {
    super(ContextModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, true);
  }
  
  public void getBindings(BindingsGroup paramBindingsGroup, ContextModule paramContextModule)
  {
    paramBindingsGroup.contributeProvidesBinding("android.content.Context", new ProvideContextProvidesAdapter(paramContextModule));
  }
  
  public static final class ProvideContextProvidesAdapter
    extends ProvidesBinding<Context>
    implements Provider<Context>
  {
    private final ContextModule module;
    
    public ProvideContextProvidesAdapter(ContextModule paramContextModule)
    {
      super(true, "com.seeclickfix.ma.android.objects.modules.ContextModule", "provideContext");
      module = paramContextModule;
      setLibrary(true);
    }
    
    public Context get()
    {
      return module.provideContext();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.ContextModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */