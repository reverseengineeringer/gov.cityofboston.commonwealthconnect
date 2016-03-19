package com.seeclickfix.ma.android.cache;

import android.graphics.Bitmap;
import android.support.v4.util.LruCache;
import com.android.volley.toolbox.ImageLoader.ImageCache;

public class LruImageCache
  extends LruCache<String, Bitmap>
  implements ImageLoader.ImageCache
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "LruImageCache";
  
  public LruImageCache()
  {
    this(getDefaultLruCacheSize());
  }
  
  public LruImageCache(int paramInt)
  {
    super(paramInt);
  }
  
  protected static int getDefaultLruCacheSize()
  {
    return 6291456;
  }
  
  public Bitmap getBitmap(String paramString)
  {
    return (Bitmap)get(paramString);
  }
  
  public void putBitmap(String paramString, Bitmap paramBitmap)
  {
    put(paramString, paramBitmap);
  }
  
  protected int sizeOf(String paramString, Bitmap paramBitmap)
  {
    return paramBitmap.getRowBytes() * paramBitmap.getHeight();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.LruImageCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */