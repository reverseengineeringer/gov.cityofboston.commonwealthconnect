package com.seeclickfix.ma.android.auth;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class LoginOnStartupFlag$$InjectAdapter
  extends Binding<LoginOnStartupFlag>
  implements Provider<LoginOnStartupFlag>, MembersInjector<LoginOnStartupFlag>
{
  private Binding<Context> mContext;
  
  public LoginOnStartupFlag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.auth.LoginOnStartupFlag", "members/com.seeclickfix.ma.android.auth.LoginOnStartupFlag", false, LoginOnStartupFlag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mContext = paramLinker.requestBinding("android.content.Context", LoginOnStartupFlag.class, getClass().getClassLoader());
  }
  
  public LoginOnStartupFlag get()
  {
    LoginOnStartupFlag localLoginOnStartupFlag = new LoginOnStartupFlag();
    injectMembers(localLoginOnStartupFlag);
    return localLoginOnStartupFlag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mContext);
  }
  
  public void injectMembers(LoginOnStartupFlag paramLoginOnStartupFlag)
  {
    mContext = ((Context)mContext.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.LoginOnStartupFlag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */