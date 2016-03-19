package com.seeclickfix.ma.android.fragments;

import android.accounts.AccountManager;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class LoginFrag$$InjectAdapter
  extends Binding<LoginFrag>
  implements Provider<LoginFrag>, MembersInjector<LoginFrag>
{
  private Binding<AccountManager> mAccountManager;
  private Binding<BaseFrag> supertype;
  
  public LoginFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.LoginFrag", "members/com.seeclickfix.ma.android.fragments.LoginFrag", false, LoginFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mAccountManager = paramLinker.requestBinding("android.accounts.AccountManager", LoginFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", LoginFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public LoginFrag get()
  {
    LoginFrag localLoginFrag = new LoginFrag();
    injectMembers(localLoginFrag);
    return localLoginFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mAccountManager);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(LoginFrag paramLoginFrag)
  {
    mAccountManager = ((AccountManager)mAccountManager.get());
    supertype.injectMembers(paramLoginFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.LoginFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */