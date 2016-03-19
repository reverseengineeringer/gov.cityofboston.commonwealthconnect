package com.google.android.gms.common.api;

import android.os.DeadObjectException;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.internal.jr;
import com.google.android.gms.internal.jx;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class BaseImplementation
{
  static void a(Result paramResult)
  {
    if ((paramResult instanceof Releasable)) {}
    try
    {
      ((Releasable)paramResult).release();
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.w("GoogleApi", "Unable to release " + paramResult, localRuntimeException);
    }
  }
  
  public static abstract class AbstractPendingResult<R extends Result>
    implements BaseImplementation.b<R>, PendingResult<R>
  {
    private final Object Jp = new Object();
    private final ArrayList<PendingResult.a> Jq = new ArrayList();
    private ResultCallback<R> Jr;
    private volatile R Js;
    private volatile boolean Jt;
    private boolean Ju;
    private boolean Jv;
    private jr Jw;
    protected final BaseImplementation.CallbackHandler<R> mHandler;
    private final CountDownLatch mr = new CountDownLatch(1);
    
    protected AbstractPendingResult(Looper paramLooper)
    {
      mHandler = new BaseImplementation.CallbackHandler(paramLooper);
    }
    
    protected AbstractPendingResult(BaseImplementation.CallbackHandler<R> paramCallbackHandler)
    {
      mHandler = paramCallbackHandler;
    }
    
    private void c(R paramR)
    {
      Js = paramR;
      Jw = null;
      mr.countDown();
      paramR = Js.getStatus();
      if (Jr != null)
      {
        mHandler.removeTimeoutMessages();
        if (!Ju) {
          mHandler.sendResultCallback(Jr, gA());
        }
      }
      Iterator localIterator = Jq.iterator();
      while (localIterator.hasNext()) {
        ((PendingResult.a)localIterator.next()).m(paramR);
      }
      Jq.clear();
    }
    
    private R gA()
    {
      for (;;)
      {
        synchronized (Jp)
        {
          if (!Jt)
          {
            bool = true;
            jx.a(bool, "Result has already been consumed.");
            jx.a(isReady(), "Result is not ready.");
            Result localResult = Js;
            gB();
            return localResult;
          }
        }
        boolean bool = false;
      }
    }
    
    private void gC()
    {
      synchronized (Jp)
      {
        if (!isReady())
        {
          b(c(Status.Kx));
          Jv = true;
        }
        return;
      }
    }
    
    private void gD()
    {
      synchronized (Jp)
      {
        if (!isReady())
        {
          b(c(Status.Kz));
          Jv = true;
        }
        return;
      }
    }
    
    public final void a(PendingResult.a parama)
    {
      if (!Jt) {}
      for (boolean bool = true;; bool = false)
      {
        jx.a(bool, "Result has already been consumed.");
        synchronized (Jp)
        {
          if (isReady())
          {
            parama.m(Js.getStatus());
            return;
          }
          Jq.add(parama);
        }
      }
    }
    
    protected final void a(jr paramjr)
    {
      synchronized (Jp)
      {
        Jw = paramjr;
        return;
      }
    }
    
    public final R await()
    {
      boolean bool2 = true;
      boolean bool1;
      if (Looper.myLooper() != Looper.getMainLooper()) {
        bool1 = true;
      }
      for (;;)
      {
        jx.a(bool1, "await must not be called on the UI thread");
        if (!Jt)
        {
          bool1 = bool2;
          jx.a(bool1, "Result has already been consumed");
        }
        try
        {
          mr.await();
          jx.a(isReady(), "Result is not ready.");
          return gA();
          bool1 = false;
          continue;
          bool1 = false;
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;)
          {
            gC();
          }
        }
      }
    }
    
    public final R await(long paramLong, TimeUnit paramTimeUnit)
    {
      boolean bool2 = true;
      boolean bool1;
      if ((paramLong <= 0L) || (Looper.myLooper() != Looper.getMainLooper())) {
        bool1 = true;
      }
      for (;;)
      {
        jx.a(bool1, "await must not be called on the UI thread when time is greater than zero.");
        if (!Jt)
        {
          bool1 = bool2;
          jx.a(bool1, "Result has already been consumed.");
        }
        try
        {
          if (!mr.await(paramLong, paramTimeUnit)) {
            gD();
          }
          jx.a(isReady(), "Result is not ready.");
          return gA();
          bool1 = false;
          continue;
          bool1 = false;
        }
        catch (InterruptedException paramTimeUnit)
        {
          for (;;)
          {
            gC();
          }
        }
      }
    }
    
    public final void b(R paramR)
    {
      boolean bool2 = true;
      for (;;)
      {
        synchronized (Jp)
        {
          if ((Jv) || (Ju))
          {
            BaseImplementation.a(paramR);
            return;
          }
          if (!isReady())
          {
            bool1 = true;
            jx.a(bool1, "Results have already been set");
            if (Jt) {
              break label83;
            }
            bool1 = bool2;
            jx.a(bool1, "Result has already been consumed");
            c(paramR);
            return;
          }
        }
        boolean bool1 = false;
        continue;
        label83:
        bool1 = false;
      }
    }
    
    protected abstract R c(Status paramStatus);
    
    public void cancel()
    {
      synchronized (Jp)
      {
        if ((Ju) || (Jt)) {
          return;
        }
        jr localjr = Jw;
        if (localjr == null) {}
      }
      try
      {
        Jw.cancel();
        BaseImplementation.a(Js);
        Jr = null;
        Ju = true;
        c(c(Status.KA));
        return;
        localObject2 = finally;
        throw ((Throwable)localObject2);
      }
      catch (RemoteException localRemoteException)
      {
        for (;;) {}
      }
    }
    
    protected void gB()
    {
      Jt = true;
      Js = null;
      Jr = null;
    }
    
    public boolean isCanceled()
    {
      synchronized (Jp)
      {
        boolean bool = Ju;
        return bool;
      }
    }
    
    public final boolean isReady()
    {
      return mr.getCount() == 0L;
    }
    
    public final void setResultCallback(ResultCallback<R> paramResultCallback)
    {
      if (!Jt) {}
      for (boolean bool = true;; bool = false)
      {
        jx.a(bool, "Result has already been consumed.");
        for (;;)
        {
          synchronized (Jp)
          {
            if (isCanceled()) {
              return;
            }
            if (isReady())
            {
              mHandler.sendResultCallback(paramResultCallback, gA());
              return;
            }
          }
          Jr = paramResultCallback;
        }
      }
    }
    
    public final void setResultCallback(ResultCallback<R> paramResultCallback, long paramLong, TimeUnit paramTimeUnit)
    {
      boolean bool2 = true;
      if (!Jt)
      {
        bool1 = true;
        jx.a(bool1, "Result has already been consumed.");
        if (mHandler == null) {
          break label115;
        }
      }
      label115:
      for (boolean bool1 = bool2;; bool1 = false)
      {
        jx.a(bool1, "CallbackHandler has not been set before calling setResultCallback.");
        for (;;)
        {
          synchronized (Jp)
          {
            if (isCanceled()) {
              return;
            }
            if (isReady())
            {
              mHandler.sendResultCallback(paramResultCallback, gA());
              return;
            }
          }
          Jr = paramResultCallback;
          mHandler.sendTimeoutResultCallback(this, paramTimeUnit.toMillis(paramLong));
        }
        bool1 = false;
        break;
      }
    }
  }
  
  public static class CallbackHandler<R extends Result>
    extends Handler
  {
    public static final int CALLBACK_ON_COMPLETE = 1;
    public static final int CALLBACK_ON_TIMEOUT = 2;
    
    public CallbackHandler()
    {
      this(Looper.getMainLooper());
    }
    
    public CallbackHandler(Looper paramLooper)
    {
      super();
    }
    
    protected void deliverResultCallback(ResultCallback<R> paramResultCallback, R paramR)
    {
      try
      {
        paramResultCallback.onResult(paramR);
        return;
      }
      catch (RuntimeException paramResultCallback)
      {
        BaseImplementation.a(paramR);
        throw paramResultCallback;
      }
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
        Log.wtf("GoogleApi", "Don't know how to handle this message.");
        return;
      case 1: 
        paramMessage = (Pair)obj;
        deliverResultCallback((ResultCallback)first, (Result)second);
        return;
      }
      BaseImplementation.AbstractPendingResult.a((BaseImplementation.AbstractPendingResult)obj);
    }
    
    public void removeTimeoutMessages()
    {
      removeMessages(2);
    }
    
    public void sendResultCallback(ResultCallback<R> paramResultCallback, R paramR)
    {
      sendMessage(obtainMessage(1, new Pair(paramResultCallback, paramR)));
    }
    
    public void sendTimeoutResultCallback(BaseImplementation.AbstractPendingResult<R> paramAbstractPendingResult, long paramLong)
    {
      sendMessageDelayed(obtainMessage(2, paramAbstractPendingResult), paramLong);
    }
  }
  
  public static abstract class a<R extends Result, A extends Api.a>
    extends BaseImplementation.AbstractPendingResult<R>
    implements c.d<A>
  {
    private final Api.c<A> Jn;
    private final GoogleApiClient Jx;
    private c.b Jy;
    
    protected a(Api.c<A> paramc, GoogleApiClient paramGoogleApiClient)
    {
      super();
      Jn = ((Api.c)jx.i(paramc));
      Jx = paramGoogleApiClient;
    }
    
    private void a(RemoteException paramRemoteException)
    {
      l(new Status(8, paramRemoteException.getLocalizedMessage(), null));
    }
    
    protected abstract void a(A paramA)
      throws RemoteException;
    
    public void a(c.b paramb)
    {
      Jy = paramb;
    }
    
    public final void b(A paramA)
      throws DeadObjectException
    {
      try
      {
        a(paramA);
        return;
      }
      catch (DeadObjectException paramA)
      {
        a(paramA);
        throw paramA;
      }
      catch (RemoteException paramA)
      {
        a(paramA);
      }
    }
    
    protected void gB()
    {
      super.gB();
      if (Jy != null)
      {
        Jy.b(this);
        Jy = null;
      }
    }
    
    public final a gE()
    {
      jx.b(Jx, "GoogleApiClient was not set.");
      Jx.b(this);
      return this;
    }
    
    public int gF()
    {
      return 0;
    }
    
    public final Api.c<A> gz()
    {
      return Jn;
    }
    
    public final void l(Status paramStatus)
    {
      if (!paramStatus.isSuccess()) {}
      for (boolean bool = true;; bool = false)
      {
        jx.b(bool, "Failed result must not be success");
        b(c(paramStatus));
        return;
      }
    }
  }
  
  public static abstract interface b<R>
  {
    public abstract void b(R paramR);
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.api.BaseImplementation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */