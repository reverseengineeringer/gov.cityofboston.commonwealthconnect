package com.seeclickfix.ma.android.net;

import android.content.Context;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.UserReg;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

public final class RegistrationRequest
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  public static final String POST = "POST";
  private static final String TAG = "RegistrationRequest";
  private final Context c;
  private HttpPost httpcall;
  private volatile boolean isAborted = false;
  private HttpResponse response;
  private final String url;
  private final UserReg userRegObj;
  
  public RegistrationRequest(UserReg paramUserReg, Context paramContext)
  {
    userRegObj = paramUserReg;
    c = paramContext;
    url = UrlConfig.getRegisterUrl(paramContext);
  }
  
  private void addPostVarsToEntity(MultipartEntity paramMultipartEntity, UserReg paramUserReg)
  {
    HashMap localHashMap = new HashMap();
    RequestFactory.addStaticParamsToMap(localHashMap, c);
    localHashMap.put("api_key", "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    localHashMap.put("user[email]", paramUserReg.getEmail());
    localHashMap.put("user[name]", paramUserReg.getName());
    localHashMap.put("user[password]", paramUserReg.getPassword());
    localHashMap.put("user[password_confirmation]", paramUserReg.getPasswordConfirm());
    localHashMap.put("user[registration_source]", AppBuild.getUserAgent(c));
    paramUserReg = localHashMap.keySet().iterator();
    while (paramUserReg.hasNext())
    {
      String str1 = (String)paramUserReg.next();
      String str2 = (String)localHashMap.get(str1);
      if (str2 != null) {
        try
        {
          paramMultipartEntity.addPart(str1, new StringBody(str2));
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
      }
    }
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
  
  public String connect()
  {
    Object localObject1 = new BasicHttpContext();
    AuthUser localAuthUser = null;
    Object localObject6 = null;
    Object localObject7 = null;
    Object localObject5 = null;
    Object localObject2 = new BasicHttpParams();
    new BasicCookieStore();
    ((HttpParams)localObject2).setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
    ((HttpParams)localObject2).setParameter("http.useragent", AppBuild.getUserAgent(c));
    ((HttpParams)localObject2).setParameter("http.protocol.cookie-policy", "compatibility");
    Object localObject8 = new DefaultHttpClient((HttpParams)localObject2);
    httpcall = new HttpPost(url);
    RequestFactory.setStandardHeadersOnPost(httpcall, c);
    MultipartEntity localMultipartEntity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE);
    addPostVarsToEntity(localMultipartEntity, userRegObj);
    if (userRegObj.getAvatarImagePath() != null) {}
    localObject2 = localAuthUser;
    Object localObject3 = localObject6;
    Object localObject4 = localObject7;
    try
    {
      httpcall.setEntity(localMultipartEntity);
      localObject2 = localAuthUser;
      localObject3 = localObject6;
      localObject4 = localObject7;
      response = ((HttpClient)localObject8).execute(httpcall, (HttpContext)localObject1);
      localObject2 = localAuthUser;
      localObject3 = localObject6;
      localObject4 = localObject7;
      localObject8 = response.getEntity();
      localObject1 = localObject5;
      if (localObject8 != null)
      {
        localObject1 = localObject5;
        localObject2 = localAuthUser;
        localObject3 = localObject6;
        localObject4 = localObject7;
        if (!isAborted)
        {
          localObject2 = localAuthUser;
          localObject3 = localObject6;
          localObject4 = localObject7;
          localObject1 = EntityUtils.toString((HttpEntity)localObject8);
        }
      }
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localAuthUser = (AuthUser)new DeserializeResponse().getJavaObject((String)localObject1, AuthUser.class).get(0);
      localObject5 = localObject1;
      if (localAuthUser != null)
      {
        localObject5 = localObject1;
        localObject2 = localObject1;
        localObject3 = localObject1;
        localObject4 = localObject1;
        if (localAuthUser.isAuthenticated())
        {
          localObject2 = localObject1;
          localObject3 = localObject1;
          localObject4 = localObject1;
          saveCookie(response);
          localObject2 = localObject1;
          localObject3 = localObject1;
          localObject4 = localObject1;
          PrefsUtil.putString("Pref:AUTH_USER_JSON", (String)localObject1, c);
          localObject5 = localObject1;
        }
      }
    }
    catch (Exception localException)
    {
      do
      {
        localObject5 = localObject2;
      } while (localObject2 == null);
      return (String)localObject2;
    }
    catch (IOException localIOException)
    {
      return (String)localObject3;
    }
    catch (ClientProtocolException localClientProtocolException) {}
    return (String)localObject5;
    return (String)localObject4;
  }
  
  public int getHttpCode()
  {
    if (response != null) {
      return response.getStatusLine().getStatusCode();
    }
    return -1;
  }
  
  public boolean wasSuccessful()
  {
    int i = getHttpCode();
    return (i >= 200) && (i < 300);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.RegistrationRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */