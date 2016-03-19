package com.seeclickfix.ma.android.events;

import android.location.Location;

public class LocationUpdateEvent
{
  private Location location;
  
  public LocationUpdateEvent(Location paramLocation)
  {
    location = paramLocation;
  }
  
  public Location getLocation()
  {
    return location;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.LocationUpdateEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */