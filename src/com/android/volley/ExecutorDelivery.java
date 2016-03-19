package com.android.volley;

import android.os.Handler;
import java.util.concurrent.Executor;

public class ExecutorDelivery
  implements ResponseDelivery
{
  private final Executor mResponsePoster;
  
  public ExecutorDelivery(final Handler paramHandler)
  {
    mResponsePoster = new Executor()
    {
      public void execute(Runnable paramAnonymousRunnable)
      {
        paramHandler.post(paramAnonymousRunnable);
      }
    };
  }
  
  public ExecutorDelivery(Executor paramExecutor)
  {
    mResponsePoster = paramExecutor;
  }
  
  public void postError(Request<?> paramRequest, VolleyError paramVolleyError)
  {
    paramRequest.addMarker("post-error");
    paramVolleyError = Response.error(paramVolleyError);
    mResponsePoster.execute(new ResponseDeliveryRunnable(paramRequest, paramVolleyError, null));
  }
  
  public void postResponse(Request<?> paramRequest, Response<?> paramResponse)
  {
    postResponse(paramRequest, paramResponse, null);
  }
  
  public void postResponse(Request<?> paramRequest, Response<?> paramResponse, Runnable paramRunnable)
  {
    paramRequest.markDelivered();
    paramRequest.addMarker("post-response");
    mResponsePoster.execute(new ResponseDeliveryRunnable(paramRequest, paramResponse, paramRunnable));
  }
  
  private class ResponseDeliveryRunnable
    implements Runnable
  {
    private final Request mRequest;
    private final Response mResponse;
    private final Runnable mRunnable;
    
    public ResponseDeliveryRunnable(Request paramRequest, Response paramResponse, Runnable paramRunnable)
    {
      mRequest = paramRequest;
      mResponse = paramResponse;
      mRunnable = paramRunnable;
    }
    
    public void run()
    {
      if (mRequest.isCanceled()) {
        mRequest.finish("canceled-at-delivery");
      }
      label97:
      label107:
      for (;;)
      {
        return;
        if (mResponse.isSuccess())
        {
          mRequest.deliverResponse(mResponse.result);
          if (!mResponse.intermediate) {
            break label97;
          }
          mRequest.addMarker("intermediate-response");
        }
        for (;;)
        {
          if (mRunnable == null) {
            break label107;
          }
          mRunnable.run();
          return;
          mRequest.deliverError(mResponse.error);
          break;
          mRequest.finish("done");
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.android.volley.ExecutorDelivery
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */