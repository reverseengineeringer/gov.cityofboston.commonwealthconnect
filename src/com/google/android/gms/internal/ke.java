package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.BaseImplementation.b;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;

public final class ke
  implements kd
{
  public PendingResult<Status> c(GoogleApiClient paramGoogleApiClient)
  {
    new kf.a(paramGoogleApiClient)
    {
      protected void a(kg paramAnonymouskg)
        throws RemoteException
      {
        ((ki)paramAnonymouskg.hw()).a(new ke.a(this));
      }
    }.gE();
  }
  
  private static class a
    extends kb
  {
    private final BaseImplementation.b<Status> Ea;
    
    public a(BaseImplementation.b<Status> paramb)
    {
      Ea = paramb;
    }
    
    public void aI(int paramInt)
      throws RemoteException
    {
      Ea.b(new Status(paramInt));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.ke
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */