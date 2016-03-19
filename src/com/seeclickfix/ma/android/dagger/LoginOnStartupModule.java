package com.seeclickfix.ma.android.dagger;

import com.seeclickfix.ma.android.auth.LoginOnStartupFlag;
import com.seeclickfix.ma.android.objects.modules.ContextModule;
import dagger.Module;

@Module(includes={ContextModule.class}, injects={LoginOnStartupFlag.class})
public class LoginOnStartupModule {}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dagger.LoginOnStartupModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */