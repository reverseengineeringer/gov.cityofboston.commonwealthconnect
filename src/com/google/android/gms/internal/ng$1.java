package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationStatusCodes;
import com.google.android.gms.location.c.a;

class ng$1
  extends ng.a
{
  ng$1(ng paramng, GoogleApiClient paramGoogleApiClient, GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent)
  {
    super(paramGoogleApiClient);
  }
  
  protected void a(nk paramnk)
    throws RemoteException
  {
    c.a local1 = new c.a()
    {
      public void a(int paramAnonymousInt, String[] paramAnonymousArrayOfString)
      {
        b(LocationStatusCodes.eD(paramAnonymousInt));
      }
    };
    paramnk.a(agL, agM, local1);
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.ng.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */