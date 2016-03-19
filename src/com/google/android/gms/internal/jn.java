package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.IBinder;
import android.os.Message;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public final class jn
  implements Handler.Callback
{
  private static final Object Nd = new Object();
  private static jn Ne;
  private final HashMap<String, a> Nf = new HashMap();
  private final Handler mHandler = new Handler(paramContext.getMainLooper(), this);
  private final Context mO;
  
  private jn(Context paramContext)
  {
    mO = paramContext.getApplicationContext();
  }
  
  public static jn J(Context paramContext)
  {
    synchronized (Nd)
    {
      if (Ne == null) {
        Ne = new jn(paramContext.getApplicationContext());
      }
      return Ne;
    }
  }
  
  public boolean a(String paramString, jl<?>.f paramjl)
  {
    for (;;)
    {
      a locala;
      synchronized (Nf)
      {
        locala = (a)Nf.get(paramString);
        if (locala == null)
        {
          locala = new a(paramString);
          locala.a(paramjl);
          locala.hA();
          Nf.put(paramString, locala);
          paramString = locala;
          boolean bool = paramString.isBound();
          return bool;
        }
        mHandler.removeMessages(0, locala);
        if (locala.c(paramjl)) {
          throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  startServiceAction=" + paramString);
        }
      }
      locala.a(paramjl);
      switch (locala.getState())
      {
      case 1: 
        paramjl.onServiceConnected(locala.getComponentName(), locala.getBinder());
        paramString = locala;
        break;
      case 2: 
        locala.hA();
        paramString = locala;
        break;
      default: 
        paramString = locala;
      }
    }
  }
  
  public void b(String paramString, jl<?>.f paramjl)
  {
    a locala;
    synchronized (Nf)
    {
      locala = (a)Nf.get(paramString);
      if (locala == null) {
        throw new IllegalStateException("Nonexistent connection status for service action: " + paramString);
      }
    }
    if (!locala.c(paramjl)) {
      throw new IllegalStateException("Trying to unbind a GmsServiceConnection  that was not bound before.  startServiceAction=" + paramString);
    }
    locala.b(paramjl);
    if (locala.hD())
    {
      paramString = mHandler.obtainMessage(0, locala);
      mHandler.sendMessageDelayed(paramString, 5000L);
    }
  }
  
  public boolean handleMessage(Message arg1)
  {
    switch (what)
    {
    default: 
      return false;
    }
    a locala = (a)obj;
    synchronized (Nf)
    {
      if (locala.hD())
      {
        locala.hB();
        Nf.remove(locala.hC());
      }
      return true;
    }
  }
  
  final class a
  {
    private final String Ng;
    private final a Nh;
    private final HashSet<jl<?>.f> Ni;
    private boolean Nj;
    private IBinder Nk;
    private ComponentName Nl;
    private int mState;
    
    public a(String paramString)
    {
      Ng = paramString;
      Nh = new a();
      Ni = new HashSet();
      mState = 2;
    }
    
    public void a(jl<?>.f paramjl)
    {
      Ni.add(paramjl);
    }
    
    public void b(jl<?>.f paramjl)
    {
      Ni.remove(paramjl);
    }
    
    public boolean c(jl<?>.f paramjl)
    {
      return Ni.contains(paramjl);
    }
    
    public IBinder getBinder()
    {
      return Nk;
    }
    
    public ComponentName getComponentName()
    {
      return Nl;
    }
    
    public int getState()
    {
      return mState;
    }
    
    public void hA()
    {
      Intent localIntent = new Intent(Ng).setPackage("com.google.android.gms");
      Nj = jn.b(jn.this).bindService(localIntent, Nh, 129);
      if (Nj)
      {
        mState = 3;
        return;
      }
      jn.b(jn.this).unbindService(Nh);
    }
    
    public void hB()
    {
      jn.b(jn.this).unbindService(Nh);
      Nj = false;
      mState = 2;
    }
    
    public String hC()
    {
      return Ng;
    }
    
    public boolean hD()
    {
      return Ni.isEmpty();
    }
    
    public boolean isBound()
    {
      return Nj;
    }
    
    public class a
      implements ServiceConnection
    {
      public a() {}
      
      public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
      {
        synchronized (jn.a(jn.this))
        {
          jn.a.a(jn.a.this, paramIBinder);
          jn.a.a(jn.a.this, paramComponentName);
          Iterator localIterator = jn.a.a(jn.a.this).iterator();
          if (localIterator.hasNext()) {
            ((jl.f)localIterator.next()).onServiceConnected(paramComponentName, paramIBinder);
          }
        }
        jn.a.a(jn.a.this, 1);
      }
      
      public void onServiceDisconnected(ComponentName paramComponentName)
      {
        synchronized (jn.a(jn.this))
        {
          jn.a.a(jn.a.this, null);
          jn.a.a(jn.a.this, paramComponentName);
          Iterator localIterator = jn.a.a(jn.a.this).iterator();
          if (localIterator.hasNext()) {
            ((jl.f)localIterator.next()).onServiceDisconnected(paramComponentName);
          }
        }
        jn.a.a(jn.a.this, 2);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.jn
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */