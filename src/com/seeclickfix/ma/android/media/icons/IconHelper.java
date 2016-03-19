package com.seeclickfix.ma.android.media.icons;

import com.seeclickfix.ma.android.util.DisplayUtil;
import com.seeclickfix.ma.android.util.DisplayUtil.DENSITY;

public class IconHelper
{
  public static String getCategoryIconBaseUrl()
  {
    DisplayUtil.DENSITY localDENSITY = DisplayUtil.getDensity();
    switch (localDENSITY)
    {
    default: 
      return "http://cdn.seeclickfix.com/images/category_icons/36/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/category_icons/256/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/category_icons/128/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/category_icons/96/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/category_icons/48/";
    }
    return "http://cdn.seeclickfix.com/images/category_icons/28/";
  }
  
  public static String getZoneIconBaseUrl()
  {
    DisplayUtil.DENSITY localDENSITY = DisplayUtil.getDensity();
    switch (localDENSITY)
    {
    default: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/36/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/96/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/72/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/48/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/36/";
    }
    return "http://cdn.seeclickfix.com/images/custom_buttons/28/";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.icons.IconHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */