package com.google.android.gms.common.api;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.internal.jx;

public final class d<L>
{
  private final d<L>.a Kt;
  private volatile L mListener;
  
  d(Looper paramLooper, L paramL)
  {
    Kt = new a(paramLooper);
    mListener = jx.b(paramL, "Listener must not be null");
  }
  
  public void a(b<? super L> paramb)
  {
    jx.b(paramb, "Notifier must not be null");
    paramb = Kt.obtainMessage(1, paramb);
    Kt.sendMessage(paramb);
  }
  
  void b(b<? super L> paramb)
  {
    Object localObject = mListener;
    if (localObject == null)
    {
      paramb.gG();
      return;
    }
    try
    {
      paramb.c(localObject);
      return;
    }
    catch (Exception localException)
    {
      Log.w("ListenerHolder", "Notifying listener failed", localException);
      paramb.gG();
    }
  }
  
  public void clear()
  {
    mListener = null;
  }
  
  private final class a
    extends Handler
  {
    public a(Looper paramLooper)
    {
      super();
    }
    
    public void handleMessage(Message paramMessage)
    {
      boolean bool = true;
      if (what == 1) {}
      for (;;)
      {
        jx.L(bool);
        b((d.b)obj);
        return;
        bool = false;
      }
    }
  }
  
  public static abstract interface b<L>
  {
    public abstract void c(L paramL);
    
    public abstract void gG();
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.api.d
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */