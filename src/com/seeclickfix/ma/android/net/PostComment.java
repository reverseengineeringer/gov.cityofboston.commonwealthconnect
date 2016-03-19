package com.seeclickfix.ma.android.net;

import android.annotation.SuppressLint;
import android.content.Context;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.interfaces.OnCommentResultListener;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.objects.issue.Comment;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

public final class PostComment
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  public static final String POST = "POST";
  private static final String TAG = "PostComment";
  private Context c;
  private Comment data;
  private HttpPost httpcall;
  private volatile boolean isAborted = false;
  private OnCommentResultListener listener;
  private final String url;
  
  public PostComment(Comment paramComment, Context paramContext)
  {
    data = paramComment;
    c = paramContext;
    url = UrlConfig.getCommentsUrl(paramContext);
  }
  
  private void addPostVarsToEntity(MultipartEntity paramMultipartEntity, Comment paramComment)
  {
    HashMap localHashMap = new HashMap();
    RequestFactory.addStaticParamsToMap(localHashMap, c);
    localHashMap.put("api_key", "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    localHashMap.put("comment[comment]", paramComment.getComment());
    localHashMap.put("comment[comment_type]", paramComment.getCommentType());
    localHashMap.put("comment[email]", paramComment.getEmail());
    localHashMap.put("comment[name]", paramComment.getName());
    localHashMap.put("comment[send_email]", "" + paramComment.isSubscribeEmailNotification());
    localHashMap.put("issue_id", "" + paramComment.getIssueId());
    paramComment = localHashMap.keySet().iterator();
    while (paramComment.hasNext())
    {
      String str1 = (String)paramComment.next();
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
  
  private void fail()
  {
    if (listener != null) {
      listener.onCommentResult(false, data);
    }
  }
  
  private void succeed(Comment paramComment)
  {
    if (listener != null) {
      listener.onCommentResult(true, paramComment);
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
  
  @SuppressLint({"DefaultLocale"})
  public Comment connect()
  {
    Object localObject1 = new BasicHttpContext();
    Object localObject2 = null;
    Object localObject4 = new BasicHttpParams();
    ((HttpParams)localObject4).setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
    ((HttpParams)localObject4).setParameter("http.useragent", AppBuild.getUserAgent(c));
    ((HttpParams)localObject4).setParameter("http.protocol.cookie-policy", "compatibility");
    Object localObject3 = new BasicCookieStore();
    Object localObject5 = new BasicClientCookie(AppBuild.getCookieName(c), PrefsUtil.getString("Pref:COOKIE", "Error No Cookie", c));
    ((BasicClientCookie)localObject5).setDomain(".seeclickfix.com");
    ((BasicClientCookie)localObject5).setPath("/");
    ((CookieStore)localObject3).addCookie((Cookie)localObject5);
    localObject4 = new DefaultHttpClient((HttpParams)localObject4);
    ((DefaultHttpClient)localObject4).setCookieStore((CookieStore)localObject3);
    httpcall = new HttpPost(String.format(Locale.US, url, new Object[] { Integer.valueOf(data.getIssueId()) }));
    RequestFactory.setStandardHeadersOnPost(httpcall, c);
    localObject3 = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE);
    addPostVarsToEntity((MultipartEntity)localObject3, data);
    localObject5 = data.getCommentImagePath();
    if (localObject5 != null) {
      ((MultipartEntity)localObject3).addPart("comment[comment_image_attributes][uploaded_data]", new FileBody(new File((String)localObject5)));
    }
    try
    {
      httpcall.setEntity((HttpEntity)localObject3);
      localObject3 = ((DefaultHttpClient)localObject4).execute(httpcall, (HttpContext)localObject1).getEntity();
      localObject1 = localObject2;
      if (localObject3 != null)
      {
        localObject1 = localObject2;
        if (!isAborted) {
          localObject1 = EntityUtils.toString((HttpEntity)localObject3);
        }
      }
      if (((String)localObject1).equalsIgnoreCase("{\"base\":[\"Comments are closed for the archived issue\"]}"))
      {
        fail();
        return null;
      }
      localObject1 = (Comment)new DeserializeResponse().getJavaObject((String)localObject1, Comment.class).get(0);
      succeed((Comment)localObject1);
      return (Comment)localObject1;
    }
    catch (ClientProtocolException localClientProtocolException)
    {
      fail();
      return null;
    }
    catch (IOException localIOException)
    {
      fail();
      return null;
    }
    catch (Exception localException)
    {
      fail();
    }
    return null;
  }
  
  public void setOnResultListener(OnCommentResultListener paramOnCommentResultListener)
  {
    listener = paramOnCommentResultListener;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.PostComment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */