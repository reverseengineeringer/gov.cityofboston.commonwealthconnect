package com.seeclickfix.ma.android.location;

import android.location.Location;

public class BoundingBox
{
  public static final double DELTA_LATITUDE_DEFAULT = 0.07D;
  public static final double DELTA_LONGITUDE_DEFAULT = 0.07D;
  double lowerLeftLatitude = 0.0D;
  double lowerLeftLongitude = 0.0D;
  double upperRightLatitude = 0.0D;
  double upperRightLongitude = 0.0D;
  
  public BoundingBox() {}
  
  public BoundingBox(Location paramLocation)
  {
    double d1 = paramLocation.getLongitude();
    double d2 = paramLocation.getLatitude();
    double d3 = calcDeltaLong(0.07D, d2);
    lowerLeftLatitude = (d2 - 0.07D);
    lowerLeftLongitude = (d1 - d3);
    upperRightLatitude = (d2 + 0.07D);
    upperRightLongitude = (d1 + d3);
  }
  
  public double calcDeltaLong(double paramDouble1, double paramDouble2)
  {
    return paramDouble1 * (1.0D / Math.cos(Math.toRadians(paramDouble2)));
  }
  
  public double lowerLeftLatitude()
  {
    return lowerLeftLatitude;
  }
  
  public BoundingBox lowerLeftLatitude(double paramDouble)
  {
    lowerLeftLatitude = paramDouble;
    return this;
  }
  
  public double lowerLeftLongitude()
  {
    return lowerLeftLongitude;
  }
  
  public BoundingBox lowerLeftLongitude(double paramDouble)
  {
    lowerLeftLongitude = paramDouble;
    return this;
  }
  
  public double upperRightLatitude()
  {
    return upperRightLatitude;
  }
  
  public BoundingBox upperRightLatitude(double paramDouble)
  {
    upperRightLatitude = paramDouble;
    return this;
  }
  
  public double upperRightLongitude()
  {
    return upperRightLongitude;
  }
  
  public BoundingBox upperRightLongitude(double paramDouble)
  {
    upperRightLongitude = paramDouble;
    return this;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.BoundingBox
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */