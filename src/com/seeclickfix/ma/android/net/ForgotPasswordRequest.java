package com.seeclickfix.ma.android.net;

import android.content.Context;
import android.content.res.Resources;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.util.ResponseHelper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

public final class ForgotPasswordRequest
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  public static final String POST = "POST";
  private static final String TAG = "ForgotPasswordRequest";
  private final Context c;
  private final String email;
  private HttpPost httpcall;
  private volatile boolean isAborted = false;
  private final String url;
  
  public ForgotPasswordRequest(String paramString, Context paramContext)
  {
    email = paramString;
    c = paramContext;
    url = UrlConfig.getForgotPasswordUrl(paramContext);
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
  
  public String sendEmail()
  {
    Object localObject1 = new BasicHttpContext();
    Object localObject2 = new BasicHttpParams();
    ((HttpParams)localObject2).setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
    ((HttpParams)localObject2).setParameter("http.useragent", AppBuild.getUserAgent(c));
    localObject2 = new DefaultHttpClient((HttpParams)localObject2);
    httpcall = new HttpPost(url);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new BasicNameValuePair("user[login]", email));
    localArrayList.add(new BasicNameValuePair("api_key", "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249"));
    RequestFactory.addDeviceNameValues(c, localArrayList);
    try
    {
      httpcall.setEntity(new UrlEncodedFormEntity(localArrayList));
      RequestFactory.setStandardHeadersOnPost(httpcall, c);
      localObject1 = ((HttpClient)localObject2).execute(httpcall, (HttpContext)localObject1);
      localObject2 = ((HttpResponse)localObject1).getEntity();
      if ((localObject2 != null) && (!isAborted) && (ResponseHelper.wasSuccessful((HttpResponse)localObject1)))
      {
        localObject1 = EntityUtils.toString((HttpEntity)localObject2);
        return (String)localObject1;
      }
    }
    catch (IOException localIOException)
    {
      return c.getResources().getString(2131492972);
    }
    catch (ClientProtocolException localClientProtocolException) {}
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.ForgotPasswordRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */