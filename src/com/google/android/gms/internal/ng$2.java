package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationStatusCodes;
import com.google.android.gms.location.c.b;

class ng$2
  extends ng.a
{
  ng$2(ng paramng, GoogleApiClient paramGoogleApiClient, PendingIntent paramPendingIntent)
  {
    super(paramGoogleApiClient);
  }
  
  protected void a(nk paramnk)
    throws RemoteException
  {
    c.b local1 = new c.b()
    {
      public void a(int paramAnonymousInt, PendingIntent paramAnonymousPendingIntent)
      {
        b(LocationStatusCodes.eD(paramAnonymousInt));
      }
      
      public void b(int paramAnonymousInt, String[] paramAnonymousArrayOfString)
      {
        Log.wtf("GeofencingImpl", "Request ID callback shouldn't have been called");
      }
    };
    paramnk.a(agM, local1);
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.ng.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */