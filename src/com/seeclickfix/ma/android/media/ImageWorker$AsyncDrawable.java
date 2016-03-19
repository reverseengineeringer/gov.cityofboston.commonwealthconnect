package com.seeclickfix.ma.android.media;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import java.lang.ref.WeakReference;

class ImageWorker$AsyncDrawable
  extends BitmapDrawable
{
  private final WeakReference<ImageWorker.BitmapWorkerTask> bitmapWorkerTaskReference;
  
  public ImageWorker$AsyncDrawable(Resources paramResources, Bitmap paramBitmap, ImageWorker.BitmapWorkerTask paramBitmapWorkerTask)
  {
    super(paramResources, paramBitmap);
    bitmapWorkerTaskReference = new WeakReference(paramBitmapWorkerTask);
  }
  
  public ImageWorker.BitmapWorkerTask getBitmapWorkerTask()
  {
    return (ImageWorker.BitmapWorkerTask)bitmapWorkerTaskReference.get();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageWorker.AsyncDrawable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */