package com.seeclickfix.ma.android.location;

import android.location.Address;

public class AddressLocalizer
{
  private static String getAddressAdminString(Address paramAddress)
  {
    if (paramAddress.getAdminArea() == null) {
      return "";
    }
    return paramAddress.getAdminArea();
  }
  
  private static String getAddressLine1String(Address paramAddress)
  {
    if (paramAddress.getMaxAddressLineIndex() > 0) {
      return paramAddress.getAddressLine(0);
    }
    return "";
  }
  
  private static String getAddressLocalityString(Address paramAddress)
  {
    if (paramAddress.getLocality() == null) {
      return "";
    }
    return paramAddress.getLocality();
  }
  
  public static String getAddressString(Address paramAddress)
  {
    return String.format("%s, %s, %s", new Object[] { getAddressLine1String(paramAddress), getAddressLocalityString(paramAddress), getAddressAdminString(paramAddress) });
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.AddressLocalizer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */