package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Address;
import com.squareup.okhttp.Connection;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.Route;
import com.squareup.okhttp.internal.Dns;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.ProxySelector;
import java.net.Socket;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.NoSuchElementException;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLProtocolException;

public final class RouteSelector
{
  public static final String SSL_V3 = "SSLv3";
  public static final String TLS_V1 = "TLSv1";
  private final Address address;
  private final Dns dns;
  private boolean hasNextProxy;
  private InetSocketAddress lastInetSocketAddress;
  private Proxy lastProxy;
  private int nextSocketAddressIndex;
  private String nextTlsVersion;
  private final ConnectionPool pool;
  private final List<Route> postponedRoutes;
  private final ProxySelector proxySelector;
  private Iterator<Proxy> proxySelectorProxies;
  private final RouteDatabase routeDatabase;
  private InetAddress[] socketAddresses;
  private int socketPort;
  private final URI uri;
  private Proxy userSpecifiedProxy;
  
  public RouteSelector(Address paramAddress, URI paramURI, ProxySelector paramProxySelector, ConnectionPool paramConnectionPool, Dns paramDns, RouteDatabase paramRouteDatabase)
  {
    address = paramAddress;
    uri = paramURI;
    proxySelector = paramProxySelector;
    pool = paramConnectionPool;
    dns = paramDns;
    routeDatabase = paramRouteDatabase;
    postponedRoutes = new LinkedList();
    resetNextProxy(paramURI, paramAddress.getProxy());
  }
  
  private boolean hasNextInetSocketAddress()
  {
    return socketAddresses != null;
  }
  
  private boolean hasNextPostponed()
  {
    return !postponedRoutes.isEmpty();
  }
  
  private boolean hasNextProxy()
  {
    return hasNextProxy;
  }
  
  private boolean hasNextTlsVersion()
  {
    return nextTlsVersion != null;
  }
  
  private InetSocketAddress nextInetSocketAddress()
    throws UnknownHostException
  {
    Object localObject = socketAddresses;
    int i = nextSocketAddressIndex;
    nextSocketAddressIndex = (i + 1);
    localObject = new InetSocketAddress(localObject[i], socketPort);
    if (nextSocketAddressIndex == socketAddresses.length)
    {
      socketAddresses = null;
      nextSocketAddressIndex = 0;
    }
    return (InetSocketAddress)localObject;
  }
  
  private Route nextPostponed()
  {
    return (Route)postponedRoutes.remove(0);
  }
  
  private Proxy nextProxy()
  {
    if (userSpecifiedProxy != null)
    {
      hasNextProxy = false;
      return userSpecifiedProxy;
    }
    if (proxySelectorProxies != null) {
      while (proxySelectorProxies.hasNext())
      {
        Proxy localProxy = (Proxy)proxySelectorProxies.next();
        if (localProxy.type() != Proxy.Type.DIRECT) {
          return localProxy;
        }
      }
    }
    hasNextProxy = false;
    return Proxy.NO_PROXY;
  }
  
  private String nextTlsVersion()
  {
    if (nextTlsVersion == null) {
      throw new IllegalStateException("No next TLS version");
    }
    if (nextTlsVersion.equals("TLSv1"))
    {
      nextTlsVersion = "SSLv3";
      return "TLSv1";
    }
    if (nextTlsVersion.equals("SSLv3"))
    {
      nextTlsVersion = null;
      return "SSLv3";
    }
    throw new AssertionError();
  }
  
  private void resetNextInetSocketAddress(Proxy paramProxy)
    throws UnknownHostException
  {
    socketAddresses = null;
    if (paramProxy.type() == Proxy.Type.DIRECT) {
      paramProxy = uri.getHost();
    }
    InetSocketAddress localInetSocketAddress;
    for (socketPort = Util.getEffectivePort(uri);; socketPort = localInetSocketAddress.getPort())
    {
      socketAddresses = dns.getAllByName(paramProxy);
      nextSocketAddressIndex = 0;
      return;
      paramProxy = paramProxy.address();
      if (!(paramProxy instanceof InetSocketAddress)) {
        throw new IllegalArgumentException("Proxy.address() is not an InetSocketAddress: " + paramProxy.getClass());
      }
      localInetSocketAddress = (InetSocketAddress)paramProxy;
      paramProxy = localInetSocketAddress.getHostName();
    }
  }
  
  private void resetNextProxy(URI paramURI, Proxy paramProxy)
  {
    hasNextProxy = true;
    if (paramProxy != null) {
      userSpecifiedProxy = paramProxy;
    }
    do
    {
      return;
      paramURI = proxySelector.select(paramURI);
    } while (paramURI == null);
    proxySelectorProxies = paramURI.iterator();
  }
  
  private void resetNextTlsVersion()
  {
    if (address.getSslSocketFactory() != null) {}
    for (String str = "TLSv1";; str = "SSLv3")
    {
      nextTlsVersion = str;
      return;
    }
  }
  
  public void connectFailed(Connection paramConnection, IOException paramIOException)
  {
    if (Internal.instance.recycleCount(paramConnection) > 0) {}
    for (;;)
    {
      return;
      paramConnection = paramConnection.getRoute();
      if ((paramConnection.getProxy().type() != Proxy.Type.DIRECT) && (proxySelector != null)) {
        proxySelector.connectFailed(uri, paramConnection.getProxy().address(), paramIOException);
      }
      routeDatabase.failed(paramConnection);
      if ((!(paramIOException instanceof SSLHandshakeException)) && (!(paramIOException instanceof SSLProtocolException))) {
        while (hasNextTlsVersion())
        {
          paramConnection = new Route(address, lastProxy, lastInetSocketAddress, nextTlsVersion());
          routeDatabase.failed(paramConnection);
        }
      }
    }
  }
  
  public boolean hasNext()
  {
    return (hasNextTlsVersion()) || (hasNextInetSocketAddress()) || (hasNextProxy()) || (hasNextPostponed());
  }
  
  public Connection next(String paramString)
    throws IOException
  {
    for (;;)
    {
      localObject = pool.get(address);
      if (localObject == null) {
        break;
      }
      if ((paramString.equals("GET")) || (Internal.instance.isReadable((Connection)localObject))) {
        return (Connection)localObject;
      }
      ((Connection)localObject).getSocket().close();
    }
    if (!hasNextTlsVersion())
    {
      if (!hasNextInetSocketAddress())
      {
        if (!hasNextProxy())
        {
          if (!hasNextPostponed()) {
            throw new NoSuchElementException();
          }
          return new Connection(pool, nextPostponed());
        }
        lastProxy = nextProxy();
        resetNextInetSocketAddress(lastProxy);
      }
      lastInetSocketAddress = nextInetSocketAddress();
      resetNextTlsVersion();
    }
    Object localObject = nextTlsVersion();
    localObject = new Route(address, lastProxy, lastInetSocketAddress, (String)localObject);
    if (routeDatabase.shouldPostpone((Route)localObject))
    {
      postponedRoutes.add(localObject);
      return next(paramString);
    }
    return new Connection(pool, (Route)localObject);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.RouteSelector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */