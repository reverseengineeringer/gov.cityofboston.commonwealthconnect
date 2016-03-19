package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ContentProviderClient;
import android.content.Context;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.b.a;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class nj
{
  private final np<ni> Ee;
  private ContentProviderClient agS = null;
  private boolean agT = false;
  private HashMap<LocationListener, b> agU = new HashMap();
  private final Context mContext;
  
  public nj(Context paramContext, np<ni> paramnp)
  {
    mContext = paramContext;
    Ee = paramnp;
  }
  
  private b a(LocationListener paramLocationListener, Looper paramLooper)
  {
    if (paramLooper == null) {
      jx.b(Looper.myLooper(), "Can't create handler inside thread that has not called Looper.prepare()");
    }
    synchronized (agU)
    {
      b localb2 = (b)agU.get(paramLocationListener);
      b localb1 = localb2;
      if (localb2 == null) {
        localb1 = new b(paramLocationListener, paramLooper);
      }
      agU.put(paramLocationListener, localb1);
      return localb1;
    }
  }
  
  public void S(boolean paramBoolean)
    throws RemoteException
  {
    Ee.dS();
    ((ni)Ee.hw()).S(paramBoolean);
    agT = paramBoolean;
  }
  
  public void a(LocationListener paramLocationListener)
    throws RemoteException
  {
    Ee.dS();
    jx.b(paramLocationListener, "Invalid null listener");
    synchronized (agU)
    {
      paramLocationListener = (b)agU.remove(paramLocationListener);
      if ((agS != null) && (agU.isEmpty()))
      {
        agS.release();
        agS = null;
      }
      if (paramLocationListener != null)
      {
        paramLocationListener.release();
        ((ni)Ee.hw()).a(paramLocationListener);
      }
      return;
    }
  }
  
  public void a(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
    throws RemoteException
  {
    Ee.dS();
    paramLocationListener = a(paramLocationListener, paramLooper);
    ((ni)Ee.hw()).a(paramLocationRequest, paramLocationListener);
  }
  
  public void b(Location paramLocation)
    throws RemoteException
  {
    Ee.dS();
    ((ni)Ee.hw()).b(paramLocation);
  }
  
  public void b(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
    throws RemoteException
  {
    Ee.dS();
    ((ni)Ee.hw()).a(paramLocationRequest, paramPendingIntent);
  }
  
  public void c(PendingIntent paramPendingIntent)
    throws RemoteException
  {
    Ee.dS();
    ((ni)Ee.hw()).b(paramPendingIntent);
  }
  
  public Location nl()
  {
    Ee.dS();
    try
    {
      Location localLocation = ((ni)Ee.hw()).bZ(mContext.getPackageName());
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void nm()
  {
    if (agT) {}
    try
    {
      S(false);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void removeAllListeners()
  {
    try
    {
      synchronized (agU)
      {
        Iterator localIterator = agU.values().iterator();
        while (localIterator.hasNext())
        {
          b localb = (b)localIterator.next();
          if (localb != null) {
            ((ni)Ee.hw()).a(localb);
          }
        }
      }
      agU.clear();
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  private static class a
    extends Handler
  {
    private final LocationListener agV;
    
    public a(LocationListener paramLocationListener)
    {
      agV = paramLocationListener;
    }
    
    public a(LocationListener paramLocationListener, Looper paramLooper)
    {
      super();
      agV = paramLocationListener;
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
        Log.e("LocationClientHelper", "unknown message in LocationHandler.handleMessage");
        return;
      }
      paramMessage = new Location((Location)obj);
      agV.onLocationChanged(paramMessage);
    }
  }
  
  private static class b
    extends b.a
  {
    private Handler agW;
    
    b(LocationListener paramLocationListener, Looper paramLooper)
    {
      if (paramLooper == null) {}
      for (paramLocationListener = new nj.a(paramLocationListener);; paramLocationListener = new nj.a(paramLocationListener, paramLooper))
      {
        agW = paramLocationListener;
        return;
      }
    }
    
    public void onLocationChanged(Location paramLocation)
    {
      if (agW == null)
      {
        Log.e("LocationClientHelper", "Received a location in client after calling removeLocationUpdates.");
        return;
      }
      Message localMessage = Message.obtain();
      what = 1;
      obj = paramLocation;
      agW.sendMessage(localMessage);
    }
    
    public void release()
    {
      agW = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.nj
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */