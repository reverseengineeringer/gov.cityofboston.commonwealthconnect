package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.StatusLine;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.util.List;
import java.util.Map;

final class JavaApiConverter$CacheHttpURLConnection
  extends HttpURLConnection
{
  private final Request request;
  private final Response response;
  
  public JavaApiConverter$CacheHttpURLConnection(Response paramResponse)
  {
    super(paramResponse.request().url());
    request = paramResponse.request();
    response = paramResponse;
    connected = true;
    if (paramResponse.body() == null) {}
    for (;;)
    {
      doOutput = bool;
      method = request.method();
      return;
      bool = false;
    }
  }
  
  public void addRequestProperty(String paramString1, String paramString2)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void connect()
    throws IOException
  {
    throw JavaApiConverter.access$000();
  }
  
  public void disconnect()
  {
    throw JavaApiConverter.access$000();
  }
  
  public boolean getAllowUserInteraction()
  {
    return false;
  }
  
  public int getConnectTimeout()
  {
    return 0;
  }
  
  public Object getContent()
    throws IOException
  {
    throw JavaApiConverter.access$200();
  }
  
  public Object getContent(Class[] paramArrayOfClass)
    throws IOException
  {
    throw JavaApiConverter.access$200();
  }
  
  public boolean getDefaultUseCaches()
  {
    return super.getDefaultUseCaches();
  }
  
  public boolean getDoInput()
  {
    return true;
  }
  
  public boolean getDoOutput()
  {
    return request.body() != null;
  }
  
  public InputStream getErrorStream()
  {
    return null;
  }
  
  public String getHeaderField(int paramInt)
  {
    if (paramInt < 0) {
      throw new IllegalArgumentException("Invalid header index: " + paramInt);
    }
    if (paramInt == 0) {
      return StatusLine.get(response).toString();
    }
    return response.headers().value(paramInt - 1);
  }
  
  public String getHeaderField(String paramString)
  {
    if (paramString == null) {
      return StatusLine.get(response).toString();
    }
    return response.headers().get(paramString);
  }
  
  public String getHeaderFieldKey(int paramInt)
  {
    if (paramInt < 0) {
      throw new IllegalArgumentException("Invalid header index: " + paramInt);
    }
    if (paramInt == 0) {
      return null;
    }
    return response.headers().name(paramInt - 1);
  }
  
  public Map<String, List<String>> getHeaderFields()
  {
    return OkHeaders.toMultimap(response.headers(), StatusLine.get(response).toString());
  }
  
  public long getIfModifiedSince()
  {
    return 0L;
  }
  
  public InputStream getInputStream()
    throws IOException
  {
    throw JavaApiConverter.access$200();
  }
  
  public boolean getInstanceFollowRedirects()
  {
    return super.getInstanceFollowRedirects();
  }
  
  public OutputStream getOutputStream()
    throws IOException
  {
    throw JavaApiConverter.access$000();
  }
  
  public int getReadTimeout()
  {
    return 0;
  }
  
  public String getRequestMethod()
  {
    return request.method();
  }
  
  public Map<String, List<String>> getRequestProperties()
  {
    throw JavaApiConverter.access$100();
  }
  
  public String getRequestProperty(String paramString)
  {
    return request.header(paramString);
  }
  
  public int getResponseCode()
    throws IOException
  {
    return response.code();
  }
  
  public String getResponseMessage()
    throws IOException
  {
    return response.message();
  }
  
  public boolean getUseCaches()
  {
    return super.getUseCaches();
  }
  
  public void setAllowUserInteraction(boolean paramBoolean)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setChunkedStreamingMode(int paramInt)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setConnectTimeout(int paramInt)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setDefaultUseCaches(boolean paramBoolean)
  {
    super.setDefaultUseCaches(paramBoolean);
  }
  
  public void setDoInput(boolean paramBoolean)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setDoOutput(boolean paramBoolean)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setFixedLengthStreamingMode(int paramInt)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setFixedLengthStreamingMode(long paramLong)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setIfModifiedSince(long paramLong)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setInstanceFollowRedirects(boolean paramBoolean)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setReadTimeout(int paramInt)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setRequestMethod(String paramString)
    throws ProtocolException
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setRequestProperty(String paramString1, String paramString2)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setUseCaches(boolean paramBoolean)
  {
    throw JavaApiConverter.access$000();
  }
  
  public boolean usingProxy()
  {
    return false;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.huc.JavaApiConverter.CacheHttpURLConnection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */