package com.seeclickfix.ma.android.media;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import com.seeclickfix.ma.android.androidsdk.APIUtil;
import com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask;
import java.lang.ref.WeakReference;

public abstract class ImageWorker
{
  private static final int FADE_IN_TIME = 200;
  private static final int MESSAGE_CLEAR = 0;
  private static final int MESSAGE_CLOSE = 3;
  private static final int MESSAGE_FLUSH = 2;
  private static final int MESSAGE_INIT_DISK_CACHE = 1;
  private static final String TAG = "ImageWorker";
  private boolean mExitTasksEarly = false;
  private boolean mFadeInBitmap = true;
  private ImageCache mImageCache;
  private ImageCache.ImageCacheParams mImageCacheParams;
  private Bitmap mLoadingBitmap;
  protected boolean mPauseWork = false;
  private final Object mPauseWorkLock = new Object();
  protected Resources mResources;
  
  protected ImageWorker(Context paramContext)
  {
    mResources = paramContext.getResources();
  }
  
  public static boolean cancelPotentialWork(Object paramObject, ImageView paramImageView)
  {
    paramImageView = getBitmapWorkerTask(paramImageView);
    if (paramImageView != null)
    {
      Object localObject = data;
      if ((localObject == null) || (!localObject.equals(paramObject))) {
        paramImageView.cancel(true);
      }
    }
    else
    {
      return true;
    }
    return false;
  }
  
  public static boolean cancelPotentialWorkButton(Object paramObject, Button paramButton)
  {
    paramButton = getBitmapWorkerTaskBtn(paramButton);
    if (paramButton != null)
    {
      Object localObject = data;
      if ((localObject == null) || (!localObject.equals(paramObject))) {
        paramButton.cancel(true);
      }
    }
    else
    {
      return true;
    }
    return false;
  }
  
  public static void cancelWork(ImageView paramImageView)
  {
    paramImageView = getBitmapWorkerTask(paramImageView);
    if (paramImageView != null) {
      paramImageView.cancel(true);
    }
  }
  
  private static BitmapWorkerTask getBitmapWorkerTask(ImageView paramImageView)
  {
    if (paramImageView != null)
    {
      paramImageView = paramImageView.getDrawable();
      if ((paramImageView instanceof AsyncDrawable)) {
        return ((AsyncDrawable)paramImageView).getBitmapWorkerTask();
      }
    }
    return null;
  }
  
  private static BitmapWorkerTask getBitmapWorkerTaskBtn(Button paramButton)
  {
    if (paramButton != null)
    {
      paramButton = paramButton.getCompoundDrawables()[0];
      if ((paramButton instanceof AsyncDrawable)) {
        return ((AsyncDrawable)paramButton).getBitmapWorkerTask();
      }
    }
    return null;
  }
  
  private void setImageDrawable(ImageView paramImageView, Drawable paramDrawable)
  {
    if (mFadeInBitmap)
    {
      paramDrawable = new TransitionDrawable(new Drawable[] { new ColorDrawable(17170445), paramDrawable });
      paramImageView.setBackgroundDrawable(new BitmapDrawable(mResources, mLoadingBitmap));
      paramImageView.setImageDrawable(paramDrawable);
      paramDrawable.startTransition(200);
      return;
    }
    paramImageView.setImageDrawable(paramDrawable);
  }
  
  public void addImageCache(FragmentActivity paramFragmentActivity, String paramString)
  {
    mImageCacheParams = new ImageCache.ImageCacheParams(paramFragmentActivity, paramString);
    mImageCache = ImageCache.getInstance(paramFragmentActivity.getSupportFragmentManager(), mImageCacheParams);
    new CacheAsyncTask().execute(new Object[] { Integer.valueOf(1) });
  }
  
  public void addImageCache(FragmentManager paramFragmentManager, ImageCache.ImageCacheParams paramImageCacheParams)
  {
    mImageCacheParams = paramImageCacheParams;
    mImageCache = ImageCache.getInstance(paramFragmentManager, mImageCacheParams);
    new CacheAsyncTask().execute(new Object[] { Integer.valueOf(1) });
  }
  
  public void clearCache()
  {
    new CacheAsyncTask().execute(new Object[] { Integer.valueOf(0) });
  }
  
  protected void clearCacheInternal()
  {
    if (mImageCache != null) {
      mImageCache.clearCache();
    }
  }
  
  public void closeCache()
  {
    new CacheAsyncTask().execute(new Object[] { Integer.valueOf(3) });
  }
  
  protected void closeCacheInternal()
  {
    if (mImageCache != null)
    {
      mImageCache.close();
      mImageCache = null;
    }
  }
  
  public void flushCache()
  {
    new CacheAsyncTask().execute(new Object[] { Integer.valueOf(2) });
  }
  
  protected void flushCacheInternal()
  {
    if (mImageCache != null) {
      mImageCache.flush();
    }
  }
  
  protected ImageCache getImageCache()
  {
    return mImageCache;
  }
  
  protected void initDiskCacheInternal()
  {
    if (mImageCache != null) {
      mImageCache.initDiskCache();
    }
  }
  
  public void loadButtonIconLeft(Object paramObject, Button paramButton)
  {
    if (paramObject == null) {}
    do
    {
      return;
      localObject = null;
      if (mImageCache != null) {
        localObject = mImageCache.getBitmapFromMemCache(String.valueOf(paramObject));
      }
      if (localObject != null)
      {
        paramButton.setCompoundDrawablesWithIntrinsicBounds((Drawable)localObject, null, null, null);
        return;
      }
    } while (!cancelPotentialWorkButton(paramObject, paramButton));
    Object localObject = new BitmapWorkerTask(paramButton);
    paramButton.setCompoundDrawablesWithIntrinsicBounds(new AsyncDrawable(mResources, mLoadingBitmap, (BitmapWorkerTask)localObject), null, null, null);
    ((BitmapWorkerTask)localObject).executeOnExecutor(MultiThreadAsyncTask.DUAL_THREAD_EXECUTOR, new Object[] { paramObject });
  }
  
  public void loadImage(Object paramObject, ImageView paramImageView)
  {
    if (paramObject == null) {}
    do
    {
      return;
      localObject = null;
      if (mImageCache != null) {
        localObject = mImageCache.getBitmapFromMemCache(String.valueOf(paramObject));
      }
      if (localObject != null)
      {
        paramImageView.setImageDrawable((Drawable)localObject);
        return;
      }
    } while (!cancelPotentialWork(paramObject, paramImageView));
    Object localObject = new BitmapWorkerTask(paramImageView);
    paramImageView.setImageDrawable(new AsyncDrawable(mResources, mLoadingBitmap, (BitmapWorkerTask)localObject));
    ((BitmapWorkerTask)localObject).executeOnExecutor(MultiThreadAsyncTask.DUAL_THREAD_EXECUTOR, new Object[] { paramObject });
  }
  
  protected abstract Bitmap processBitmap(Object paramObject);
  
  public void setExitTasksEarly(boolean paramBoolean)
  {
    mExitTasksEarly = paramBoolean;
    setPauseWork(false);
  }
  
  public void setImageFadeIn(boolean paramBoolean)
  {
    mFadeInBitmap = paramBoolean;
  }
  
  public void setLoadingImage(int paramInt)
  {
    mLoadingBitmap = BitmapFactory.decodeResource(mResources, paramInt);
  }
  
  public void setLoadingImage(Bitmap paramBitmap)
  {
    mLoadingBitmap = paramBitmap;
  }
  
  public void setPauseWork(boolean paramBoolean)
  {
    synchronized (mPauseWorkLock)
    {
      mPauseWork = paramBoolean;
      if (!mPauseWork) {
        mPauseWorkLock.notifyAll();
      }
      return;
    }
  }
  
  private static class AsyncDrawable
    extends BitmapDrawable
  {
    private final WeakReference<ImageWorker.BitmapWorkerTask> bitmapWorkerTaskReference;
    
    public AsyncDrawable(Resources paramResources, Bitmap paramBitmap, ImageWorker.BitmapWorkerTask paramBitmapWorkerTask)
    {
      super(paramBitmap);
      bitmapWorkerTaskReference = new WeakReference(paramBitmapWorkerTask);
    }
    
    public ImageWorker.BitmapWorkerTask getBitmapWorkerTask()
    {
      return (ImageWorker.BitmapWorkerTask)bitmapWorkerTaskReference.get();
    }
  }
  
  private class BitmapWorkerTask
    extends MultiThreadAsyncTask<Object, Void, BitmapDrawable>
  {
    private WeakReference<Button> btnReference;
    private Object data;
    private WeakReference<ImageView> imageViewReference;
    
    public BitmapWorkerTask(Button paramButton)
    {
      btnReference = new WeakReference(paramButton);
    }
    
    public BitmapWorkerTask(ImageView paramImageView)
    {
      imageViewReference = new WeakReference(paramImageView);
    }
    
    private Button getAttachedButton()
    {
      Button localButton = (Button)btnReference.get();
      if (this == ImageWorker.getBitmapWorkerTaskBtn(localButton)) {
        return localButton;
      }
      return null;
    }
    
    private ImageView getAttachedImageView()
    {
      ImageView localImageView = (ImageView)imageViewReference.get();
      if (this == ImageWorker.getBitmapWorkerTask(localImageView)) {
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
        synchronized (mPauseWorkLock)
        {
          if (mPauseWork)
          {
            boolean bool = isCancelled();
            if (!bool)
            {
              try
              {
                mPauseWorkLock.wait();
              }
              catch (InterruptedException localInterruptedException) {}
              continue;
            }
          }
          ??? = localObject2;
          if (mImageCache != null)
          {
            ??? = localObject2;
            if (!isCancelled())
            {
              ??? = localObject2;
              if (getAttachedView() != null)
              {
                ??? = localObject2;
                if (!mExitTasksEarly) {
                  ??? = mImageCache.getBitmapFromDiskCache(str);
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
                if (!mExitTasksEarly) {
                  localObject2 = processBitmap(paramVarArgs[0]);
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
            paramVarArgs = new BitmapDrawable(mResources, (Bitmap)localObject2);
            ??? = paramVarArgs;
            if (mImageCache != null)
            {
              mImageCache.addBitmapToCache(str, paramVarArgs);
              ??? = paramVarArgs;
            }
          }
          return (BitmapDrawable)???;
        }
        label247:
        paramVarArgs = new RecyclingBitmapDrawable(mResources, (Bitmap)localObject2);
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
      synchronized (mPauseWorkLock)
      {
        mPauseWorkLock.notifyAll();
        return;
      }
    }
    
    protected void onPostExecute(BitmapDrawable paramBitmapDrawable)
    {
      if ((isCancelled()) || (mExitTasksEarly)) {
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
      ImageWorker.this.setImageDrawable((ImageView)localView, paramBitmapDrawable);
    }
  }
  
  protected class CacheAsyncTask
    extends MultiThreadAsyncTask<Object, Void, Void>
  {
    protected CacheAsyncTask() {}
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      switch (((Integer)paramVarArgs[0]).intValue())
      {
      }
      for (;;)
      {
        return null;
        clearCacheInternal();
        continue;
        initDiskCacheInternal();
        continue;
        flushCacheInternal();
        continue;
        closeCacheInternal();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageWorker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */