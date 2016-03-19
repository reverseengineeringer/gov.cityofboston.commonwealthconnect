package com.android.volley;

import java.util.concurrent.BlockingQueue;

class CacheDispatcher$1
  implements Runnable
{
  CacheDispatcher$1(CacheDispatcher paramCacheDispatcher, Request paramRequest) {}
  
  public void run()
  {
    try
    {
      CacheDispatcher.access$000(this$0).put(val$request);
      return;
    }
    catch (InterruptedException localInterruptedException) {}
  }
}

/* Location:
 * Qualified Name:     com.android.volley.CacheDispatcher.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */