package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Process;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.internal.ld;
import com.google.android.gms.internal.lf;
import java.io.IOException;

class a
{
  private static a aqa;
  private static Object xO = new Object();
  private volatile long apW = 900000L;
  private volatile long apX = 30000L;
  private volatile long apY;
  private a apZ = new a()
  {
    public AdvertisingIdClient.Info pd()
    {
      try
      {
        AdvertisingIdClient.Info localInfo = AdvertisingIdClient.getAdvertisingIdInfo(a.a(a.this));
        return localInfo;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        bh.W("IllegalStateException getting Advertising Id Info");
        return null;
      }
      catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
      {
        bh.W("GooglePlayServicesRepairableException getting Advertising Id Info");
        return null;
      }
      catch (IOException localIOException)
      {
        bh.W("IOException getting Ad Id Info");
        return null;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
        bh.W("GooglePlayServicesNotAvailableException getting Advertising Id Info");
        return null;
      }
      catch (Exception localException)
      {
        bh.W("Unknown exception. Could not get the Advertising Id Info.");
      }
      return null;
    }
  };
  private volatile boolean mClosed = false;
  private final Context mContext;
  private final ld wb;
  private final Thread wu;
  private volatile AdvertisingIdClient.Info xQ;
  
  private a(Context paramContext)
  {
    this(paramContext, null, lf.jdMethod_if());
  }
  
  a(Context paramContext, a parama, ld paramld)
  {
    wb = paramld;
    if (paramContext != null) {}
    for (mContext = paramContext.getApplicationContext();; mContext = paramContext)
    {
      if (parama != null) {
        apZ = parama;
      }
      wu = new Thread(new Runnable()
      {
        public void run()
        {
          a.b(a.this);
        }
      });
      return;
    }
  }
  
  static a W(Context paramContext)
  {
    if (aqa == null) {}
    synchronized (xO)
    {
      if (aqa == null)
      {
        aqa = new a(paramContext);
        aqa.start();
      }
      return aqa;
    }
  }
  
  private void pb()
  {
    Process.setThreadPriority(10);
    while (!mClosed) {
      try
      {
        xQ = apZ.pd();
        Thread.sleep(apW);
      }
      catch (InterruptedException localInterruptedException)
      {
        bh.U("sleep interrupted in AdvertiserDataPoller thread; continuing");
      }
    }
  }
  
  private void pc()
  {
    if (wb.currentTimeMillis() - apY < apX) {
      return;
    }
    interrupt();
    apY = wb.currentTimeMillis();
  }
  
  void interrupt()
  {
    wu.interrupt();
  }
  
  public boolean isLimitAdTrackingEnabled()
  {
    pc();
    if (xQ == null) {
      return true;
    }
    return xQ.isLimitAdTrackingEnabled();
  }
  
  public String pa()
  {
    pc();
    if (xQ == null) {
      return null;
    }
    return xQ.getId();
  }
  
  void start()
  {
    wu.start();
  }
  
  public static abstract interface a
  {
    public abstract AdvertisingIdClient.Info pd();
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.tagmanager.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */