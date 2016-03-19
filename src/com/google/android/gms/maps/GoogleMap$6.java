package com.google.android.gms.maps;

import android.location.Location;
import android.os.RemoteException;
import com.google.android.gms.maps.internal.ILocationSourceDelegate.a;
import com.google.android.gms.maps.internal.i;
import com.google.android.gms.maps.model.RuntimeRemoteException;

class GoogleMap$6
  extends ILocationSourceDelegate.a
{
  GoogleMap$6(GoogleMap paramGoogleMap, LocationSource paramLocationSource) {}
  
  public void activate(final i parami)
  {
    aku.activate(new LocationSource.OnLocationChangedListener()
    {
      public void onLocationChanged(Location paramAnonymousLocation)
      {
        try
        {
          parami.d(paramAnonymousLocation);
          return;
        }
        catch (RemoteException paramAnonymousLocation)
        {
          throw new RuntimeRemoteException(paramAnonymousLocation);
        }
      }
    });
  }
  
  public void deactivate()
  {
    aku.deactivate();
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.maps.GoogleMap.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */