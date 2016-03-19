package com.google.android.gms.location;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.b;
import com.google.android.gms.common.api.Api.c;
import com.google.android.gms.common.api.BaseImplementation.a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.jg;
import com.google.android.gms.internal.jx;
import com.google.android.gms.internal.nf;
import com.google.android.gms.internal.ng;
import com.google.android.gms.internal.nk;

public class LocationServices
{
  public static final Api<Api.ApiOptions.NoOptions> API = new Api(DR, DQ, new Scope[0]);
  private static final Api.c<nk> DQ = new Api.c();
  private static final Api.b<nk, Api.ApiOptions.NoOptions> DR = new Api.b()
  {
    public nk e(Context paramAnonymousContext, Looper paramAnonymousLooper, jg paramAnonymousjg, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      return new nk(paramAnonymousContext, paramAnonymousLooper, paramAnonymousContext.getPackageName(), paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, "locationServices", paramAnonymousjg.getAccountName());
    }
    
    public int getPriority()
    {
      return Integer.MAX_VALUE;
    }
  };
  public static FusedLocationProviderApi FusedLocationApi = new nf();
  public static GeofencingApi GeofencingApi = new ng();
  
  public static nk f(GoogleApiClient paramGoogleApiClient)
  {
    boolean bool2 = true;
    if (paramGoogleApiClient != null)
    {
      bool1 = true;
      jx.b(bool1, "GoogleApiClient parameter is required.");
      paramGoogleApiClient = (nk)paramGoogleApiClient.a(DQ);
      if (paramGoogleApiClient == null) {
        break label46;
      }
    }
    label46:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      jx.a(bool1, "GoogleApiClient is not configured to use the LocationServices.API Api. Pass thisinto GoogleApiClient.Builder#addApi() to use this feature.");
      return paramGoogleApiClient;
      bool1 = false;
      break;
    }
  }
  
  public static abstract class a<R extends Result>
    extends BaseImplementation.a<R, nk>
  {
    public a(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.location.LocationServices
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */