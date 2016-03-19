package com.android.volley;

class ExecutorDelivery$ResponseDeliveryRunnable
  implements Runnable
{
  private final Request mRequest;
  private final Response mResponse;
  private final Runnable mRunnable;
  
  public ExecutorDelivery$ResponseDeliveryRunnable(ExecutorDelivery paramExecutorDelivery, Request paramRequest, Response paramResponse, Runnable paramRunnable)
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

/* Location:
 * Qualified Name:     com.android.volley.ExecutorDelivery.ResponseDeliveryRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */