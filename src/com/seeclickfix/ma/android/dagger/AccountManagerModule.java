package com.seeclickfix.ma.android.dagger;

import android.accounts.AccountManager;
import android.content.Context;
import com.seeclickfix.ma.android.fragments.LoginFrag;
import com.seeclickfix.ma.android.objects.modules.ContextModule;
import dagger.Module;
import dagger.Provides;

@Module(complete=false, includes={ContextModule.class}, injects={LoginFrag.class})
public class AccountManagerModule
{
  @Provides
  AccountManager provideAccountManagerService(Context paramContext)
  {
    return (AccountManager)paramContext.getSystemService("account");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dagger.AccountManagerModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */