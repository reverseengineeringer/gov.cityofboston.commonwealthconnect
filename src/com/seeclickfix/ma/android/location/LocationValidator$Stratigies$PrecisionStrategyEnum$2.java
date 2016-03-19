package com.seeclickfix.ma.android.location;

import android.location.Location;

 enum LocationValidator$Stratigies$PrecisionStrategyEnum$2
{
  LocationValidator$Stratigies$PrecisionStrategyEnum$2()
  {
    super(paramString, paramInt, null);
  }
  
  public boolean isValid(Location paramLocation)
  {
    boolean bool = false;
    if (paramLocation == null) {
      return false;
    }
    if (System.currentTimeMillis() - paramLocation.getTime() <= 900000L) {
      bool = true;
    }
    return bool;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationValidator.Stratigies.PrecisionStrategyEnum.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */