package com.seeclickfix.ma.android.location;

import android.location.Location;

 enum LocationValidator$Stratigies$PrecisionStrategyEnum$4
{
  LocationValidator$Stratigies$PrecisionStrategyEnum$4()
  {
    super(paramString, paramInt, null);
  }
  
  public boolean isValid(Location paramLocation)
  {
    boolean bool2 = false;
    if (paramLocation == null) {
      return false;
    }
    boolean bool1 = bool2;
    if (RECENT.isValid(paramLocation))
    {
      bool1 = bool2;
      if (CLOSE.isValid(paramLocation)) {
        bool1 = true;
      }
    }
    return bool1;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationValidator.Stratigies.PrecisionStrategyEnum.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */