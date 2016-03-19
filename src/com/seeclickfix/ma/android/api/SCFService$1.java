package com.seeclickfix.ma.android.api;

import android.content.Context;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import java.net.HttpCookie;
import retrofit.RequestInterceptor;
import retrofit.RequestInterceptor.RequestFacade;

final class SCFService$1
  implements RequestInterceptor
{
  SCFService$1(Context paramContext) {}
  
  public void intercept(RequestInterceptor.RequestFacade paramRequestFacade)
  {
    HttpCookie localHttpCookie = new HttpCookie(AppBuild.getCookieName(val$appContext), PrefsUtil.getString("Pref:COOKIE", "", val$appContext));
    localHttpCookie.setVersion(0);
    paramRequestFacade.addHeader("User-Agent", AppBuild.getUserAgent(val$appContext));
    paramRequestFacade.addHeader("Accept-Language", LocaleManager.getLanguage(val$appContext));
    paramRequestFacade.addHeader("Cookie", localHttpCookie.toString());
    paramRequestFacade.addHeader("Accept", "application/json");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */