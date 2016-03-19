package com.android.volley.toolbox;

import android.graphics.Bitmap;
import java.util.HashMap;
import java.util.LinkedList;

public class ImageLoader$ImageContainer
{
  private Bitmap mBitmap;
  private final String mCacheKey;
  private final ImageLoader.ImageListener mListener;
  private final String mRequestUrl;
  
  public ImageLoader$ImageContainer(ImageLoader paramImageLoader, Bitmap paramBitmap, String paramString1, String paramString2, ImageLoader.ImageListener paramImageListener)
  {
    mBitmap = paramBitmap;
    mRequestUrl = paramString1;
    mCacheKey = paramString2;
    mListener = paramImageListener;
  }
  
  public void cancelRequest()
  {
    if (mListener == null) {}
    ImageLoader.BatchedImageRequest localBatchedImageRequest;
    do
    {
      do
      {
        do
        {
          return;
          localBatchedImageRequest = (ImageLoader.BatchedImageRequest)ImageLoader.access$100(this$0).get(mCacheKey);
          if (localBatchedImageRequest == null) {
            break;
          }
        } while (!localBatchedImageRequest.removeContainerAndCancelIfNecessary(this));
        ImageLoader.access$100(this$0).remove(mCacheKey);
        return;
        localBatchedImageRequest = (ImageLoader.BatchedImageRequest)ImageLoader.access$200(this$0).get(mCacheKey);
      } while (localBatchedImageRequest == null);
      localBatchedImageRequest.removeContainerAndCancelIfNecessary(this);
    } while (ImageLoader.BatchedImageRequest.access$300(localBatchedImageRequest).size() != 0);
    ImageLoader.access$200(this$0).remove(mCacheKey);
  }
  
  public Bitmap getBitmap()
  {
    return mBitmap;
  }
  
  public String getRequestUrl()
  {
    return mRequestUrl;
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.ImageLoader.ImageContainer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */