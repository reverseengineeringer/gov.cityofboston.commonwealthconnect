package com.seeclickfix.ma.android.location;

import android.location.Location;

public enum LocationValidator$Stratigies$CompareStrategyEnum
{
  CLOSER_MORE_RECENT,  SIGNIFICANTLY_CLOSER_MORE_RECENT;
  
  private LocationValidator$Stratigies$CompareStrategyEnum() {}
  
  public abstract boolean isValid(Location paramLocation1, Location paramLocation2);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationValidator.Stratigies.CompareStrategyEnum
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */