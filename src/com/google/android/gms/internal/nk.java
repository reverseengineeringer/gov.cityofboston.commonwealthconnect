package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationStatusCodes;
import com.google.android.gms.location.c.a;
import com.google.android.gms.location.c.b;
import java.util.List;

public class nk
  extends nc
{
  private final nj agX = new nj(paramContext, Ee);
  private final mz agY = mz.a(paramContext, paramString3, paramString4, Ee);
  private final ie agZ = ie.a(paramContext, Ee);
  
  public nk(Context paramContext, Looper paramLooper, String paramString1, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString2)
  {
    this(paramContext, paramLooper, paramString1, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString2, null);
  }
  
  public nk(Context paramContext, Looper paramLooper, String paramString1, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString2, String paramString3)
  {
    this(paramContext, paramLooper, paramString1, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString2, paramString3, null);
  }
  
  public nk(Context paramContext, Looper paramLooper, String paramString1, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString2, String paramString3, String paramString4)
  {
    super(paramContext, paramLooper, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString2);
  }
  
  public void S(boolean paramBoolean)
    throws RemoteException
  {
    agX.S(paramBoolean);
  }
  
  public void a(long paramLong, PendingIntent paramPendingIntent)
    throws RemoteException
  {
    dS();
    jx.i(paramPendingIntent);
    if (paramLong >= 0L) {}
    for (boolean bool = true;; bool = false)
    {
      jx.b(bool, "detectionIntervalMillis must be >= 0");
      ((ni)hw()).a(paramLong, true, paramPendingIntent);
      return;
    }
  }
  
  public void a(PendingIntent paramPendingIntent)
    throws RemoteException
  {
    dS();
    jx.i(paramPendingIntent);
    ((ni)hw()).a(paramPendingIntent);
  }
  
  public void a(PendingIntent paramPendingIntent, c.b paramb)
    throws RemoteException
  {
    dS();
    jx.b(paramPendingIntent, "PendingIntent must be specified.");
    jx.b(paramb, "OnRemoveGeofencesResultListener not provided.");
    if (paramb == null) {}
    for (paramb = null;; paramb = new b(paramb, this))
    {
      ((ni)hw()).a(paramPendingIntent, paramb, getContext().getPackageName());
      return;
    }
  }
  
  public void a(GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent, c.a parama)
    throws RemoteException
  {
    dS();
    jx.b(paramGeofencingRequest, "geofencingRequest can't be null.");
    jx.b(paramPendingIntent, "PendingIntent must be specified.");
    jx.b(parama, "OnAddGeofencesResultListener not provided.");
    if (parama == null) {}
    for (parama = null;; parama = new b(parama, this))
    {
      ((ni)hw()).a(paramGeofencingRequest, paramPendingIntent, parama);
      return;
    }
  }
  
  public void a(LocationListener paramLocationListener)
    throws RemoteException
  {
    agX.a(paramLocationListener);
  }
  
  public void a(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
    throws RemoteException
  {
    synchronized (agX)
    {
      agX.a(paramLocationRequest, paramLocationListener, paramLooper);
      return;
    }
  }
  
  public void a(List<String> paramList, c.b paramb)
    throws RemoteException
  {
    dS();
    boolean bool;
    String[] arrayOfString;
    if ((paramList != null) && (paramList.size() > 0))
    {
      bool = true;
      jx.b(bool, "geofenceRequestIds can't be null nor empty.");
      jx.b(paramb, "OnRemoveGeofencesResultListener not provided.");
      arrayOfString = (String[])paramList.toArray(new String[0]);
      if (paramb != null) {
        break label81;
      }
    }
    label81:
    for (paramList = null;; paramList = new b(paramb, this))
    {
      ((ni)hw()).a(arrayOfString, paramList, getContext().getPackageName());
      return;
      bool = false;
      break;
    }
  }
  
  public void b(Location paramLocation)
    throws RemoteException
  {
    agX.b(paramLocation);
  }
  
  public void b(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
    throws RemoteException
  {
    agX.b(paramLocationRequest, paramPendingIntent);
  }
  
  public void c(PendingIntent paramPendingIntent)
    throws RemoteException
  {
    agX.c(paramPendingIntent);
  }
  
  public void disconnect()
  {
    synchronized (agX)
    {
      boolean bool = isConnected();
      if (bool) {}
      try
      {
        agX.removeAllListeners();
        agX.nm();
        super.disconnect();
        return;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Log.e("LocationClientImpl", "Client disconnected before listeners could be cleaned up", localException);
        }
      }
    }
  }
  
  public Location nl()
  {
    return agX.nl();
  }
  
  private final class a
    extends jl<ni>.b<c.a>
  {
    private final int Iv;
    private final String[] aha;
    
    public a(c.a parama, int paramInt, String[] paramArrayOfString)
    {
      super(parama);
      Iv = LocationStatusCodes.eC(paramInt);
      aha = paramArrayOfString;
    }
    
    protected void a(c.a parama)
    {
      if (parama != null) {
        parama.a(Iv, aha);
      }
    }
    
    protected void hx() {}
  }
  
  private static final class b
    extends nh.a
  {
    private c.a ahc;
    private c.b ahd;
    private nk ahe;
    
    public b(c.a parama, nk paramnk)
    {
      ahc = parama;
      ahd = null;
      ahe = paramnk;
    }
    
    public b(c.b paramb, nk paramnk)
    {
      ahd = paramb;
      ahc = null;
      ahe = paramnk;
    }
    
    public void a(int paramInt, PendingIntent paramPendingIntent)
    {
      if (ahe == null)
      {
        Log.wtf("LocationClientImpl", "onRemoveGeofencesByPendingIntentResult called multiple times");
        return;
      }
      nk localnk1 = ahe;
      nk localnk2 = ahe;
      localnk2.getClass();
      localnk1.a(new nk.c(localnk2, 1, ahd, paramInt, paramPendingIntent));
      ahe = null;
      ahc = null;
      ahd = null;
    }
    
    public void a(int paramInt, String[] paramArrayOfString)
      throws RemoteException
    {
      if (ahe == null)
      {
        Log.wtf("LocationClientImpl", "onAddGeofenceResult called multiple times");
        return;
      }
      nk localnk1 = ahe;
      nk localnk2 = ahe;
      localnk2.getClass();
      localnk1.a(new nk.a(localnk2, ahc, paramInt, paramArrayOfString));
      ahe = null;
      ahc = null;
      ahd = null;
    }
    
    public void b(int paramInt, String[] paramArrayOfString)
    {
      if (ahe == null)
      {
        Log.wtf("LocationClientImpl", "onRemoveGeofencesByRequestIdsResult called multiple times");
        return;
      }
      nk localnk1 = ahe;
      nk localnk2 = ahe;
      localnk2.getClass();
      localnk1.a(new nk.c(localnk2, 2, ahd, paramInt, paramArrayOfString));
      ahe = null;
      ahc = null;
      ahd = null;
    }
  }
  
  private final class c
    extends jl<ni>.b<c.b>
  {
    private final int Iv;
    private final String[] aha;
    private final int ahf;
    private final PendingIntent mPendingIntent;
    
    public c(int paramInt1, c.b paramb, int paramInt2, PendingIntent paramPendingIntent)
    {
      super(paramb);
      if (paramInt1 == 1) {}
      for (;;)
      {
        je.K(bool);
        ahf = paramInt1;
        Iv = LocationStatusCodes.eC(paramInt2);
        mPendingIntent = paramPendingIntent;
        aha = null;
        return;
        bool = false;
      }
    }
    
    public c(int paramInt1, c.b paramb, int paramInt2, String[] paramArrayOfString)
    {
      super(paramb);
      if (paramInt1 == 2) {}
      for (boolean bool = true;; bool = false)
      {
        je.K(bool);
        ahf = paramInt1;
        Iv = LocationStatusCodes.eC(paramInt2);
        aha = paramArrayOfString;
        mPendingIntent = null;
        return;
      }
    }
    
    protected void a(c.b paramb)
    {
      if (paramb != null) {}
      switch (ahf)
      {
      default: 
        Log.wtf("LocationClientImpl", "Unsupported action: " + ahf);
        return;
      case 1: 
        paramb.a(Iv, mPendingIntent);
        return;
      }
      paramb.b(Iv, aha);
    }
    
    protected void hx() {}
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.nk
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */