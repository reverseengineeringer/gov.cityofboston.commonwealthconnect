package com.android.volley.toolbox;

import android.graphics.Bitmap;
import com.android.volley.Request;
import com.android.volley.VolleyError;
import java.util.LinkedList;

class ImageLoader$BatchedImageRequest
{
  private final LinkedList<ImageLoader.ImageContainer> mContainers = new LinkedList();
  private VolleyError mError;
  private final Request<?> mRequest;
  private Bitmap mResponseBitmap;
  
  public ImageLoader$BatchedImageRequest(Request<?> paramRequest, ImageLoader.ImageContainer paramImageContainer)
  {
    mRequest = paramImageContainer;
    Object localObject;
    mContainers.add(localObject);
  }
  
  public void addContainer(ImageLoader.ImageContainer paramImageContainer)
  {
    mContainers.add(paramImageContainer);
  }
  
  public VolleyError getError()
  {
    return mError;
  }
  
  public boolean removeContainerAndCancelIfNecessary(ImageLoader.ImageContainer paramImageContainer)
  {
    mContainers.remove(paramImageContainer);
    if (mContainers.size() == 0)
    {
      mRequest.cancel();
      return true;
    }
    return false;
  }
  
  public void setError(VolleyError paramVolleyError)
  {
    mError = paramVolleyError;
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.ImageLoader.BatchedImageRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */