package com.seeclickfix.ma.android.objects.loc;

import com.google.gson.annotations.SerializedName;

public class Geocode
{
  @SerializedName("full_address")
  private String address;
  @SerializedName("block_fips")
  private String blockFips;
  private String city;
  @SerializedName("country_code")
  private String countryCode;
  private String district;
  @SerializedName("district_fips")
  private String districtFips;
  @SerializedName("is_us?")
  private boolean isUSA;
  private double lat;
  private String ll;
  private double lng;
  private String precision;
  private String provider;
  private String province;
  private String state;
  @SerializedName("state_combined")
  private String stateCombined;
  @SerializedName("state_fips")
  private String stateFips;
  @SerializedName("street_address")
  private String street;
  @SerializedName("sub_premise")
  private String subPremise;
  private boolean success;
  
  public String getAddress()
  {
    return address;
  }
  
  public String getBlockFips()
  {
    return blockFips;
  }
  
  public String getCity()
  {
    return city;
  }
  
  public String getCountryCode()
  {
    return countryCode;
  }
  
  public String getDistrict()
  {
    return district;
  }
  
  public String getDistrictFips()
  {
    return districtFips;
  }
  
  public double getLat()
  {
    return lat;
  }
  
  public String getLl()
  {
    return ll;
  }
  
  public double getLng()
  {
    return lng;
  }
  
  public String getPrecision()
  {
    return precision;
  }
  
  public String getProvider()
  {
    return provider;
  }
  
  public String getProvince()
  {
    return province;
  }
  
  public String getState()
  {
    return state;
  }
  
  public String getStateCombined()
  {
    return stateCombined;
  }
  
  public String getStateFips()
  {
    return stateFips;
  }
  
  public String getStreet()
  {
    return street;
  }
  
  public String getSubPremise()
  {
    return subPremise;
  }
  
  public boolean isSuccess()
  {
    return success;
  }
  
  public boolean isUSA()
  {
    return isUSA;
  }
  
  public void setAddress(String paramString)
  {
    address = paramString;
  }
  
  public void setBlockFips(String paramString)
  {
    blockFips = paramString;
  }
  
  public void setCity(String paramString)
  {
    city = paramString;
  }
  
  public void setCountryCode(String paramString)
  {
    countryCode = paramString;
  }
  
  public void setDistrict(String paramString)
  {
    district = paramString;
  }
  
  public void setDistrictFips(String paramString)
  {
    districtFips = paramString;
  }
  
  public void setLat(double paramDouble)
  {
    lat = paramDouble;
  }
  
  public void setLl(String paramString)
  {
    ll = paramString;
  }
  
  public void setLng(double paramDouble)
  {
    lng = paramDouble;
  }
  
  public void setPrecision(String paramString)
  {
    precision = paramString;
  }
  
  public void setProvider(String paramString)
  {
    provider = paramString;
  }
  
  public void setProvince(String paramString)
  {
    province = paramString;
  }
  
  public void setState(String paramString)
  {
    state = paramString;
  }
  
  public void setStateCombined(String paramString)
  {
    stateCombined = paramString;
  }
  
  public void setStateFips(String paramString)
  {
    stateFips = paramString;
  }
  
  public void setStreet(String paramString)
  {
    street = paramString;
  }
  
  public void setSubPremise(String paramString)
  {
    subPremise = paramString;
  }
  
  public void setSuccess(boolean paramBoolean)
  {
    success = paramBoolean;
  }
  
  public void setUSA(boolean paramBoolean)
  {
    isUSA = paramBoolean;
  }
  
  public String toString()
  {
    return "Geocode [success=" + success + ", lat=" + lat + ", lng=" + lng + ", countryCode=" + countryCode + ", city=" + city + ", state=" + state + ", province=" + province + ", district=" + district + ", provider=" + provider + ", address=" + address + ", street=" + street + ", stateCombined=" + stateCombined + ", isUSA=" + isUSA + ", ll=" + ll + ", precision=" + precision + ", districtFips=" + districtFips + ", stateFips=" + stateFips + ", blockFips=" + blockFips + ", subPremise=" + subPremise + "]\n";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.loc.Geocode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */