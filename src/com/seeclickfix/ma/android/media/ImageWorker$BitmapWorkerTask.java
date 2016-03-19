package com.seeclickfix.ma.android.media;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import com.seeclickfix.ma.android.androidsdk.APIUtil;
import com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask;
import java.lang.ref.WeakReference;

class ImageWorker$BitmapWorkerTask
  extends MultiThreadAsyncTask<Object, Void, BitmapDrawable>
{
  private WeakReference<Button> btnReference;
  private Object data;
  private WeakReference<ImageView> imageViewReference;
  
  public ImageWorker$BitmapWorkerTask(ImageWorker paramImageWorker, Button paramButton)
  {
    btnReference = new WeakReference(paramButton);
  }
  
  public ImageWorker$BitmapWorkerTask(ImageWorker paramImageWorker, ImageView paramImageView)
  {
    imageViewReference = new WeakReference(paramImageView);
  }
  
  private Button getAttachedButton()
  {
    Button localButton = (Button)btnReference.get();
    if (this == ImageWorker.access$600(localButton)) {
      return localButton;
    }
    return null;
  }
  
  private ImageView getAttachedImageView()
  {
    ImageView localImageView = (ImageView)imageViewReference.get();
    if (this == ImageWorker.access$500(localImageView)) {
      return localImageView;
    }
    return null;
  }
  
  protected BitmapDrawable doInBackground(Object... paramVarArgs)
  {
    data = paramVarArgs[0];
    String str = String.valueOf(data);
    Object localObject2 = null;
    Object localObject3 = null;
    for (;;)
    {
      synchronized (ImageWorker.access$100(this$0))
      {
        if (this$0.mPauseWork)
        {
          boolean bool = isCancelled();
          if (!bool)
          {
            try
            {
              ImageWorker.access$100(this$0).wait();
            }
            catch (InterruptedException localInterruptedException) {}
            continue;
          }
        }
        ??? = localObject2;
        if (ImageWorker.access$200(this$0) != null)
        {
          ??? = localObject2;
          if (!isCancelled())
          {
            ??? = localObject2;
            if (getAttachedView() != null)
            {
              ??? = localObject2;
              if (!ImageWorker.access$300(this$0)) {
                ??? = ImageWorker.access$200(this$0).getBitmapFromDiskCache(str);
              }
            }
          }
        }
        localObject2 = ???;
        if (??? == null)
        {
          localObject2 = ???;
          if (!isCancelled())
          {
            localObject2 = ???;
            if (getAttachedView() != null)
            {
              localObject2 = ???;
              if (!ImageWorker.access$300(this$0)) {
                localObject2 = this$0.processBitmap(paramVarArgs[0]);
              }
            }
          }
        }
        ??? = localObject3;
        if (localObject2 != null)
        {
          if (!APIUtil.hasHoneycomb()) {
            break label247;
          }
          paramVarArgs = new BitmapDrawable(this$0.mResources, (Bitmap)localObject2);
          ??? = paramVarArgs;
          if (ImageWorker.access$200(this$0) != null)
          {
            ImageWorker.access$200(this$0).addBitmapToCache(str, paramVarArgs);
            ??? = paramVarArgs;
          }
        }
        return (BitmapDrawable)???;
      }
      label247:
      paramVarArgs = new RecyclingBitmapDrawable(this$0.mResources, (Bitmap)localObject2);
    }
  }
  
  public View getAttachedView()
  {
    if (imageViewReference != null) {
      return getAttachedImageView();
    }
    if (btnReference != null) {
      return getAttachedButton();
    }
    return null;
  }
  
  protected void onCancelled(BitmapDrawable arg1)
  {
    super.onCancelled(???);
    synchronized (ImageWorker.access$100(this$0))
    {
      ImageWorker.access$100(this$0).notifyAll();
      return;
    }
  }
  
  protected void onPostExecute(BitmapDrawable paramBitmapDrawable)
  {
    if ((isCancelled()) || (ImageWorker.access$300(this$0))) {
      paramBitmapDrawable = null;
    }
    View localView = getAttachedView();
    if ((paramBitmapDrawable != null) && (localView != null))
    {
      if (!(localView instanceof Button)) {
        break label51;
      }
      ((Button)localView).setCompoundDrawablesWithIntrinsicBounds(paramBitmapDrawable, null, null, null);
    }
    label51:
    while (!(localView instanceof ImageView)) {
      return;
    }
    ImageWorker.access$400(this$0, (ImageView)localView, paramBitmapDrawable);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageWorker.BitmapWorkerTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */