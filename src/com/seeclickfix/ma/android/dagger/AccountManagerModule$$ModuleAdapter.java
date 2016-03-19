package com.seeclickfix.ma.android.dagger;

import android.accounts.AccountManager;
import android.content.Context;
import com.seeclickfix.ma.android.objects.modules.ContextModule;
import dagger.internal.Binding;
import dagger.internal.BindingsGroup;
import dagger.internal.Linker;
import dagger.internal.ModuleAdapter;
import dagger.internal.ProvidesBinding;
import java.util.Set;
import javax.inject.Provider;

public final class AccountManagerModule$$ModuleAdapter
  extends ModuleAdapter<AccountManagerModule>
{
  private static final Class<?>[] INCLUDES = { ContextModule.class };
  private static final String[] INJECTS = { "members/com.seeclickfix.ma.android.fragments.LoginFrag" };
  private static final Class<?>[] STATIC_INJECTIONS = new Class[0];
  
  public AccountManagerModule$$ModuleAdapter()
  {
    super(AccountManagerModule.class, INJECTS, STATIC_INJECTIONS, false, INCLUDES, false, false);
  }
  
  public void getBindings(BindingsGroup paramBindingsGroup, AccountManagerModule paramAccountManagerModule)
  {
    paramBindingsGroup.contributeProvidesBinding("android.accounts.AccountManager", new ProvideAccountManagerServiceProvidesAdapter(paramAccountManagerModule));
  }
  
  public AccountManagerModule newModule()
  {
    return new AccountManagerModule();
  }
  
  public static final class ProvideAccountManagerServiceProvidesAdapter
    extends ProvidesBinding<AccountManager>
    implements Provider<AccountManager>
  {
    private Binding<Context> context;
    private final AccountManagerModule module;
    
    public ProvideAccountManagerServiceProvidesAdapter(AccountManagerModule paramAccountManagerModule)
    {
      super(false, "com.seeclickfix.ma.android.dagger.AccountManagerModule", "provideAccountManagerService");
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
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dagger.AccountManagerModule..ModuleAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */