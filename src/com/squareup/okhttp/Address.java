package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.net.Proxy;
import java.net.UnknownHostException;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

public final class Address
{
  final Authenticator authenticator;
  final HostnameVerifier hostnameVerifier;
  final List<Protocol> protocols;
  final Proxy proxy;
  final SocketFactory socketFactory;
  final SSLSocketFactory sslSocketFactory;
  final String uriHost;
  final int uriPort;
  
  public Address(String paramString, int paramInt, SocketFactory paramSocketFactory, SSLSocketFactory paramSSLSocketFactory, HostnameVerifier paramHostnameVerifier, Authenticator paramAuthenticator, Proxy paramProxy, List<Protocol> paramList)
    throws UnknownHostException
  {
    if (paramString == null) {
      throw new NullPointerException("uriHost == null");
    }
    if (paramInt <= 0) {
      throw new IllegalArgumentException("uriPort <= 0: " + paramInt);
    }
    if (paramAuthenticator == null) {
      throw new IllegalArgumentException("authenticator == null");
    }
    if (paramList == null) {
      throw new IllegalArgumentException("protocols == null");
    }
    proxy = paramProxy;
    uriHost = paramString;
    uriPort = paramInt;
    socketFactory = paramSocketFactory;
    sslSocketFactory = paramSSLSocketFactory;
    hostnameVerifier = paramHostnameVerifier;
    authenticator = paramAuthenticator;
    protocols = Util.immutableList(paramList);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Address))
    {
      paramObject = (Address)paramObject;
      bool1 = bool2;
      if (Util.equal(proxy, proxy))
      {
        bool1 = bool2;
        if (uriHost.equals(uriHost))
        {
          bool1 = bool2;
          if (uriPort == uriPort)
          {
            bool1 = bool2;
            if (Util.equal(sslSocketFactory, sslSocketFactory))
            {
              bool1 = bool2;
              if (Util.equal(hostnameVerifier, hostnameVerifier))
              {
                bool1 = bool2;
                if (Util.equal(authenticator, authenticator))
                {
                  bool1 = bool2;
                  if (Util.equal(protocols, protocols)) {
                    bool1 = true;
                  }
                }
              }
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public Authenticator getAuthenticator()
  {
    return authenticator;
  }
  
  public HostnameVerifier getHostnameVerifier()
  {
    return hostnameVerifier;
  }
  
  public List<Protocol> getProtocols()
  {
    return protocols;
  }
  
  public Proxy getProxy()
  {
    return proxy;
  }
  
  public SocketFactory getSocketFactory()
  {
    return socketFactory;
  }
  
  public SSLSocketFactory getSslSocketFactory()
  {
    return sslSocketFactory;
  }
  
  public String getUriHost()
  {
    return uriHost;
  }
  
  public int getUriPort()
  {
    return uriPort;
  }
  
  public int hashCode()
  {
    int k = 0;
    int m = uriHost.hashCode();
    int n = uriPort;
    int i;
    if (sslSocketFactory != null)
    {
      i = sslSocketFactory.hashCode();
      if (hostnameVerifier == null) {
        break label123;
      }
    }
    label123:
    for (int j = hostnameVerifier.hashCode();; j = 0)
    {
      int i1 = authenticator.hashCode();
      if (proxy != null) {
        k = proxy.hashCode();
      }
      return ((((((m + 527) * 31 + n) * 31 + i) * 31 + j) * 31 + i1) * 31 + k) * 31 + protocols.hashCode();
      i = 0;
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Address
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */