package retrofit;

class CallbackRunnable$1
  implements Runnable
{
  CallbackRunnable$1(CallbackRunnable paramCallbackRunnable, ResponseWrapper paramResponseWrapper) {}
  
  public void run()
  {
    CallbackRunnable.access$000(this$0).success(val$wrapper.responseBody, val$wrapper.response);
  }
}

/* Location:
 * Qualified Name:     retrofit.CallbackRunnable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */