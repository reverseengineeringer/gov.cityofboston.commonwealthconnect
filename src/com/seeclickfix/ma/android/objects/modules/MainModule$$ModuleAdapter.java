package com.seeclickfix.ma.android.objects.modules;

import dagger.internal.ModuleAdapter;

public final class MainModule$$ModuleAdapter
  extends ModuleAdapter<MainModule>
{
  private static final Class<?>[] INCLUDES = { IssueDetailsFragModule.class };
  private static final String[] INJECTS = new String[0];
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public MainModule$$ModuleAdapter()
  {
    super(MainModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, false, false);
  }
  
  public MainModule newModule()
  {
    return new MainModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.MainModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */