package com.seeclickfix.ma.android.net.volley;

import android.content.Context;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.Volley;
import com.seeclickfix.ma.android.cache.LruImageCache;

public class VolleyRequestQueue
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "VolleyRequestQueue";
  private static VolleyRequestQueue singletonInstance;
  private Context c;
  private ImageLoader mIconLoader;
  private ImageLoader mImageLoader;
  private RequestQueue mRequestQueue;
  
  private VolleyRequestQueue(Context paramContext)
  {
    c = paramContext;
    mRequestQueue = Volley.newRequestQueue(paramContext);
    mImageLoader = new ImageLoader(mRequestQueue, new LruImageCache());
    mIconLoader = new ImageLoader(mRequestQueue, new LruImageCache(1048576));
  }
  
  public static VolleyRequestQueue getInstance()
  {
    return singletonInstance;
  }
  
  public static VolleyRequestQueue getInstance(Context paramContext)
  {
    if (singletonInstance == null) {
      singletonInstance = new VolleyRequestQueue(paramContext);
    }
    return singletonInstance;
  }
  
  public void add(Request<?> paramRequest)
  {
    mRequestQueue.add(paramRequest);
  }
  
  public void cancelByTag(Object paramObject)
  {
    mRequestQueue.cancelAll(paramObject);
  }
  
  public ImageLoader getIconLoader()
  {
    return mIconLoader;
  }
  
  public ImageLoader getImageLoader()
  {
    return mImageLoader;
  }
  
  public RequestQueue getQueue()
  {
    return mRequestQueue;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.volley.VolleyRequestQueue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */