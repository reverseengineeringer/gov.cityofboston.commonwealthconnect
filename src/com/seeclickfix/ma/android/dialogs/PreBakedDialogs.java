package com.seeclickfix.ma.android.dialogs;

import android.util.Log;

public class PreBakedDialogs
{
  public static final String LOCATION_OFF = "PreBakedDialogs::LOCATION_OFF";
  public static final String NO_NETWORK = "PreBakedDialogs::NO_NETWORK";
  
  public static DialogOptions getDialogOptions(String paramString)
  {
    int i = -1;
    switch (paramString.hashCode())
    {
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        Log.e("PreBakedDialogs", "getDialogOptions called for unknown dialog type");
        return null;
        if (paramString.equals("PreBakedDialogs::NO_NETWORK"))
        {
          i = 0;
          continue;
          if (paramString.equals("PreBakedDialogs::LOCATION_OFF")) {
            i = 1;
          }
        }
        break;
      }
    }
    return getNoNetwork();
    return getNoLocation();
  }
  
  static DialogOptions getNoLocation()
  {
    DialogOptions localDialogOptions = new DialogOptions();
    titleTextId = 2131492970;
    msgTextId = 2131492969;
    positiveButtonTextId = 2131493071;
    negativeButtonTextId = 2131492885;
    fragmentTag = "FragmentTags:DIALOG_WARN_LOC_DISABLED";
    return localDialogOptions;
  }
  
  static DialogOptions getNoNetwork()
  {
    DialogOptions localDialogOptions = new DialogOptions();
    msgTextId = 2131492941;
    titleTextId = 2131492943;
    positiveButtonTextId = 2131492942;
    negativeButtonTextId = 2131492885;
    fragmentTag = "FragmentTags:DIALOG_WARN_NO_NETWORK";
    return localDialogOptions;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.PreBakedDialogs
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */