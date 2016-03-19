package com.squareup.okhttp;

import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.InternalCache;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.Transport;
import java.io.IOException;

final class OkHttpClient$1
  extends Internal
{
  public void addLine(Headers.Builder paramBuilder, String paramString)
  {
    paramBuilder.addLine(paramString);
  }
  
  public boolean clearOwner(Connection paramConnection)
  {
    return paramConnection.clearOwner();
  }
  
  public void closeIfOwnedBy(Connection paramConnection, Object paramObject)
    throws IOException
  {
    paramConnection.closeIfOwnedBy(paramObject);
  }
  
  public void connect(Connection paramConnection, int paramInt1, int paramInt2, int paramInt3, Request paramRequest)
    throws IOException
  {
    paramConnection.connect(paramInt1, paramInt2, paramInt3, paramRequest);
  }
  
  public Object getOwner(Connection paramConnection)
  {
    return paramConnection.getOwner();
  }
  
  public InternalCache internalCache(OkHttpClient paramOkHttpClient)
  {
    return paramOkHttpClient.internalCache();
  }
  
  public boolean isConnected(Connection paramConnection)
  {
    return paramConnection.isConnected();
  }
  
  public boolean isReadable(Connection paramConnection)
  {
    return paramConnection.isReadable();
  }
  
  public boolean isSpdy(Connection paramConnection)
  {
    return paramConnection.isSpdy();
  }
  
  public Transport newTransport(Connection paramConnection, HttpEngine paramHttpEngine)
    throws IOException
  {
    return paramConnection.newTransport(paramHttpEngine);
  }
  
  public void recycle(ConnectionPool paramConnectionPool, Connection paramConnection)
  {
    paramConnectionPool.recycle(paramConnection);
  }
  
  public int recycleCount(Connection paramConnection)
  {
    return paramConnection.recycleCount();
  }
  
  public RouteDatabase routeDatabase(OkHttpClient paramOkHttpClient)
  {
    return OkHttpClient.access$000(paramOkHttpClient);
  }
  
  public void setCache(OkHttpClient paramOkHttpClient, InternalCache paramInternalCache)
  {
    paramOkHttpClient.setInternalCache(paramInternalCache);
  }
  
  public void setOwner(Connection paramConnection, HttpEngine paramHttpEngine)
  {
    paramConnection.setOwner(paramHttpEngine);
  }
  
  public void setProtocol(Connection paramConnection, Protocol paramProtocol)
  {
    paramConnection.setProtocol(paramProtocol);
  }
  
  public void setTimeouts(Connection paramConnection, int paramInt1, int paramInt2)
    throws IOException
  {
    paramConnection.setTimeouts(paramInt1, paramInt2);
  }
  
  public void share(ConnectionPool paramConnectionPool, Connection paramConnection)
  {
    paramConnectionPool.share(paramConnection);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.OkHttpClient.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */