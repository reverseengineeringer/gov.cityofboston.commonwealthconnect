package gov.cityofboston.commonwealthconnect;

import com.seeclickfix.ma.android.objects.modules.MainActivityModule;
import dagger.internal.ModuleAdapter;

public final class DedicatedActivity$DedicatedActivityModule$$ModuleAdapter
  extends ModuleAdapter<DedicatedActivity.DedicatedActivityModule>
{
  private static final Class<?>[] INCLUDES = { MainActivityModule.class };
  private static final String[] INJECTS = { "members/gov.cityofboston.commonwealthconnect.DedicatedActivity" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public DedicatedActivity$DedicatedActivityModule$$ModuleAdapter()
  {
    super(DedicatedActivity.DedicatedActivityModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, true);
  }
  
  public DedicatedActivity.DedicatedActivityModule newModule()
  {
    return new DedicatedActivity.DedicatedActivityModule();
  }
}

/* Location:
 * Qualified Name:     gov.cityofboston.commonwealthconnect.DedicatedActivity.DedicatedActivityModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */