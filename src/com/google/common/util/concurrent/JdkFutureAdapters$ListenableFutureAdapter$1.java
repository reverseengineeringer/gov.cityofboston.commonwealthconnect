package com.google.common.util.concurrent;

class JdkFutureAdapters$ListenableFutureAdapter$1
  implements Runnable
{
  JdkFutureAdapters$ListenableFutureAdapter$1(JdkFutureAdapters.ListenableFutureAdapter paramListenableFutureAdapter) {}
  
  public void run()
  {
    try
    {
      Uninterruptibles.getUninterruptibly(JdkFutureAdapters.ListenableFutureAdapter.access$000(this$0));
      JdkFutureAdapters.ListenableFutureAdapter.access$100(this$0).execute();
      return;
    }
    catch (Error localError)
    {
      throw localError;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.JdkFutureAdapters.ListenableFutureAdapter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */