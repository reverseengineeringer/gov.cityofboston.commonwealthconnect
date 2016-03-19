package com.seeclickfix.ma.android.events;

import android.location.Location;

public class LocationProcessedEvent
{
  private Location location;
  
  public LocationProcessedEvent(Location paramLocation)
  {
    location = paramLocation;
  }
  
  public Location getLocation()
  {
    return location;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.events.LocationProcessedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */