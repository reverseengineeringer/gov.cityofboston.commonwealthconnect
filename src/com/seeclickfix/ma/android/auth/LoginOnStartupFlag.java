package com.seeclickfix.ma.android.auth;

import android.content.Context;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import javax.inject.Inject;

public class LoginOnStartupFlag
{
  @Inject
  Context mContext;
  
  public boolean shouldPromptForLogin(DedicatedApp paramDedicatedApp)
  {
    boolean bool2 = false;
    boolean bool3 = getOptionsloginOnStartup;
    boolean bool4 = AuthManager.isAuthenticated();
    boolean bool5 = PrefsUtil.getBoolean("PrefNames:SKIPPED_LOGIN", false, mContext);
    boolean bool1 = bool2;
    if (bool3)
    {
      bool1 = bool2;
      if (!bool4)
      {
        bool1 = bool2;
        if (!bool5) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.LoginOnStartupFlag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */