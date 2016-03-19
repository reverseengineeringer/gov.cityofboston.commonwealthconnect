package com.seeclickfix.ma.android.location;

import android.location.Location;

 enum LocationValidator$Stratigies$PrecisionStrategyEnum$3
{
  LocationValidator$Stratigies$PrecisionStrategyEnum$3()
  {
    super(paramString, paramInt, null);
  }
  
  public boolean isValid(Location paramLocation)
  {
    if (paramLocation == null) {}
    while (paramLocation.getAccuracy() >= 75.0F) {
      return false;
    }
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationValidator.Stratigies.PrecisionStrategyEnum.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */