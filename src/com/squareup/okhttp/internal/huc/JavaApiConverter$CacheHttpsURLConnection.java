package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Handshake;
import com.squareup.okhttp.Response;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

final class JavaApiConverter$CacheHttpsURLConnection
  extends DelegatingHttpsURLConnection
{
  private final JavaApiConverter.CacheHttpURLConnection delegate;
  
  public JavaApiConverter$CacheHttpsURLConnection(JavaApiConverter.CacheHttpURLConnection paramCacheHttpURLConnection)
  {
    super(paramCacheHttpURLConnection);
    delegate = paramCacheHttpURLConnection;
  }
  
  public long getContentLengthLong()
  {
    return delegate.getContentLengthLong();
  }
  
  public long getHeaderFieldLong(String paramString, long paramLong)
  {
    return delegate.getHeaderFieldLong(paramString, paramLong);
  }
  
  public HostnameVerifier getHostnameVerifier()
  {
    throw JavaApiConverter.access$400();
  }
  
  public SSLSocketFactory getSSLSocketFactory()
  {
    throw JavaApiConverter.access$400();
  }
  
  protected Handshake handshake()
  {
    return JavaApiConverter.CacheHttpURLConnection.access$300(delegate).handshake();
  }
  
  public void setFixedLengthStreamingMode(long paramLong)
  {
    delegate.setFixedLengthStreamingMode(paramLong);
  }
  
  public void setHostnameVerifier(HostnameVerifier paramHostnameVerifier)
  {
    throw JavaApiConverter.access$000();
  }
  
  public void setSSLSocketFactory(SSLSocketFactory paramSSLSocketFactory)
  {
    throw JavaApiConverter.access$000();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.huc.JavaApiConverter.CacheHttpsURLConnection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */