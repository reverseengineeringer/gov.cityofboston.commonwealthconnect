package com.seeclickfix.ma.android.media;

import com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask;

public class ImageWorker$CacheAsyncTask
  extends MultiThreadAsyncTask<Object, Void, Void>
{
  protected ImageWorker$CacheAsyncTask(ImageWorker paramImageWorker) {}
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    switch (((Integer)paramVarArgs[0]).intValue())
    {
    }
    for (;;)
    {
      return null;
      this$0.clearCacheInternal();
      continue;
      this$0.initDiskCacheInternal();
      continue;
      this$0.flushCacheInternal();
      continue;
      this$0.closeCacheInternal();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageWorker.CacheAsyncTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */