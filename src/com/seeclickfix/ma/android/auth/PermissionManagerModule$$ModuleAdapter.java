package com.seeclickfix.ma.android.auth;

import dagger.internal.ModuleAdapter;

public final class PermissionManagerModule$$ModuleAdapter
  extends ModuleAdapter<PermissionManagerModule>
{
  private static final Class<?>[] INCLUDES = new Class[0];
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.fragments.IssueDetailsFrag", "members/com.seeclickfix.ma.android.fragments.FeedFrag" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public PermissionManagerModule$$ModuleAdapter()
  {
    super(PermissionManagerModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, false, false);
  }
  
  public PermissionManagerModule newModule()
  {
    return new PermissionManagerModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.PermissionManagerModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */