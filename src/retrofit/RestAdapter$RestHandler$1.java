package retrofit;

class RestAdapter$RestHandler$1
  implements RxSupport.Invoker
{
  RestAdapter$RestHandler$1(RestAdapter.RestHandler paramRestHandler, RestMethodInfo paramRestMethodInfo, Object[] paramArrayOfObject) {}
  
  public ResponseWrapper invoke(RequestInterceptor paramRequestInterceptor)
  {
    return (ResponseWrapper)RestAdapter.RestHandler.access$100(this$1, paramRequestInterceptor, val$methodInfo, val$args);
  }
}

/* Location:
 * Qualified Name:     retrofit.RestAdapter.RestHandler.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */