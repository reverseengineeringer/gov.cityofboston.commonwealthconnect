package com.google.common.net;

import com.google.common.annotations.Beta;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.net.Inet4Address;
import javax.annotation.Nullable;

@Beta
public final class InetAddresses$TeredoInfo
{
  private final Inet4Address client;
  private final int flags;
  private final int port;
  private final Inet4Address server;
  
  public InetAddresses$TeredoInfo(@Nullable Inet4Address paramInet4Address1, @Nullable Inet4Address paramInet4Address2, int paramInt1, int paramInt2)
  {
    if ((paramInt1 >= 0) && (paramInt1 <= 65535))
    {
      bool = true;
      Preconditions.checkArgument(bool, "port '%s' is out of range (0 <= port <= 0xffff)", new Object[] { Integer.valueOf(paramInt1) });
      if ((paramInt2 < 0) || (paramInt2 > 65535)) {
        break label115;
      }
    }
    label115:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "flags '%s' is out of range (0 <= flags <= 0xffff)", new Object[] { Integer.valueOf(paramInt2) });
      server = ((Inet4Address)Objects.firstNonNull(paramInet4Address1, InetAddresses.access$000()));
      client = ((Inet4Address)Objects.firstNonNull(paramInet4Address2, InetAddresses.access$000()));
      port = paramInt1;
      flags = paramInt2;
      return;
      bool = false;
      break;
    }
  }
  
  public Inet4Address getClient()
  {
    return client;
  }
  
  public int getFlags()
  {
    return flags;
  }
  
  public int getPort()
  {
    return port;
  }
  
  public Inet4Address getServer()
  {
    return server;
  }
}

/* Location:
 * Qualified Name:     com.google.common.net.InetAddresses.TeredoInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */