package com.seeclickfix.ma.android.dagger;

import com.seeclickfix.ma.android.objects.modules.ContextModule;
import dagger.internal.ModuleAdapter;

public final class LoginOnStartupModule$$ModuleAdapter
  extends ModuleAdapter<LoginOnStartupModule>
{
  private static final Class<?>[] INCLUDES = { ContextModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.auth.LoginOnStartupFlag" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public LoginOnStartupModule$$ModuleAdapter()
  {
    super(LoginOnStartupModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, false);
  }
  
  public LoginOnStartupModule newModule()
  {
    return new LoginOnStartupModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dagger.LoginOnStartupModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */