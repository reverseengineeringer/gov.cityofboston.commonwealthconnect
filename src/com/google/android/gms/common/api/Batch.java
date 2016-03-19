package com.google.android.gms.common.api;

import android.os.Looper;
import java.util.ArrayList;
import java.util.List;

public final class Batch
  extends BaseImplementation.AbstractPendingResult<BatchResult>
{
  private boolean JA;
  private boolean JB;
  private final PendingResult<?>[] JC;
  private int Jz;
  private final Object mH = new Object();
  
  private Batch(List<PendingResult<?>> paramList, Looper paramLooper)
  {
    super(new BaseImplementation.CallbackHandler(paramLooper));
    Jz = paramList.size();
    JC = new PendingResult[Jz];
    int i = 0;
    while (i < paramList.size())
    {
      paramLooper = (PendingResult)paramList.get(i);
      JC[i] = paramLooper;
      paramLooper.a(new PendingResult.a()
      {
        public void m(Status paramAnonymousStatus)
        {
          for (;;)
          {
            synchronized (Batch.a(Batch.this))
            {
              if (isCanceled()) {
                return;
              }
              if (paramAnonymousStatus.isCanceled())
              {
                Batch.a(Batch.this, true);
                Batch.b(Batch.this);
                if (Batch.c(Batch.this) == 0)
                {
                  if (!Batch.d(Batch.this)) {
                    break;
                  }
                  Batch.e(Batch.this);
                }
                return;
              }
            }
            if (!paramAnonymousStatus.isSuccess()) {
              Batch.b(Batch.this, true);
            }
          }
          if (Batch.f(Batch.this)) {}
          for (paramAnonymousStatus = new Status(13);; paramAnonymousStatus = Status.Kw)
          {
            b(new BatchResult(paramAnonymousStatus, Batch.g(Batch.this)));
            break;
          }
        }
      });
      i += 1;
    }
  }
  
  public void cancel()
  {
    super.cancel();
    PendingResult[] arrayOfPendingResult = JC;
    int j = arrayOfPendingResult.length;
    int i = 0;
    while (i < j)
    {
      arrayOfPendingResult[i].cancel();
      i += 1;
    }
  }
  
  public BatchResult createFailedResult(Status paramStatus)
  {
    return new BatchResult(paramStatus, JC);
  }
  
  public static final class Builder
  {
    private List<PendingResult<?>> JE = new ArrayList();
    private Looper JF;
    
    public Builder(GoogleApiClient paramGoogleApiClient)
    {
      JF = paramGoogleApiClient.getLooper();
    }
    
    public <R extends Result> BatchResultToken<R> add(PendingResult<R> paramPendingResult)
    {
      BatchResultToken localBatchResultToken = new BatchResultToken(JE.size());
      JE.add(paramPendingResult);
      return localBatchResultToken;
    }
    
    public Batch build()
    {
      return new Batch(JE, JF, null);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.api.Batch
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */