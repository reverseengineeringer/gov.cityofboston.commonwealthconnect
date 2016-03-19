package com.seeclickfix.ma.android.auth;

import android.content.Context;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.LogoutEvent;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.squareup.otto.Bus;

public class AuthManager
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "AuthManager";
  private static long cookieExpiresMs = 0L;
  private static AuthUser userObj;
  
  public static AuthUser authenticatedUser()
  {
    return MyApplication.instance.currentUser();
  }
  
  public static boolean isAuthenticated()
  {
    AuthUser localAuthUser = authenticatedUser();
    if (localAuthUser != null) {
      return localAuthUser.isAuthenticated();
    }
    return false;
  }
  
  public static void logout(Context paramContext)
  {
    userObj = null;
    PrefsUtil.putLong("Pref:COOKIE_EXPIRES_MS", 0L, paramContext);
    PrefsUtil.putString("Pref:AUTH_USER_JSON", null, paramContext);
    ProfileController.getInstance().clearUser(paramContext);
    PrefsUtil.putString("Pref:COOKIE", null, paramContext);
    MyApplication.getEventBus().post(new LogoutEvent());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.AuthManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */