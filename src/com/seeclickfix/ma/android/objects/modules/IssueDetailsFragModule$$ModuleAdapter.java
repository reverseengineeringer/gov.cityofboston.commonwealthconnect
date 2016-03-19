package com.seeclickfix.ma.android.objects.modules;

import dagger.internal.ModuleAdapter;

public final class IssueDetailsFragModule$$ModuleAdapter
  extends ModuleAdapter<IssueDetailsFragModule>
{
  private static final Class<?>[] INCLUDES = { ContextModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.fragments.IssueDetailsFrag" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public IssueDetailsFragModule$$ModuleAdapter()
  {
    super(IssueDetailsFragModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, false);
  }
  
  public IssueDetailsFragModule newModule()
  {
    return new IssueDetailsFragModule();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.IssueDetailsFragModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */