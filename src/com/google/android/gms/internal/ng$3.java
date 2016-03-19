package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationStatusCodes;
import com.google.android.gms.location.c.b;
import java.util.List;

class ng$3
  extends ng.a
{
  ng$3(ng paramng, GoogleApiClient paramGoogleApiClient, List paramList)
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
        Log.wtf("GeofencingImpl", "PendingIntent callback shouldn't have been called");
      }
      
      public void b(int paramAnonymousInt, String[] paramAnonymousArrayOfString)
      {
        b(LocationStatusCodes.eD(paramAnonymousInt));
      }
    };
    paramnk.a(agQ, local1);
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.ng.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */