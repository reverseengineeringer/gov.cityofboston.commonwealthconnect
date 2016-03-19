package retrofit;

import java.util.concurrent.Executor;

class RestAdapter$RestHandler$2
  extends CallbackRunnable
{
  RestAdapter$RestHandler$2(RestAdapter.RestHandler paramRestHandler, Callback paramCallback, Executor paramExecutor, ErrorHandler paramErrorHandler, RequestInterceptorTape paramRequestInterceptorTape, RestMethodInfo paramRestMethodInfo, Object[] paramArrayOfObject)
  {
    super(paramCallback, paramExecutor, paramErrorHandler);
  }
  
  public ResponseWrapper obtainResponse()
  {
    return (ResponseWrapper)RestAdapter.RestHandler.access$100(this$1, val$interceptorTape, val$methodInfo, val$args);
  }
}

/* Location:
 * Qualified Name:     retrofit.RestAdapter.RestHandler.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */