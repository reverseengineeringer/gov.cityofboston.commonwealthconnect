package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.Api.a;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.data.DataHolder;
import java.util.ArrayList;

public abstract class jl<T extends IInterface>
  implements Api.a, jm.b
{
  public static final String[] MP = { "service_esmobile", "service_googleme" };
  private final Looper JF;
  private final jm JS;
  private T MJ;
  private final ArrayList<jl<T>.b<?>> MK = new ArrayList();
  private jl<T>.f ML;
  private int MM = 1;
  private final String[] MN;
  boolean MO = false;
  private final Context mContext;
  private final Object mH = new Object();
  final Handler mHandler;
  
  protected jl(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String... paramVarArgs)
  {
    mContext = ((Context)jx.i(paramContext));
    JF = ((Looper)jx.b(paramLooper, "Looper must not be null"));
    JS = new jm(paramContext, paramLooper, this);
    mHandler = new a(paramLooper);
    c(paramVarArgs);
    MN = paramVarArgs;
    registerConnectionCallbacks((GoogleApiClient.ConnectionCallbacks)jx.i(paramConnectionCallbacks));
    registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener)jx.i(paramOnConnectionFailedListener));
  }
  
  @Deprecated
  protected jl(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String... paramVarArgs)
  {
    this(paramContext, paramContext.getMainLooper(), new c(paramConnectionCallbacks), new g(paramOnConnectionFailedListener), paramVarArgs);
  }
  
  private void a(int paramInt, T paramT)
  {
    boolean bool = true;
    int i;
    int j;
    if (paramInt == 3)
    {
      i = 1;
      if (paramT == null) {
        break label62;
      }
      j = 1;
      label17:
      if (i != j) {
        break label68;
      }
    }
    for (;;)
    {
      jx.L(bool);
      synchronized (mH)
      {
        MM = paramInt;
        MJ = paramT;
        return;
      }
      i = 0;
      break;
      label62:
      j = 0;
      break label17;
      label68:
      bool = false;
    }
  }
  
  private boolean a(int paramInt1, int paramInt2, T paramT)
  {
    synchronized (mH)
    {
      if (MM != paramInt1) {
        return false;
      }
      a(paramInt2, paramT);
      return true;
    }
  }
  
  protected final void N(IBinder paramIBinder)
  {
    try
    {
      a(jt.a.Q(paramIBinder), new e(this));
      return;
    }
    catch (DeadObjectException paramIBinder)
    {
      Log.w("GmsClient", "service died");
      aD(1);
      return;
    }
    catch (RemoteException paramIBinder)
    {
      Log.w("GmsClient", "Remote exception occurred", paramIBinder);
    }
  }
  
  protected void a(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    mHandler.sendMessage(mHandler.obtainMessage(1, new h(paramInt, paramIBinder, paramBundle)));
  }
  
  @Deprecated
  public final void a(jl<T>.b<?> paramjl)
  {
    synchronized (MK)
    {
      MK.add(paramjl);
      mHandler.sendMessage(mHandler.obtainMessage(2, paramjl));
      return;
    }
  }
  
  protected abstract void a(jt paramjt, e parame)
    throws RemoteException;
  
  public void aD(int paramInt)
  {
    mHandler.sendMessage(mHandler.obtainMessage(4, Integer.valueOf(paramInt)));
  }
  
  protected abstract String bK();
  
  protected abstract String bL();
  
  protected void c(String... paramVarArgs) {}
  
  public void connect()
  {
    MO = true;
    a(2, null);
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(mContext);
    if (i != 0)
    {
      a(1, null);
      mHandler.sendMessage(mHandler.obtainMessage(3, Integer.valueOf(i)));
    }
    do
    {
      return;
      if (ML != null)
      {
        Log.e("GmsClient", "Calling connect() while still connected, missing disconnect() for " + bK());
        jn.J(mContext).b(bK(), ML);
      }
      ML = new f();
    } while (jn.J(mContext).a(bK(), ML));
    Log.e("GmsClient", "unable to connect to service: " + bK());
    mHandler.sendMessage(mHandler.obtainMessage(3, Integer.valueOf(9)));
  }
  
  protected final void dS()
  {
    if (!isConnected()) {
      throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
    }
  }
  
  public void disconnect()
  {
    MO = false;
    synchronized (MK)
    {
      int j = MK.size();
      int i = 0;
      while (i < j)
      {
        ((b)MK.get(i)).hz();
        i += 1;
      }
      MK.clear();
      a(1, null);
      if (ML != null)
      {
        jn.J(mContext).b(bK(), ML);
        ML = null;
      }
      return;
    }
  }
  
  public Bundle fX()
  {
    return null;
  }
  
  public boolean gN()
  {
    return MO;
  }
  
  public final Context getContext()
  {
    return mContext;
  }
  
  public final Looper getLooper()
  {
    return JF;
  }
  
  public final String[] hv()
  {
    return MN;
  }
  
  public final T hw()
    throws DeadObjectException
  {
    synchronized (mH)
    {
      if (MM == 4) {
        throw new DeadObjectException();
      }
    }
    dS();
    if (MJ != null) {}
    for (boolean bool = true;; bool = false)
    {
      jx.a(bool, "Client is connected but service is null");
      IInterface localIInterface = MJ;
      return localIInterface;
    }
  }
  
  public boolean isConnected()
  {
    for (;;)
    {
      synchronized (mH)
      {
        if (MM == 3)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public boolean isConnecting()
  {
    for (;;)
    {
      synchronized (mH)
      {
        if (MM == 2)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  @Deprecated
  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return JS.isConnectionCallbacksRegistered(new c(paramConnectionCallbacks));
  }
  
  @Deprecated
  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return JS.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }
  
  protected abstract T l(IBinder paramIBinder);
  
  @Deprecated
  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    JS.registerConnectionCallbacks(new c(paramConnectionCallbacks));
  }
  
  public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    JS.registerConnectionCallbacks(paramConnectionCallbacks);
  }
  
  @Deprecated
  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    JS.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    JS.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  @Deprecated
  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    JS.unregisterConnectionCallbacks(new c(paramConnectionCallbacks));
  }
  
  @Deprecated
  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    JS.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  final class a
    extends Handler
  {
    public a(Looper paramLooper)
    {
      super();
    }
    
    public void handleMessage(Message paramMessage)
    {
      if ((what == 1) && (!isConnecting()))
      {
        paramMessage = (jl.b)obj;
        paramMessage.hx();
        paramMessage.unregister();
        return;
      }
      if (what == 3)
      {
        jl.a(jl.this).b(new ConnectionResult(((Integer)obj).intValue(), null));
        return;
      }
      if (what == 4)
      {
        jl.a(jl.this, 4, null);
        jl.a(jl.this).aE(((Integer)obj).intValue());
        jl.a(jl.this, 4, 1, null);
        return;
      }
      if ((what == 2) && (!isConnected()))
      {
        paramMessage = (jl.b)obj;
        paramMessage.hx();
        paramMessage.unregister();
        return;
      }
      if ((what == 2) || (what == 1))
      {
        ((jl.b)obj).hy();
        return;
      }
      Log.wtf("GmsClient", "Don't know how to handle this message.");
    }
  }
  
  protected abstract class b<TListener>
  {
    private boolean MR;
    private TListener mListener;
    
    public b()
    {
      Object localObject;
      mListener = localObject;
      MR = false;
    }
    
    protected abstract void g(TListener paramTListener);
    
    protected abstract void hx();
    
    /* Error */
    public void hy()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 24	com/google/android/gms/internal/jl$b:mListener	Ljava/lang/Object;
      //   6: astore_1
      //   7: aload_0
      //   8: getfield 26	com/google/android/gms/internal/jl$b:MR	Z
      //   11: ifeq +33 -> 44
      //   14: ldc 37
      //   16: new 39	java/lang/StringBuilder
      //   19: dup
      //   20: invokespecial 40	java/lang/StringBuilder:<init>	()V
      //   23: ldc 42
      //   25: invokevirtual 46	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   28: aload_0
      //   29: invokevirtual 49	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   32: ldc 51
      //   34: invokevirtual 46	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   37: invokevirtual 55	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   40: invokestatic 61	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
      //   43: pop
      //   44: aload_0
      //   45: monitorexit
      //   46: aload_1
      //   47: ifnull +34 -> 81
      //   50: aload_0
      //   51: aload_1
      //   52: invokevirtual 63	com/google/android/gms/internal/jl$b:g	(Ljava/lang/Object;)V
      //   55: aload_0
      //   56: monitorenter
      //   57: aload_0
      //   58: iconst_1
      //   59: putfield 26	com/google/android/gms/internal/jl$b:MR	Z
      //   62: aload_0
      //   63: monitorexit
      //   64: aload_0
      //   65: invokevirtual 66	com/google/android/gms/internal/jl$b:unregister	()V
      //   68: return
      //   69: astore_1
      //   70: aload_0
      //   71: monitorexit
      //   72: aload_1
      //   73: athrow
      //   74: astore_1
      //   75: aload_0
      //   76: invokevirtual 68	com/google/android/gms/internal/jl$b:hx	()V
      //   79: aload_1
      //   80: athrow
      //   81: aload_0
      //   82: invokevirtual 68	com/google/android/gms/internal/jl$b:hx	()V
      //   85: goto -30 -> 55
      //   88: astore_1
      //   89: aload_0
      //   90: monitorexit
      //   91: aload_1
      //   92: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	93	0	this	b
      //   6	46	1	localObject1	Object
      //   69	4	1	localObject2	Object
      //   74	6	1	localRuntimeException	RuntimeException
      //   88	4	1	localObject3	Object
      // Exception table:
      //   from	to	target	type
      //   2	44	69	finally
      //   44	46	69	finally
      //   70	72	69	finally
      //   50	55	74	java/lang/RuntimeException
      //   57	64	88	finally
      //   89	91	88	finally
    }
    
    public void hz()
    {
      try
      {
        mListener = null;
        return;
      }
      finally {}
    }
    
    public void unregister()
    {
      hz();
      synchronized (jl.b(jl.this))
      {
        jl.b(jl.this).remove(this);
        return;
      }
    }
  }
  
  public static final class c
    implements GoogleApiClient.ConnectionCallbacks
  {
    private final GooglePlayServicesClient.ConnectionCallbacks MS;
    
    public c(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
    {
      MS = paramConnectionCallbacks;
    }
    
    public boolean equals(Object paramObject)
    {
      if ((paramObject instanceof c)) {
        return MS.equals(MS);
      }
      return MS.equals(paramObject);
    }
    
    public void onConnected(Bundle paramBundle)
    {
      MS.onConnected(paramBundle);
    }
    
    public void onConnectionSuspended(int paramInt)
    {
      MS.onDisconnected();
    }
  }
  
  public abstract class d<TListener>
    extends jl<T>.b<TListener>
  {
    private final DataHolder JG;
    
    public d(DataHolder paramDataHolder)
    {
      super(paramDataHolder);
      DataHolder localDataHolder;
      JG = localDataHolder;
    }
    
    protected abstract void b(TListener paramTListener, DataHolder paramDataHolder);
    
    protected final void g(TListener paramTListener)
    {
      b(paramTListener, JG);
    }
    
    protected void hx()
    {
      if (JG != null) {
        JG.close();
      }
    }
  }
  
  public static final class e
    extends js.a
  {
    private jl MT;
    
    public e(jl paramjl)
    {
      MT = paramjl;
    }
    
    public void b(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      jx.b("onPostInitComplete can be called only once per call to getServiceFromBroker", MT);
      MT.a(paramInt, paramIBinder, paramBundle);
      MT = null;
    }
  }
  
  public final class f
    implements ServiceConnection
  {
    public f() {}
    
    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      N(paramIBinder);
    }
    
    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      mHandler.sendMessage(mHandler.obtainMessage(4, Integer.valueOf(1)));
    }
  }
  
  public static final class g
    implements GoogleApiClient.OnConnectionFailedListener
  {
    private final GooglePlayServicesClient.OnConnectionFailedListener MU;
    
    public g(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      MU = paramOnConnectionFailedListener;
    }
    
    public boolean equals(Object paramObject)
    {
      if ((paramObject instanceof g)) {
        return MU.equals(MU);
      }
      return MU.equals(paramObject);
    }
    
    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      MU.onConnectionFailed(paramConnectionResult);
    }
  }
  
  protected final class h
    extends jl<T>.b<Boolean>
  {
    public final Bundle MV;
    public final IBinder MW;
    public final int statusCode;
    
    public h(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      super(Boolean.valueOf(true));
      statusCode = paramInt;
      MW = paramIBinder;
      MV = paramBundle;
    }
    
    protected void b(Boolean paramBoolean)
    {
      if (paramBoolean == null)
      {
        jl.a(jl.this, 1, null);
        return;
      }
      switch (statusCode)
      {
      default: 
        if (MV == null) {
          break;
        }
      }
      for (paramBoolean = (PendingIntent)MV.getParcelable("pendingIntent");; paramBoolean = null)
      {
        if (jl.c(jl.this) != null)
        {
          jn.J(jl.d(jl.this)).b(bK(), jl.c(jl.this));
          jl.a(jl.this, null);
        }
        jl.a(jl.this, 1, null);
        jl.a(jl.this).b(new ConnectionResult(statusCode, paramBoolean));
        return;
        try
        {
          paramBoolean = MW.getInterfaceDescriptor();
          if (bL().equals(paramBoolean))
          {
            paramBoolean = l(MW);
            if (paramBoolean != null)
            {
              jl.a(jl.this, 3, paramBoolean);
              jl.a(jl.this).dU();
              return;
            }
          }
        }
        catch (RemoteException paramBoolean)
        {
          jn.J(jl.d(jl.this)).b(bK(), jl.c(jl.this));
          jl.a(jl.this, null);
          jl.a(jl.this, 1, null);
          jl.a(jl.this).b(new ConnectionResult(8, null));
          return;
        }
        jl.a(jl.this, 1, null);
        throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
      }
    }
    
    protected void hx() {}
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.jl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */