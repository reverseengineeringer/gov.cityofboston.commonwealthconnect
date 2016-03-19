package com.seeclickfix.ma.android.events;

import android.location.Location;

public class LocationConnectedEvent
{
  private Location lastKnownLocation;
  
  public LocationConnectedEvent(Location paramLocation)
  {
    lastKnownLocation = paramLocation;
  }
  
  public Location getLastKnownLocation()
  {
    return lastKnownLocation;
  }
  
  public String toString()
  {
    return "LocationConnectedEvent [lastKnownLocation=" + lastKnownLocation + "]";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.LocationConnectedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */