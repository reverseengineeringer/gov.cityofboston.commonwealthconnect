package com.seeclickfix.ma.android.dagger;

import android.accounts.AccountManager;
import android.content.Context;
import dagger.internal.Binding;
import dagger.internal.Linker;
import dagger.internal.ProvidesBinding;
import java.util.Set;
import javax.inject.Provider;

public final class AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter
  extends ProvidesBinding<AccountManager>
  implements Provider<AccountManager>
{
  private Binding<Context> context;
  private final AccountManagerModule module;
  
  public AccountManagerModule$$ModuleAdapter$ProvideAccountManagerServiceProvidesAdapter(AccountManagerModule paramAccountManagerModule)
  {
    super("android.accounts.AccountManager", false, "com.seeclickfix.ma.android.dagger.AccountManagerModule", "provideAccountManagerService");
    module = paramAccountManagerModule;
    setLibrary(false);
  }
  
  public void attach(Linker paramLinker)
  {
    context = paramLinker.requestBinding("android.content.Context", AccountManagerModule.class, getClass().getClassLoader());
  }
  
  public AccountManager get()
  {
    return module.provideAccountManagerService((Context)context.get());
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet1.add(context);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dagger.AccountManagerModule..ModuleAdapter.ProvideAccountManagerServiceProvidesAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */