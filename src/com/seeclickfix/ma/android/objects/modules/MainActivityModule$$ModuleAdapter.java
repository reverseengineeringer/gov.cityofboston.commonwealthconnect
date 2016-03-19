package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.dagger.LoginOnStartupModule;
import dagger.internal.ModuleAdapter;

public final class MainActivityModule$$ModuleAdapter
  extends ModuleAdapter<MainActivityModule>
{
  private static final Class<?>[] INCLUDES = { LocationAdapterModule.class, LoginOnStartupModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.SeeclickfixActivity" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public MainActivityModule$$ModuleAdapter()
  {
    super(MainActivityModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, true);
  }
  
  public MainActivityModule newModule()
  {
    return new MainActivityModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.MainActivityModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */