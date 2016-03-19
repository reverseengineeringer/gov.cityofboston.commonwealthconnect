package com.seeclickfix.ma.android.dialogs.launchers;

import com.seeclickfix.ma.android.dialogs.DialogManager;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class LocationDisableDialogLauncher$$InjectAdapter
  extends Binding<LocationDisableDialogLauncher>
  implements Provider<LocationDisableDialogLauncher>, MembersInjector<LocationDisableDialogLauncher>
{
  private Binding<DialogManager> dialogManager;
  
  public LocationDisableDialogLauncher$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher", "members/com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher", false, LocationDisableDialogLauncher.class);
  }
  
  public void attach(Linker paramLinker)
  {
    dialogManager = paramLinker.requestBinding("com.seeclickfix.ma.android.dialogs.DialogManager", LocationDisableDialogLauncher.class, getClass().getClassLoader());
  }
  
  public LocationDisableDialogLauncher get()
  {
    LocationDisableDialogLauncher localLocationDisableDialogLauncher = new LocationDisableDialogLauncher();
    injectMembers(localLocationDisableDialogLauncher);
    return localLocationDisableDialogLauncher;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(dialogManager);
  }
  
  public void injectMembers(LocationDisableDialogLauncher paramLocationDisableDialogLauncher)
  {
    dialogManager = ((DialogManager)dialogManager.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */