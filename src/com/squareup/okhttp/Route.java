package com.squareup.okhttp;

import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;

public final class Route
{
  final Address address;
  final InetSocketAddress inetSocketAddress;
  final Proxy proxy;
  final String tlsVersion;
  
  public Route(Address paramAddress, Proxy paramProxy, InetSocketAddress paramInetSocketAddress, String paramString)
  {
    if (paramAddress == null) {
      throw new NullPointerException("address == null");
    }
    if (paramProxy == null) {
      throw new NullPointerException("proxy == null");
    }
    if (paramInetSocketAddress == null) {
      throw new NullPointerException("inetSocketAddress == null");
    }
    if (paramString == null) {
      throw new NullPointerException("tlsVersion == null");
    }
    address = paramAddress;
    proxy = paramProxy;
    inetSocketAddress = paramInetSocketAddress;
    tlsVersion = paramString;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Route))
    {
      paramObject = (Route)paramObject;
      bool1 = bool2;
      if (address.equals(address))
      {
        bool1 = bool2;
        if (proxy.equals(proxy))
        {
          bool1 = bool2;
          if (inetSocketAddress.equals(inetSocketAddress))
          {
            bool1 = bool2;
            if (tlsVersion.equals(tlsVersion)) {
              bool1 = true;
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public Address getAddress()
  {
    return address;
  }
  
  public Proxy getProxy()
  {
    return proxy;
  }
  
  public InetSocketAddress getSocketAddress()
  {
    return inetSocketAddress;
  }
  
  public String getTlsVersion()
  {
    return tlsVersion;
  }
  
  public int hashCode()
  {
    return (((address.hashCode() + 527) * 31 + proxy.hashCode()) * 31 + inetSocketAddress.hashCode()) * 31 + tlsVersion.hashCode();
  }
  
  public boolean requiresTunnel()
  {
    return (address.sslSocketFactory != null) && (proxy.type() == Proxy.Type.HTTP);
  }
  
  boolean supportsNpn()
  {
    return !tlsVersion.equals("SSLv3");
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Route
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */