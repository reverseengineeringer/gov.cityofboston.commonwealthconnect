package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.dialogs.DialogManager;
import com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module(injects={LocationDisableDialogLauncher.class})
public class LocDialogLauncherModule
{
  @Provides
  @Singleton
  DialogManager provideDialogManager()
  {
    return new DialogManager();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */