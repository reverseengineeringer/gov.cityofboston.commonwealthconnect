package com.seeclickfix.ma.android.fragments.map;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.SupportMapFragment;
import javax.inject.Inject;

public class MapHelper
{
  public SupportMapFragment initMap(Fragment paramFragment, int paramInt, GoogleMapOptions paramGoogleMapOptions)
  {
    MapsInitializer.initialize(paramFragment.getActivity());
    paramFragment = paramFragment.getChildFragmentManager();
    Object localObject = (SupportMapFragment)paramFragment.findFragmentById(paramInt);
    if (localObject != null) {
      return (SupportMapFragment)localObject;
    }
    paramGoogleMapOptions = SupportMapFragment.newInstance(paramGoogleMapOptions);
    localObject = paramFragment.beginTransaction();
    ((FragmentTransaction)localObject).add(paramInt, paramGoogleMapOptions);
    ((FragmentTransaction)localObject).commit();
    paramFragment.executePendingTransactions();
    return paramGoogleMapOptions;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.map.MapHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */