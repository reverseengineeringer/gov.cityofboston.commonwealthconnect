package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.Protocol;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;

public class SpdyConnection$Builder
{
  private boolean client;
  private IncomingStreamHandler handler = IncomingStreamHandler.REFUSE_INCOMING_STREAMS;
  private String hostName;
  private Protocol protocol = Protocol.SPDY_3;
  private PushObserver pushObserver = PushObserver.CANCEL;
  private Socket socket;
  
  public SpdyConnection$Builder(String paramString, boolean paramBoolean, Socket paramSocket)
    throws IOException
  {
    hostName = paramString;
    client = paramBoolean;
    socket = paramSocket;
  }
  
  public SpdyConnection$Builder(boolean paramBoolean, Socket paramSocket)
    throws IOException
  {
    this(((InetSocketAddress)paramSocket.getRemoteSocketAddress()).getHostName(), paramBoolean, paramSocket);
  }
  
  public SpdyConnection build()
    throws IOException
  {
    return new SpdyConnection(this, null);
  }
  
  public Builder handler(IncomingStreamHandler paramIncomingStreamHandler)
  {
    handler = paramIncomingStreamHandler;
    return this;
  }
  
  public Builder protocol(Protocol paramProtocol)
  {
    protocol = paramProtocol;
    return this;
  }
  
  public Builder pushObserver(PushObserver paramPushObserver)
  {
    pushObserver = paramPushObserver;
    return this;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */