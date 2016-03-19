package com.seeclickfix.ma.android.location;

import com.google.gson.annotations.SerializedName;

public class PresetLocation
{
  @SerializedName("accuracy")
  private float mAccuracy = 100.0F;
  @SerializedName("lat")
  private double mLat;
  @SerializedName("lng")
  private double mLng;
  @SerializedName("name")
  private String mName = "(No name for this PresetLocation?)";
  @SerializedName("provider")
  private String mProvider = "fused";
  private long mTime;
  
  public float accuracy()
  {
    return mAccuracy;
  }
  
  public PresetLocation accuracy(float paramFloat)
  {
    mAccuracy = paramFloat;
    return this;
  }
  
  public double lat()
  {
    return mLat;
  }
  
  public PresetLocation lat(double paramDouble)
  {
    mLat = paramDouble;
    return this;
  }
  
  public double lng()
  {
    return mLng;
  }
  
  public PresetLocation lng(double paramDouble)
  {
    mLng = paramDouble;
    return this;
  }
  
  public PresetLocation name(String paramString)
  {
    mName = paramString;
    return this;
  }
  
  public String name()
  {
    return mName;
  }
  
  public PresetLocation provider(String paramString)
  {
    mProvider = paramString;
    return this;
  }
  
  public String provider()
  {
    return mProvider;
  }
  
  public long time()
  {
    return mTime;
  }
  
  public PresetLocation time(long paramLong)
  {
    mTime = paramLong;
    return this;
  }
  
  public String toLog()
  {
    return "PresetLocation{mName='" + mName + '\'' + ", mLat=" + mLat + ", mLng=" + mLng + ", mAccuracy=" + mAccuracy + ", mTime=" + mTime + '}';
  }
  
  public String toString()
  {
    return mName;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.PresetLocation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */