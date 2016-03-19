package com.squareup.okhttp.internal;

import com.squareup.okhttp.Protocol;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLSocket;

class Platform$JdkWithJettyBootPlatform
  extends Platform
{
  private final Class<?> clientProviderClass;
  private final Method getMethod;
  private final Method putMethod;
  private final Class<?> serverProviderClass;
  
  public Platform$JdkWithJettyBootPlatform(Method paramMethod1, Method paramMethod2, Class<?> paramClass1, Class<?> paramClass2)
  {
    putMethod = paramMethod1;
    getMethod = paramMethod2;
    clientProviderClass = paramClass1;
    serverProviderClass = paramClass2;
  }
  
  public String getSelectedProtocol(SSLSocket paramSSLSocket)
  {
    try
    {
      paramSSLSocket = (Platform.JettyNegoProvider)Proxy.getInvocationHandler(getMethod.invoke(null, new Object[] { paramSSLSocket }));
      if ((!Platform.JettyNegoProvider.access$100(paramSSLSocket)) && (Platform.JettyNegoProvider.access$200(paramSSLSocket) == null))
      {
        Logger.getLogger("com.squareup.okhttp.OkHttpClient").log(Level.INFO, "NPN/ALPN callback dropped: SPDY and HTTP/2 are disabled. Is npn-boot or alpn-boot on the boot class path?");
        return null;
      }
      if (!Platform.JettyNegoProvider.access$100(paramSSLSocket))
      {
        paramSSLSocket = Platform.JettyNegoProvider.access$200(paramSSLSocket);
        return paramSSLSocket;
      }
    }
    catch (InvocationTargetException paramSSLSocket)
    {
      throw new AssertionError();
    }
    catch (IllegalAccessException paramSSLSocket)
    {
      throw new AssertionError();
    }
    return null;
  }
  
  public void setProtocols(SSLSocket paramSSLSocket, List<Protocol> paramList)
  {
    for (;;)
    {
      int i;
      try
      {
        localObject1 = new ArrayList(paramList.size());
        i = 0;
        int j = paramList.size();
        if (i < j)
        {
          localObject2 = (Protocol)paramList.get(i);
          if (localObject2 == Protocol.HTTP_1_0) {
            break label162;
          }
          ((List)localObject1).add(((Protocol)localObject2).toString());
        }
      }
      catch (InvocationTargetException paramSSLSocket)
      {
        throw new AssertionError(paramSSLSocket);
        paramList = Platform.class.getClassLoader();
        Object localObject2 = clientProviderClass;
        Class localClass = serverProviderClass;
        Object localObject1 = new Platform.JettyNegoProvider((List)localObject1);
        paramList = Proxy.newProxyInstance(paramList, new Class[] { localObject2, localClass }, (InvocationHandler)localObject1);
        putMethod.invoke(null, new Object[] { paramSSLSocket, paramList });
        return;
      }
      catch (IllegalAccessException paramSSLSocket)
      {
        throw new AssertionError(paramSSLSocket);
      }
      label162:
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.Platform.JdkWithJettyBootPlatform
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */