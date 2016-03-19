package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.dialogs.DialogManager;
import dagger.internal.ProvidesBinding;
import javax.inject.Provider;

public final class LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter
  extends ProvidesBinding<DialogManager>
  implements Provider<DialogManager>
{
  private final LocDialogLauncherModule module;
  
  public LocDialogLauncherModule$$ModuleAdapter$ProvideDialogManagerProvidesAdapter(LocDialogLauncherModule paramLocDialogLauncherModule)
  {
    super("com.seeclickfix.ma.android.dialogs.DialogManager", true, "com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule", "provideDialogManager");
    module = paramLocDialogLauncherModule;
    setLibrary(false);
  }
  
  public DialogManager get()
  {
    return module.provideDialogManager();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule..ModuleAdapter.ProvideDialogManagerProvidesAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */