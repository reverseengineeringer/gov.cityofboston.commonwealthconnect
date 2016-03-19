package com.google.android.gms.internal;

import android.content.Context;
import android.os.AsyncTask;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class j
  extends i
{
  private static AdvertisingIdClient kO;
  private static CountDownLatch kP = new CountDownLatch(1);
  private static boolean kQ;
  
  protected j(Context paramContext, m paramm, n paramn)
  {
    super(paramContext, paramm, paramn);
  }
  
  public static j a(String paramString, Context paramContext)
  {
    e locale = new e();
    a(paramString, paramContext, locale);
    try
    {
      if (kO == null)
      {
        kO = new AdvertisingIdClient(paramContext);
        new AsyncTask()
        {
          protected Void a(Void... paramAnonymousVarArgs)
          {
            try
            {
              j.A().start();
              j.B().countDown();
              return null;
            }
            catch (GooglePlayServicesNotAvailableException paramAnonymousVarArgs)
            {
              for (;;)
              {
                j.a(true);
                j.a(null);
              }
            }
            catch (IOException paramAnonymousVarArgs)
            {
              for (;;)
              {
                j.a(null);
              }
            }
            catch (GooglePlayServicesRepairableException paramAnonymousVarArgs)
            {
              for (;;)
              {
                j.a(null);
              }
            }
          }
        }.execute(new Void[0]);
      }
      return new j(paramContext, locale, new p(239));
    }
    finally {}
  }
  
  protected void b(Context paramContext)
  {
    super.b(paramContext);
    try
    {
      if (kQ)
      {
        a(24, d(paramContext));
        return;
      }
      paramContext = z();
      if (!paramContext.isLimitAdTrackingEnabled()) {
        break label71;
      }
      l = 1L;
    }
    catch (IOException paramContext)
    {
      for (;;)
      {
        return;
        long l = 0L;
      }
    }
    catch (i.a paramContext) {}
    a(28, l);
    paramContext = paramContext.getId();
    if (paramContext != null)
    {
      a(26, 5L);
      a(24, paramContext);
      return;
    }
    label71:
  }
  
  a z()
    throws IOException
  {
    int i = 0;
    try
    {
      if (!kP.await(2L, TimeUnit.SECONDS))
      {
        a locala1 = new a(null, false);
        return locala1;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      a locala2 = new a(null, false);
      return locala2;
    }
    finally {}
    if (kO == null)
    {
      localObject2 = new a(null, false);
      return (a)localObject2;
    }
    AdvertisingIdClient.Info localInfo = kO.getInfo();
    Object localObject2 = localInfo.getId();
    if ((localObject2 != null) && (((String)localObject2).matches("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$")))
    {
      byte[] arrayOfByte = new byte[16];
      int j = 0;
      while (i < ((String)localObject2).length())
      {
        int k;
        if ((i != 8) && (i != 13) && (i != 18))
        {
          k = i;
          if (i != 23) {}
        }
        else
        {
          k = i + 1;
        }
        arrayOfByte[j] = ((byte)((Character.digit(((String)localObject2).charAt(k), 16) << 4) + Character.digit(((String)localObject2).charAt(k + 1), 16)));
        j += 1;
        i = k + 2;
      }
      localObject2 = ky.a(arrayOfByte, true);
    }
    for (;;)
    {
      return new a((String)localObject2, localInfo.isLimitAdTrackingEnabled());
    }
  }
  
  class a
  {
    private String kR;
    private boolean kS;
    
    public a(String paramString, boolean paramBoolean)
    {
      kR = paramString;
      kS = paramBoolean;
    }
    
    public String getId()
    {
      return kR;
    }
    
    public boolean isLimitAdTrackingEnabled()
    {
      return kS;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.j
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */