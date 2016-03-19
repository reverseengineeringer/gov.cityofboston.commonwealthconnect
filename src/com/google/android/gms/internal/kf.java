package com.google.android.gms.internal;

import com.google.android.gms.common.api.BaseImplementation.a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;

abstract class kf<R extends Result>
  extends BaseImplementation.a<R, kg>
{
  public kf(GoogleApiClient paramGoogleApiClient)
  {
    super(kc.DQ, paramGoogleApiClient);
  }
  
  static abstract class a
    extends kf<Status>
  {
    public a(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }
    
    public Status b(Status paramStatus)
    {
      return paramStatus;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.kf
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */