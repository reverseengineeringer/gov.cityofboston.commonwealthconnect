package com.seeclickfix.ma.android.events;

import com.google.android.gms.common.ConnectionResult;

public class GooglePlayErrorEvent
  implements Event
{
  private ConnectionResult connectionResult;
  
  public GooglePlayErrorEvent(ConnectionResult paramConnectionResult)
  {
    connectionResult = paramConnectionResult;
  }
  
  public ConnectionResult getConnectionResult()
  {
    return connectionResult;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.GooglePlayErrorEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */