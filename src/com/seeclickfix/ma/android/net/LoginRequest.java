package com.seeclickfix.ma.android.net;

import android.content.Context;
import android.content.res.Resources;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.util.ResponseHelper;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

public final class LoginRequest
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  public static final String POST = "POST";
  private static final String TAG = "LoginRequest";
  private final Context c;
  private final String email;
  private HttpPost httpcall;
  private volatile boolean isAborted = false;
  private final String pwd;
  private final String url;
  
  public LoginRequest(String paramString1, String paramString2, Context paramContext)
  {
    email = paramString1;
    pwd = paramString2;
    c = paramContext;
    url = UrlConfig.getLoginUrl(paramContext);
  }
  
  private void saveCookie(HttpResponse paramHttpResponse)
  {
    paramHttpResponse = paramHttpResponse.getAllHeaders();
    int j = paramHttpResponse.length;
    int i = 0;
    for (;;)
    {
      String str;
      SimpleDateFormat localSimpleDateFormat;
      if (i < j)
      {
        str = paramHttpResponse[i].getValue();
        if (str.startsWith("_scf_session_key")) {
          PrefsUtil.putString("Pref:COOKIE", str.substring(str.indexOf("=") + 1, str.indexOf(";")), c);
        }
        if (str.contains("expires="))
        {
          str = str.substring(str.indexOf("expires=") + 8, str.length());
          localSimpleDateFormat = new SimpleDateFormat("EEE, dd-MMM-yyyy kk:mm:ss z");
        }
      }
      try
      {
        PrefsUtil.putLong("Pref:COOKIE_EXPIRES_MS", localSimpleDateFormat.parse(str).getTime(), c);
        i += 1;
        continue;
        return;
      }
      catch (ParseException localParseException)
      {
        for (;;) {}
      }
    }
  }
  
  public void abort()
  {
    if (httpcall != null) {}
    try
    {
      httpcall.abort();
      isAborted = true;
      return;
    }
    catch (Exception localException) {}
  }
  
  public AuthUser authenticate()
  {
    String str1 = c.getResources().getString(2131492965);
    String str2 = c.getResources().getString(2131492979);
    localObject3 = new AuthUser(str1);
    Object localObject1 = new BasicHttpContext();
    Object localObject6 = null;
    Object localObject2 = new BasicHttpParams();
    new BasicCookieStore();
    ((HttpParams)localObject2).setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
    ((HttpParams)localObject2).setParameter("http.useragent", AppBuild.getUserAgent(c));
    ((HttpParams)localObject2).setParameter("http.protocol.cookie-policy", "compatibility");
    Object localObject5 = new DefaultHttpClient((HttpParams)localObject2);
    httpcall = new HttpPost(url);
    Object localObject7 = new ArrayList();
    ((List)localObject7).add(new BasicNameValuePair("login", email));
    ((List)localObject7).add(new BasicNameValuePair("password", pwd));
    ((List)localObject7).add(new BasicNameValuePair("api_key", "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"));
    RequestFactory.addDeviceNameValues(c, (List)localObject7);
    Object localObject4 = localObject3;
    localObject2 = localObject3;
    try
    {
      httpcall.setEntity(new UrlEncodedFormEntity((List)localObject7));
      localObject4 = localObject3;
      localObject2 = localObject3;
      RequestFactory.setStandardHeadersOnPost(httpcall, c);
      localObject4 = localObject3;
      localObject2 = localObject3;
      localObject7 = ((HttpClient)localObject5).execute(httpcall, (HttpContext)localObject1);
      localObject4 = localObject3;
      localObject2 = localObject3;
      HttpEntity localHttpEntity = ((HttpResponse)localObject7).getEntity();
      localObject5 = localObject6;
      localObject1 = localObject3;
      if (localHttpEntity != null)
      {
        localObject5 = localObject6;
        localObject1 = localObject3;
        localObject4 = localObject3;
        localObject2 = localObject3;
        if (!isAborted)
        {
          localObject4 = localObject3;
          localObject2 = localObject3;
          if (!ResponseHelper.wasSuccessful((HttpResponse)localObject7)) {
            break label387;
          }
          localObject4 = localObject3;
          localObject2 = localObject3;
          localObject5 = EntityUtils.toString(localHttpEntity);
          localObject4 = localObject3;
          localObject2 = localObject3;
          localObject1 = AuthUser.from_json((String)localObject5);
        }
      }
      for (;;)
      {
        localObject4 = localObject1;
        localObject2 = localObject1;
        localObject3 = localObject1;
        if (!((AuthUser)localObject1).isAuthenticated()) {
          break;
        }
        localObject4 = localObject1;
        localObject2 = localObject1;
        saveCookie((HttpResponse)localObject7);
        localObject4 = localObject1;
        localObject2 = localObject1;
        PrefsUtil.putString("Pref:AUTH_USER_JSON", (String)localObject5, c);
        return (AuthUser)localObject1;
        label387:
        localObject4 = localObject3;
        localObject2 = localObject3;
        localObject1 = new AuthUser(String.format("%s (%s: %d)", new Object[] { str1, str2, Integer.valueOf(((HttpResponse)localObject7).getStatusLine().getStatusCode()) }));
        localObject5 = localObject6;
      }
      return (AuthUser)localObject3;
    }
    catch (IOException localIOException)
    {
      ((AuthUser)localObject4).setResponse(c.getResources().getString(2131492972));
      return (AuthUser)localObject4;
    }
    catch (ClientProtocolException localClientProtocolException)
    {
      localObject3 = localObject2;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.LoginRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */