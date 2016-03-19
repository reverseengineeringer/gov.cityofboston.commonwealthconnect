package com.squareup.okhttp.internal;

import java.io.IOException;

class DiskLruCache$1
  implements Runnable
{
  DiskLruCache$1(DiskLruCache paramDiskLruCache) {}
  
  public void run()
  {
    synchronized (this$0)
    {
      if (DiskLruCache.access$000(this$0) == null) {
        return;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.DiskLruCache.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */