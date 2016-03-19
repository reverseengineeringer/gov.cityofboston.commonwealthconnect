package com.seeclickfix.ma.android.fragments.interfaces;

import com.seeclickfix.ma.android.objects.PageParams;

public abstract interface OnPlaceMapListener
{
  public abstract void onMapPlaceCancel();
  
  public abstract void onMapPlaceSaved(PageParams paramPageParams);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.interfaces.OnPlaceMapListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */