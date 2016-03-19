package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.dagger.LoginOnStartupModule;
import dagger.Module;

@Module(includes={LocationAdapterModule.class, LoginOnStartupModule.class}, injects={SeeclickfixActivity.class}, library=true)
public class MainActivityModule {}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.MainActivityModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */