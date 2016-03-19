package com.squareup.okhttp.internal;

import com.squareup.okhttp.Protocol;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketException;
import java.util.List;
import javax.net.ssl.SSLSocket;

class Platform$Android
  extends Platform
{
  private final Method getNpnSelectedProtocol;
  protected final Class<?> openSslSocketClass;
  private final Method setHostname;
  private final Method setNpnProtocols;
  private final Method setUseSessionTickets;
  private final Method trafficStatsTagSocket;
  private final Method trafficStatsUntagSocket;
  
  private Platform$Android(Class<?> paramClass, Method paramMethod1, Method paramMethod2, Method paramMethod3, Method paramMethod4, Method paramMethod5, Method paramMethod6)
  {
    openSslSocketClass = paramClass;
    setUseSessionTickets = paramMethod1;
    setHostname = paramMethod2;
    trafficStatsTagSocket = paramMethod3;
    trafficStatsUntagSocket = paramMethod4;
    setNpnProtocols = paramMethod5;
    getNpnSelectedProtocol = paramMethod6;
  }
  
  public void configureTls(SSLSocket paramSSLSocket, String paramString1, String paramString2)
  {
    super.configureTls(paramSSLSocket, paramString1, paramString2);
    if ((paramString2.equals("TLSv1")) && (openSslSocketClass.isInstance(paramSSLSocket))) {}
    try
    {
      setUseSessionTickets.invoke(paramSSLSocket, new Object[] { Boolean.valueOf(true) });
      setHostname.invoke(paramSSLSocket, new Object[] { paramString1 });
      return;
    }
    catch (InvocationTargetException paramSSLSocket)
    {
      throw new RuntimeException(paramSSLSocket);
    }
    catch (IllegalAccessException paramSSLSocket)
    {
      throw new AssertionError(paramSSLSocket);
    }
  }
  
  public void connectSocket(Socket paramSocket, InetSocketAddress paramInetSocketAddress, int paramInt)
    throws IOException
  {
    try
    {
      paramSocket.connect(paramInetSocketAddress, paramInt);
      return;
    }
    catch (SecurityException paramSocket)
    {
      paramInetSocketAddress = new IOException("Exception in connect");
      paramInetSocketAddress.initCause(paramSocket);
      throw paramInetSocketAddress;
    }
  }
  
  public String getSelectedProtocol(SSLSocket paramSSLSocket)
  {
    if (getNpnSelectedProtocol == null) {
      return null;
    }
    if (!openSslSocketClass.isInstance(paramSSLSocket)) {
      return null;
    }
    try
    {
      paramSSLSocket = (byte[])getNpnSelectedProtocol.invoke(paramSSLSocket, new Object[0]);
      if (paramSSLSocket == null) {
        return null;
      }
      paramSSLSocket = new String(paramSSLSocket, Util.UTF_8);
      return paramSSLSocket;
    }
    catch (InvocationTargetException paramSSLSocket)
    {
      throw new RuntimeException(paramSSLSocket);
    }
    catch (IllegalAccessException paramSSLSocket)
    {
      throw new AssertionError(paramSSLSocket);
    }
  }
  
  public void setProtocols(SSLSocket paramSSLSocket, List<Protocol> paramList)
  {
    if (setNpnProtocols == null) {}
    while (!openSslSocketClass.isInstance(paramSSLSocket)) {
      return;
    }
    try
    {
      paramList = concatLengthPrefixed(paramList);
      setNpnProtocols.invoke(paramSSLSocket, new Object[] { paramList });
      return;
    }
    catch (IllegalAccessException paramSSLSocket)
    {
      throw new AssertionError(paramSSLSocket);
    }
    catch (InvocationTargetException paramSSLSocket)
    {
      throw new RuntimeException(paramSSLSocket);
    }
  }
  
  public void tagSocket(Socket paramSocket)
    throws SocketException
  {
    if (trafficStatsTagSocket == null) {
      return;
    }
    try
    {
      trafficStatsTagSocket.invoke(null, new Object[] { paramSocket });
      return;
    }
    catch (IllegalAccessException paramSocket)
    {
      throw new RuntimeException(paramSocket);
    }
    catch (InvocationTargetException paramSocket)
    {
      throw new RuntimeException(paramSocket);
    }
  }
  
  public void untagSocket(Socket paramSocket)
    throws SocketException
  {
    if (trafficStatsUntagSocket == null) {
      return;
    }
    try
    {
      trafficStatsUntagSocket.invoke(null, new Object[] { paramSocket });
      return;
    }
    catch (IllegalAccessException paramSocket)
    {
      throw new RuntimeException(paramSocket);
    }
    catch (InvocationTargetException paramSocket)
    {
      throw new RuntimeException(paramSocket);
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.Platform.Android
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */