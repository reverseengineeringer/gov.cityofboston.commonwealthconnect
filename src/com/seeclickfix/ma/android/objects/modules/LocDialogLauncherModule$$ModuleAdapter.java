package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.dialogs.DialogManager;
import dagger.internal.BindingsGroup;
import dagger.internal.ModuleAdapter;
import dagger.internal.ProvidesBinding;
import javax.inject.Provider;

public final class LocDialogLauncherModule$$ModuleAdapter
  extends ModuleAdapter<LocDialogLauncherModule>
{
  private static final Class<?>[] INCLUDES = new Class[0];
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public LocDialogLauncherModule$$ModuleAdapter()
  {
    super(LocDialogLauncherModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, true, false);
  }
  
  public void getBindings(BindingsGroup paramBindingsGroup, LocDialogLauncherModule paramLocDialogLauncherModule)
  {
    paramBindingsGroup.contributeProvidesBinding("com.seeclickfix.ma.android.dialogs.DialogManager", new ProvideDialogManagerProvidesAdapter(paramLocDialogLauncherModule));
  }
  
  public LocDialogLauncherModule newModule()
  {
    return new LocDialogLauncherModule();
  }
  
  public static final class ProvideDialogManagerProvidesAdapter
    extends ProvidesBinding<DialogManager>
    implements Provider<DialogManager>
  {
    private final LocDialogLauncherModule module;
    
    public ProvideDialogManagerProvidesAdapter(LocDialogLauncherModule paramLocDialogLauncherModule)
    {
      super(true, "com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule", "provideDialogManager");
      module = paramLocDialogLauncherModule;
      setLibrary(false);
    }
    
    public DialogManager get()
    {
      return module.provideDialogManager();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */