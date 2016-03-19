package com.seeclickfix.ma.android.media;

import android.graphics.drawable.BitmapDrawable;
import android.support.v4.util.LruCache;
import com.seeclickfix.ma.android.androidsdk.APIUtil;
import java.lang.ref.SoftReference;
import java.util.HashSet;

class ImageCache$1
  extends LruCache<String, BitmapDrawable>
{
  ImageCache$1(ImageCache paramImageCache, int paramInt)
  {
    super(paramInt);
  }
  
  protected void entryRemoved(boolean paramBoolean, String paramString, BitmapDrawable paramBitmapDrawable1, BitmapDrawable paramBitmapDrawable2)
  {
    if (RecyclingBitmapDrawable.class.isInstance(paramBitmapDrawable1)) {
      ((RecyclingBitmapDrawable)paramBitmapDrawable1).setIsCached(false);
    }
    while (!APIUtil.hasHoneycomb()) {
      return;
    }
    ImageCache.access$000(this$0).add(new SoftReference(paramBitmapDrawable1.getBitmap()));
  }
  
  protected int sizeOf(String paramString, BitmapDrawable paramBitmapDrawable)
  {
    int j = ImageCache.getBitmapSize(paramBitmapDrawable) / 1024;
    int i = j;
    if (j == 0) {
      i = 1;
    }
    return i;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageCache.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */