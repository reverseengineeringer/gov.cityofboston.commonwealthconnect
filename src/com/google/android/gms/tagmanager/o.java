package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.BaseImplementation.AbstractPendingResult;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.c.f;
import com.google.android.gms.internal.c.j;
import com.google.android.gms.internal.ld;
import com.google.android.gms.internal.lf;
import com.google.android.gms.internal.pu.a;

class o
  extends BaseImplementation.AbstractPendingResult<ContainerHolder>
{
  private final Looper JF;
  private final d aqB;
  private final cg aqC;
  private final int aqD;
  private f aqE;
  private volatile n aqF;
  private volatile boolean aqG;
  private c.j aqH;
  private String aqI;
  private e aqJ;
  private a aqK;
  private final String aqm;
  private long aqr;
  private final TagManager aqy;
  private final Context mContext;
  private final ld wb;
  
  o(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, f paramf, e parame, ld paramld, cg paramcg) {}
  
  public o(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, r paramr)
  {
    this(paramContext, paramTagManager, paramLooper, paramString, paramInt, new cq(paramContext, paramString), new cp(paramContext, paramString, paramr), lf.jdMethod_if(), new bf(30, 900000L, 5000L, "refreshing", lf.jdMethod_if()));
  }
  
  private void V(final boolean paramBoolean)
  {
    aqE.a(new b(null));
    aqJ.a(new c(null));
    cr.c localc = aqE.fH(aqD);
    if (localc != null) {
      aqF = new n(aqy, JF, new Container(mContext, aqy.getDataLayer(), aqm, 0L, localc), aqB);
    }
    aqK = new a()
    {
      public boolean b(Container paramAnonymousContainer)
      {
        if (paramBoolean) {
          if (paramAnonymousContainer.getLastRefreshTime() + 43200000L < o.a(o.this).currentTimeMillis()) {}
        }
        while (!paramAnonymousContainer.isDefault())
        {
          return true;
          return false;
        }
        return false;
      }
    };
    if (pr())
    {
      aqJ.e(0L, "");
      return;
    }
    aqE.pt();
  }
  
  private void a(c.j paramj)
  {
    try
    {
      if (aqE != null)
      {
        pu.a locala = new pu.a();
        auB = aqr;
        gs = new c.f();
        auC = paramj;
        aqE.b(locala);
      }
      return;
    }
    finally
    {
      paramj = finally;
      throw paramj;
    }
  }
  
  private void a(c.j paramj, long paramLong, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (;;)
    {
      try
      {
        paramBoolean = aqG;
        if (paramBoolean) {
          return;
        }
        if ((isReady()) && (aqF == null)) {}
        aqH = paramj;
        aqr = paramLong;
        w(Math.max(0L, Math.min(43200000L, aqr + 43200000L - wb.currentTimeMillis())));
        paramj = new Container(mContext, aqy.getDataLayer(), aqm, paramLong, paramj);
        if (aqF == null)
        {
          aqF = new n(aqy, JF, paramj, aqB);
          if ((!isReady()) && (aqK.b(paramj))) {
            b(aqF);
          }
        }
        else
        {
          aqF.a(paramj);
        }
      }
      finally {}
    }
  }
  
  private boolean pr()
  {
    ce localce = ce.qa();
    return ((localce.qb() == ce.a.asr) || (localce.qb() == ce.a.ass)) && (aqm.equals(localce.getContainerId()));
  }
  
  /* Error */
  private void w(long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 83	com/google/android/gms/tagmanager/o:aqJ	Lcom/google/android/gms/tagmanager/o$e;
    //   6: ifnonnull +12 -> 18
    //   9: ldc_w 290
    //   12: invokestatic 295	com/google/android/gms/tagmanager/bh:W	(Ljava/lang/String;)V
    //   15: aload_0
    //   16: monitorexit
    //   17: return
    //   18: aload_0
    //   19: getfield 83	com/google/android/gms/tagmanager/o:aqJ	Lcom/google/android/gms/tagmanager/o$e;
    //   22: lload_1
    //   23: aload_0
    //   24: getfield 95	com/google/android/gms/tagmanager/o:aqH	Lcom/google/android/gms/internal/c$j;
    //   27: getfield 298	com/google/android/gms/internal/c$j:gt	Ljava/lang/String;
    //   30: invokeinterface 188 4 0
    //   35: goto -20 -> 15
    //   38: astore_3
    //   39: aload_0
    //   40: monitorexit
    //   41: aload_3
    //   42: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	43	0	this	o
    //   0	43	1	paramLong	long
    //   38	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	15	38	finally
    //   18	35	38	finally
  }
  
  protected ContainerHolder aD(Status paramStatus)
  {
    if (aqF != null) {
      return aqF;
    }
    if (paramStatus == Status.Kz) {
      bh.T("timer expired: setting result to failure");
    }
    return new n(paramStatus);
  }
  
  void ct(String paramString)
  {
    try
    {
      aqI = paramString;
      if (aqJ != null) {
        aqJ.cw(paramString);
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  String pl()
  {
    try
    {
      String str = aqI;
      return str;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void po()
  {
    Object localObject = aqE.fH(aqD);
    if (localObject != null)
    {
      localObject = new Container(mContext, aqy.getDataLayer(), aqm, 0L, (cr.c)localObject);
      b(new n(aqy, JF, (Container)localObject, new n.a()
      {
        public void ct(String paramAnonymousString)
        {
          o.this.ct(paramAnonymousString);
        }
        
        public String pl()
        {
          return o.this.pl();
        }
        
        public void pn()
        {
          bh.W("Refresh ignored: container loaded as default only.");
        }
      }));
    }
    for (;;)
    {
      aqJ = null;
      aqE = null;
      return;
      bh.T("Default was requested, but no default container was found");
      b(aD(new Status(10, "Default was requested, but no default container was found", null)));
    }
  }
  
  public void pp()
  {
    V(false);
  }
  
  public void pq()
  {
    V(true);
  }
  
  static abstract interface a
  {
    public abstract boolean b(Container paramContainer);
  }
  
  private class b
    implements bg<pu.a>
  {
    private b() {}
    
    public void a(pu.a parama)
    {
      c.j localj;
      if (auC != null) {
        localj = auC;
      }
      for (;;)
      {
        o.a(o.this, localj, auB, true);
        return;
        c.f localf = gs;
        localj = new c.j();
        gs = localf;
        gr = null;
        gt = version;
      }
    }
    
    public void a(bg.a parama)
    {
      if (!o.b(o.this)) {
        o.a(o.this, 0L);
      }
    }
    
    public void ps() {}
  }
  
  private class c
    implements bg<c.j>
  {
    private c() {}
    
    public void a(bg.a parama)
    {
      if (o.f(o.this) != null) {
        b(o.f(o.this));
      }
      for (;;)
      {
        o.a(o.this, 3600000L);
        return;
        b(aD(Status.Kz));
      }
    }
    
    public void b(c.j paramj)
    {
      synchronized (o.this)
      {
        if (gs == null)
        {
          if (cgs == null)
          {
            bh.T("Current resource is null; network resource is also null");
            o.a(o.this, 3600000L);
            return;
          }
          gs = cgs;
        }
        o.a(o.this, paramj, o.a(o.this).currentTimeMillis(), false);
        bh.V("setting refresh time to current time: " + o.d(o.this));
        if (!o.e(o.this)) {
          o.a(o.this, paramj);
        }
        return;
      }
    }
    
    public void ps() {}
  }
  
  private class d
    implements n.a
  {
    private d() {}
    
    public void ct(String paramString)
    {
      o.this.ct(paramString);
    }
    
    public String pl()
    {
      return o.this.pl();
    }
    
    public void pn()
    {
      if (o.g(o.this).fe()) {
        o.a(o.this, 0L);
      }
    }
  }
  
  static abstract interface e
    extends Releasable
  {
    public abstract void a(bg<c.j> parambg);
    
    public abstract void cw(String paramString);
    
    public abstract void e(long paramLong, String paramString);
  }
  
  static abstract interface f
    extends Releasable
  {
    public abstract void a(bg<pu.a> parambg);
    
    public abstract void b(pu.a parama);
    
    public abstract cr.c fH(int paramInt);
    
    public abstract void pt();
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.tagmanager.o
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */