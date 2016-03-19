package com.seeclickfix.ma.android.constants;

import android.os.Build.VERSION;

public class ApiLevel
{
  public static boolean SUPPORTS_ECLAIR;
  public static boolean SUPPORTS_FROYO;
  public static boolean SUPPORTS_GINGERBREAD;
  public static boolean SUPPORTS_HONEYCOMB;
  
  static
  {
    boolean bool2 = true;
    if (Build.VERSION.SDK_INT >= 9)
    {
      bool1 = true;
      SUPPORTS_GINGERBREAD = bool1;
      if (Build.VERSION.SDK_INT < 11) {
        break label63;
      }
      bool1 = true;
      label26:
      SUPPORTS_HONEYCOMB = bool1;
      if (Build.VERSION.SDK_INT < 8) {
        break label68;
      }
      bool1 = true;
      label40:
      SUPPORTS_FROYO = bool1;
      if (Build.VERSION.SDK_INT < 5) {
        break label73;
      }
    }
    label63:
    label68:
    label73:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      SUPPORTS_ECLAIR = bool1;
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label26;
      bool1 = false;
      break label40;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.constants.ApiLevel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */