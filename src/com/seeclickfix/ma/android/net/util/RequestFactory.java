package com.seeclickfix.ma.android.net.util;

import android.content.Context;
import android.os.Build;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;

public class RequestFactory
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "RequestFactory";
  
  public static final void addDeviceNameValues(Context paramContext, List<NameValuePair> paramList)
  {
    HashMap localHashMap = new HashMap();
    addStaticParamsToMap(localHashMap, paramContext);
    addMapToNameValuePair(localHashMap, paramList);
  }
  
  public static final void addMapToNameValuePair(Map<String, String> paramMap, List<NameValuePair> paramList)
  {
    Iterator localIterator = paramMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      paramList.add(new BasicNameValuePair(str, (String)paramMap.get(str)));
    }
  }
  
  public static final Map<String, String> addStaticParamsToMap(Map<String, String> paramMap, Context paramContext)
  {
    paramContext = Settings.Secure.getString(paramContext.getContentResolver(), "android_id");
    String str = Build.MODEL;
    paramMap.put("device_id", paramContext);
    paramMap.put("device_os", "android");
    paramMap.put("device_name", str);
    return paramMap;
  }
  
  public static final String constructUrl(String paramString, Map<String, String> paramMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramString);
    if ((paramMap != null) && (paramMap.size() > 0))
    {
      localStringBuilder.append("?");
      paramString = paramMap.keySet().iterator();
      while (paramString.hasNext())
      {
        String str1 = (String)paramString.next();
        try
        {
          if (paramMap.get(str1) != null)
          {
            String str2 = URLEncoder.encode((String)paramMap.get(str1), "UTF-8");
            localStringBuilder.append(str1 + "=" + str2 + "&");
          }
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
      }
    }
    return localStringBuilder.toString();
  }
  
  public static Map<String, String> getStandardHeaders(Context paramContext)
  {
    String str2 = AppBuild.getCookieName(paramContext);
    Object localObject = PrefsUtil.getString("Pref:COOKIE", "Error No Cookie", paramContext);
    String str1 = LocaleManager.getLocaleString(paramContext);
    str2 = str2 + "=" + (String)localObject;
    localObject = new HashMap();
    ((Map)localObject).put("Set-Cookie", str2);
    ((Map)localObject).put("User-Agent", AppBuild.getUserAgent(paramContext));
    ((Map)localObject).put("Accept-Language", str1);
    return (Map<String, String>)localObject;
  }
  
  public static void setStandardHeadersOnPost(HttpPost paramHttpPost, Context paramContext)
  {
    String str1 = AppBuild.getCookieName(paramContext);
    String str2 = PrefsUtil.getString("Pref:COOKIE", "", paramContext);
    String str3 = LocaleManager.getLocaleString(paramContext);
    if (!TextUtils.isEmpty(str2)) {
      paramHttpPost.setHeader("Cookie", str1 + "=" + str2);
    }
    paramHttpPost.setHeader("User-Agent", AppBuild.getUserAgent(paramContext));
    paramHttpPost.setHeader("Accept-Language", str3);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.util.RequestFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */