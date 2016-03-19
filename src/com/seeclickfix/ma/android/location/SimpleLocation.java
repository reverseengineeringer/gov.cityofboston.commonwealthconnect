package com.seeclickfix.ma.android.location;

import com.google.android.gms.maps.model.LatLng;
import org.json.JSONException;
import org.json.JSONObject;

public class SimpleLocation
{
  private String address;
  private double lat;
  private double lng;
  
  public SimpleLocation(double paramDouble1, double paramDouble2, String paramString)
  {
    lat = paramDouble1;
    lng = paramDouble2;
    address = paramString;
  }
  
  public static SimpleLocation fromJson(JSONObject paramJSONObject)
    throws JSONException
  {
    String str = paramJSONObject.getString("formatted_address");
    return new SimpleLocation(paramJSONObject.getJSONObject("geometry").getJSONObject("location").getDouble("lat"), paramJSONObject.getJSONObject("geometry").getJSONObject("location").getDouble("lng"), str);
  }
  
  public String getAddress()
  {
    return address;
  }
  
  public double getLat()
  {
    return lat;
  }
  
  public double getLng()
  {
    return lng;
  }
  
  public LatLng latLng()
  {
    return new LatLng(lat, lng);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.SimpleLocation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */