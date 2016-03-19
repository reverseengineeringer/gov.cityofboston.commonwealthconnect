package com.seeclickfix.ma.android.objects.modules;

import android.content.Context;
import dagger.internal.ProvidesBinding;
import javax.inject.Provider;

public final class ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter
  extends ProvidesBinding<Context>
  implements Provider<Context>
{
  private final ContextModule module;
  
  public ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter(ContextModule paramContextModule)
  {
    super("android.content.Context", true, "com.seeclickfix.ma.android.objects.modules.ContextModule", "provideContext");
    module = paramContextModule;
    setLibrary(true);
  }
  
  public Context get()
  {
    return module.provideContext();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.ContextModule..ModuleAdapter.ProvideContextProvidesAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */