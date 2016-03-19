package com.seeclickfix.ma.android.location;

import android.location.Location;

 enum LocationValidator$Stratigies$CompareStrategyEnum$1
{
  LocationValidator$Stratigies$CompareStrategyEnum$1()
  {
    super(paramString, paramInt, null);
  }
  
  public boolean isValid(Location paramLocation1, Location paramLocation2)
  {
    if (paramLocation2 == null) {}
    label74:
    label78:
    for (;;)
    {
      return false;
      if (paramLocation1 == null) {
        return true;
      }
      long l1 = paramLocation1.getTime();
      long l2 = paramLocation2.getTime();
      float f1 = paramLocation1.getAccuracy();
      float f2 = paramLocation2.getAccuracy();
      int i;
      if (l2 >= l1)
      {
        i = 1;
        if (f2 > f1) {
          break label74;
        }
      }
      for (int j = 1;; j = 0)
      {
        if ((i == 0) || (j == 0)) {
          break label78;
        }
        return true;
        i = 0;
        break;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationValidator.Stratigies.CompareStrategyEnum.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */