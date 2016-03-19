package com.google.android.gms.common.api;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.internal.jg;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class Api<O extends ApiOptions>
{
  private final b<?, O> Jm;
  private final c<?> Jn;
  private final ArrayList<Scope> Jo;
  
  public <C extends a> Api(b<C, O> paramb, c<C> paramc, Scope... paramVarArgs)
  {
    Jm = paramb;
    Jn = paramc;
    Jo = new ArrayList(Arrays.asList(paramVarArgs));
  }
  
  public b<?, O> gx()
  {
    return Jm;
  }
  
  public List<Scope> gy()
  {
    return Jo;
  }
  
  public c<?> gz()
  {
    return Jn;
  }
  
  public static abstract interface ApiOptions
  {
    public static abstract interface HasOptions
      extends Api.ApiOptions
    {}
    
    public static final class NoOptions
      implements Api.ApiOptions.NotRequiredOptions
    {}
    
    public static abstract interface NotRequiredOptions
      extends Api.ApiOptions
    {}
    
    public static abstract interface Optional
      extends Api.ApiOptions.HasOptions, Api.ApiOptions.NotRequiredOptions
    {}
  }
  
  public static abstract interface a
  {
    public abstract void connect();
    
    public abstract void disconnect();
    
    public abstract boolean isConnected();
  }
  
  public static abstract interface b<T extends Api.a, O>
  {
    public abstract T a(Context paramContext, Looper paramLooper, jg paramjg, O paramO, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener);
    
    public abstract int getPriority();
  }
  
  public static final class c<C extends Api.a> {}
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.api.Api
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */