package com.seeclickfix.ma.android.location;

import android.location.Location;

 enum LocationValidator$Stratigies$CompareStrategyEnum$2
{
  LocationValidator$Stratigies$CompareStrategyEnum$2()
  {
    super(paramString, paramInt, null);
  }
  
  public boolean isValid(Location paramLocation1, Location paramLocation2)
  {
    if (paramLocation2 == null) {
      return false;
    }
    if ((paramLocation1 == null) && (paramLocation2 != null)) {
      return true;
    }
    long l1 = paramLocation1.getTime();
    long l2 = paramLocation2.getTime();
    float f1 = paramLocation1.getAccuracy();
    float f2 = paramLocation2.getAccuracy();
    float[] arrayOfFloat = new float[3];
    Location.distanceBetween(paramLocation1.getLatitude(), paramLocation1.getLongitude(), paramLocation2.getLatitude(), paramLocation1.getLongitude(), arrayOfFloat);
    float f3 = arrayOfFloat[0];
    int i;
    int j;
    if (l2 >= 500L + l1)
    {
      i = 1;
      if (f2 > 10.0F + f1) {
        break label133;
      }
      j = 1;
      label99:
      if (20.0F >= f3) {
        break label139;
      }
    }
    label133:
    label139:
    for (int k = 1;; k = 0)
    {
      if ((i == 0) || (j == 0) || (k == 0)) {
        break label145;
      }
      return true;
      i = 0;
      break;
      j = 0;
      break label99;
    }
    label145:
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationValidator.Stratigies.CompareStrategyEnum.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */