package com.android.volley;

import android.os.Process;
import java.util.concurrent.BlockingQueue;

public class CacheDispatcher
  extends Thread
{
  private static final boolean DEBUG = VolleyLog.DEBUG;
  private final Cache mCache;
  private final BlockingQueue<Request<?>> mCacheQueue;
  private final ResponseDelivery mDelivery;
  private final BlockingQueue<Request<?>> mNetworkQueue;
  private volatile boolean mQuit = false;
  
  public CacheDispatcher(BlockingQueue<Request<?>> paramBlockingQueue1, BlockingQueue<Request<?>> paramBlockingQueue2, Cache paramCache, ResponseDelivery paramResponseDelivery)
  {
    mCacheQueue = paramBlockingQueue1;
    mNetworkQueue = paramBlockingQueue2;
    mCache = paramCache;
    mDelivery = paramResponseDelivery;
  }
  
  public void quit()
  {
    mQuit = true;
    interrupt();
  }
  
  public void run()
  {
    if (DEBUG) {
      VolleyLog.v("start new dispatcher", new Object[0]);
    }
    Process.setThreadPriority(10);
    mCache.initialize();
    for (;;)
    {
      try
      {
        Request localRequest = (Request)mCacheQueue.take();
        localRequest.addMarker("cache-queue-take");
        if (!localRequest.isCanceled()) {
          break label73;
        }
        localRequest.finish("cache-discard-canceled");
        continue;
        if (!mQuit) {
          continue;
        }
      }
      catch (InterruptedException localInterruptedException) {}
      return;
      label73:
      Cache.Entry localEntry = mCache.get(localInterruptedException.getCacheKey());
      if (localEntry == null)
      {
        localInterruptedException.addMarker("cache-miss");
        mNetworkQueue.put(localInterruptedException);
      }
      else if (localEntry.isExpired())
      {
        localInterruptedException.addMarker("cache-hit-expired");
        localInterruptedException.setCacheEntry(localEntry);
        mNetworkQueue.put(localInterruptedException);
      }
      else
      {
        localInterruptedException.addMarker("cache-hit");
        Response localResponse = localInterruptedException.parseNetworkResponse(new NetworkResponse(data, responseHeaders));
        localInterruptedException.addMarker("cache-hit-parsed");
        if (!localEntry.refreshNeeded())
        {
          mDelivery.postResponse(localInterruptedException, localResponse);
        }
        else
        {
          localInterruptedException.addMarker("cache-hit-refresh-needed");
          localInterruptedException.setCacheEntry(localEntry);
          intermediate = true;
          mDelivery.postResponse(localInterruptedException, localResponse, new Runnable()
          {
            public void run()
            {
              try
              {
                mNetworkQueue.put(localInterruptedException);
                return;
              }
              catch (InterruptedException localInterruptedException) {}
            }
          });
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.android.volley.CacheDispatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */