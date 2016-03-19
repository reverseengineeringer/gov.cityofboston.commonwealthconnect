package retrofit;

import rx.Subscriber;

class RxSupport$2
  implements Runnable
{
  RxSupport$2(RxSupport paramRxSupport, Subscriber paramSubscriber, RxSupport.Invoker paramInvoker, RequestInterceptorTape paramRequestInterceptorTape) {}
  
  public void run()
  {
    try
    {
      if (val$subscriber.isUnsubscribed()) {
        return;
      }
      ResponseWrapper localResponseWrapper = val$invoker.invoke(val$interceptorTape);
      val$subscriber.onNext(responseBody);
      val$subscriber.onCompleted();
      return;
    }
    catch (RetrofitError localRetrofitError)
    {
      val$subscriber.onError(RxSupport.access$300(this$0).handleError(localRetrofitError));
    }
  }
}

/* Location:
 * Qualified Name:     retrofit.RxSupport.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */