package retrofit;

import java.util.concurrent.Executor;

abstract class CallbackRunnable<T>
  implements Runnable
{
  private final Callback<T> callback;
  private final Executor callbackExecutor;
  private final ErrorHandler errorHandler;
  
  CallbackRunnable(Callback<T> paramCallback, Executor paramExecutor, ErrorHandler paramErrorHandler)
  {
    callback = paramCallback;
    callbackExecutor = paramExecutor;
    errorHandler = paramErrorHandler;
  }
  
  public abstract ResponseWrapper obtainResponse();
  
  public final void run()
  {
    Throwable localThrowable;
    try
    {
      final ResponseWrapper localResponseWrapper = obtainResponse();
      callbackExecutor.execute(new Runnable()
      {
        public void run()
        {
          callback.success(localResponseWrapperresponseBody, localResponseWrapperresponse);
        }
      });
      return;
    }
    catch (RetrofitError localRetrofitError1)
    {
      localThrowable = errorHandler.handleError(localRetrofitError1);
      if (localThrowable != localRetrofitError1) {}
    }
    for (;;)
    {
      callbackExecutor.execute(new Runnable()
      {
        public void run()
        {
          callback.failure(localRetrofitError1);
        }
      });
      return;
      RetrofitError localRetrofitError2 = RetrofitError.unexpectedError(localRetrofitError1.getUrl(), localThrowable);
    }
  }
}

/* Location:
 * Qualified Name:     retrofit.CallbackRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */