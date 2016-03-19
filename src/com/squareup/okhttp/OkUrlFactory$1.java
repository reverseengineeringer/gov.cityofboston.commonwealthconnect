package com.squareup.okhttp;

import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;

class OkUrlFactory$1
  extends URLStreamHandler
{
  OkUrlFactory$1(OkUrlFactory paramOkUrlFactory, String paramString) {}
  
  protected int getDefaultPort()
  {
    if (val$protocol.equals("http")) {
      return 80;
    }
    if (val$protocol.equals("https")) {
      return 443;
    }
    throw new AssertionError();
  }
  
  protected URLConnection openConnection(URL paramURL)
  {
    return this$0.open(paramURL);
  }
  
  protected URLConnection openConnection(URL paramURL, Proxy paramProxy)
  {
    return this$0.open(paramURL, paramProxy);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.OkUrlFactory.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */