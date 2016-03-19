package com.seeclickfix.ma.android.events;

import android.location.Location;

public class LocationTimeoutEvent
{
  private Location location;
  
  public LocationTimeoutEvent(Location paramLocation)
  {
    location = paramLocation;
  }
  
  public Location getLocation()
  {
    return location;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.LocationTimeoutEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */