package com.google.android.gms.common.api;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.jg;
import com.google.android.gms.internal.jx;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public abstract interface GoogleApiClient
{
  public abstract <C extends Api.a> C a(Api.c<C> paramc);
  
  public abstract <A extends Api.a, R extends Result, T extends BaseImplementation.a<R, A>> T a(T paramT);
  
  public abstract boolean a(Scope paramScope);
  
  public abstract <A extends Api.a, T extends BaseImplementation.a<? extends Result, A>> T b(T paramT);
  
  public abstract ConnectionResult blockingConnect();
  
  public abstract ConnectionResult blockingConnect(long paramLong, TimeUnit paramTimeUnit);
  
  public abstract PendingResult<Status> clearDefaultAccountAndReconnect();
  
  public abstract void connect();
  
  public abstract <L> d<L> d(L paramL);
  
  public abstract void disconnect();
  
  public abstract Looper getLooper();
  
  public abstract boolean isConnected();
  
  public abstract boolean isConnecting();
  
  public abstract boolean isConnectionCallbacksRegistered(ConnectionCallbacks paramConnectionCallbacks);
  
  public abstract boolean isConnectionFailedListenerRegistered(OnConnectionFailedListener paramOnConnectionFailedListener);
  
  public abstract void reconnect();
  
  public abstract void registerConnectionCallbacks(ConnectionCallbacks paramConnectionCallbacks);
  
  public abstract void registerConnectionFailedListener(OnConnectionFailedListener paramOnConnectionFailedListener);
  
  public abstract void stopAutoManage(FragmentActivity paramFragmentActivity);
  
  public abstract void unregisterConnectionCallbacks(ConnectionCallbacks paramConnectionCallbacks);
  
  public abstract void unregisterConnectionFailedListener(OnConnectionFailedListener paramOnConnectionFailedListener);
  
  public static final class Builder
  {
    private String DZ;
    private Looper JF;
    private final Set<String> JH = new HashSet();
    private int JI;
    private View JJ;
    private String JK;
    private final Map<Api<?>, Api.ApiOptions> JL = new HashMap();
    private FragmentActivity JM;
    private int JN = -1;
    private GoogleApiClient.OnConnectionFailedListener JO;
    private final Set<GoogleApiClient.ConnectionCallbacks> JP = new HashSet();
    private final Set<GoogleApiClient.OnConnectionFailedListener> JQ = new HashSet();
    private final Context mContext;
    
    public Builder(Context paramContext)
    {
      mContext = paramContext;
      JF = paramContext.getMainLooper();
      JK = paramContext.getPackageName();
    }
    
    public Builder(Context paramContext, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this(paramContext);
      jx.b(paramConnectionCallbacks, "Must provide a connected listener");
      JP.add(paramConnectionCallbacks);
      jx.b(paramOnConnectionFailedListener, "Must provide a connection failed listener");
      JQ.add(paramOnConnectionFailedListener);
    }
    
    private GoogleApiClient gI()
    {
      g localg = g.a(JM);
      GoogleApiClient localGoogleApiClient = localg.an(JN);
      Object localObject = localGoogleApiClient;
      if (localGoogleApiClient == null) {
        localObject = new c(mContext.getApplicationContext(), JF, gH(), JL, JP, JQ, JN);
      }
      localg.a(JN, (GoogleApiClient)localObject, JO);
      return (GoogleApiClient)localObject;
    }
    
    public Builder addApi(Api<? extends Api.ApiOptions.NotRequiredOptions> paramApi)
    {
      JL.put(paramApi, null);
      paramApi = paramApi.gy();
      int j = paramApi.size();
      int i = 0;
      while (i < j)
      {
        JH.add(((Scope)paramApi.get(i)).gO());
        i += 1;
      }
      return this;
    }
    
    public <O extends Api.ApiOptions.HasOptions> Builder addApi(Api<O> paramApi, O paramO)
    {
      jx.b(paramO, "Null options are not permitted for this Api");
      JL.put(paramApi, paramO);
      paramApi = paramApi.gy();
      int j = paramApi.size();
      int i = 0;
      while (i < j)
      {
        JH.add(((Scope)paramApi.get(i)).gO());
        i += 1;
      }
      return this;
    }
    
    public Builder addConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
    {
      JP.add(paramConnectionCallbacks);
      return this;
    }
    
    public Builder addOnConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      JQ.add(paramOnConnectionFailedListener);
      return this;
    }
    
    public Builder addScope(Scope paramScope)
    {
      JH.add(paramScope.gO());
      return this;
    }
    
    public GoogleApiClient build()
    {
      if (!JL.isEmpty()) {}
      for (boolean bool = true;; bool = false)
      {
        jx.b(bool, "must call addApi() to add at least one API");
        if (JN < 0) {
          break;
        }
        return gI();
      }
      return new c(mContext, JF, gH(), JL, JP, JQ, -1);
    }
    
    public Builder enableAutoManage(FragmentActivity paramFragmentActivity, int paramInt, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      if (paramInt >= 0) {}
      for (boolean bool = true;; bool = false)
      {
        jx.b(bool, "clientId must be non-negative");
        JN = paramInt;
        JM = ((FragmentActivity)jx.b(paramFragmentActivity, "Null activity is not permitted."));
        JO = paramOnConnectionFailedListener;
        return this;
      }
    }
    
    public jg gH()
    {
      return new jg(DZ, JH, JI, JJ, JK);
    }
    
    public Builder setAccountName(String paramString)
    {
      DZ = paramString;
      return this;
    }
    
    public Builder setGravityForPopups(int paramInt)
    {
      JI = paramInt;
      return this;
    }
    
    public Builder setHandler(Handler paramHandler)
    {
      jx.b(paramHandler, "Handler must not be null");
      JF = paramHandler.getLooper();
      return this;
    }
    
    public Builder setViewForPopups(View paramView)
    {
      JJ = paramView;
      return this;
    }
    
    public Builder useDefaultAccount()
    {
      return setAccountName("<<default account>>");
    }
  }
  
  public static abstract interface ConnectionCallbacks
  {
    public static final int CAUSE_NETWORK_LOST = 2;
    public static final int CAUSE_SERVICE_DISCONNECTED = 1;
    
    public abstract void onConnected(Bundle paramBundle);
    
    public abstract void onConnectionSuspended(int paramInt);
  }
  
  public static abstract interface OnConnectionFailedListener
    extends GooglePlayServicesClient.OnConnectionFailedListener
  {
    public abstract void onConnectionFailed(ConnectionResult paramConnectionResult);
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.api.GoogleApiClient
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */