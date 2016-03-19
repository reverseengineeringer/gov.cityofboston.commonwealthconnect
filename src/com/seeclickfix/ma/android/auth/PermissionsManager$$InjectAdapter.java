package com.seeclickfix.ma.android.auth;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class PermissionsManager$$InjectAdapter
  extends Binding<PermissionsManager>
  implements Provider<PermissionsManager>, MembersInjector<PermissionsManager>
{
  private Binding<Context> mContext;
  
  public PermissionsManager$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.auth.PermissionsManager", "members/com.seeclickfix.ma.android.auth.PermissionsManager", false, PermissionsManager.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mContext = paramLinker.requestBinding("android.content.Context", PermissionsManager.class, getClass().getClassLoader());
  }
  
  public PermissionsManager get()
  {
    PermissionsManager localPermissionsManager = new PermissionsManager();
    injectMembers(localPermissionsManager);
    return localPermissionsManager;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mContext);
  }
  
  public void injectMembers(PermissionsManager paramPermissionsManager)
  {
    mContext = ((Context)mContext.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.PermissionsManager..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */