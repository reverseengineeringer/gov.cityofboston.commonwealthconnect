package com.seeclickfix.ma.android.media;

import android.content.Context;
import android.graphics.Bitmap.CompressFormat;
import java.io.File;

public class ImageCache$ImageCacheParams
{
  public Bitmap.CompressFormat compressFormat = ImageCache.access$100();
  public int compressQuality = 70;
  public File diskCacheDir;
  public boolean diskCacheEnabled = true;
  public int diskCacheSize = 10485760;
  public boolean initDiskCacheOnCreate = false;
  public int memCacheSize = 5120;
  public boolean memoryCacheEnabled = true;
  
  public ImageCache$ImageCacheParams(Context paramContext, String paramString)
  {
    diskCacheDir = ImageCache.getDiskCacheDir(paramContext, paramString);
  }
  
  public void setMemCacheSizePercent(float paramFloat)
  {
    if ((paramFloat < 0.05F) || (paramFloat > 0.8F)) {
      throw new IllegalArgumentException("setMemCacheSizePercent - percent must be between 0.05 and 0.8 (inclusive)");
    }
    memCacheSize = Math.round((float)Runtime.getRuntime().maxMemory() * paramFloat / 1024.0F);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageCache.ImageCacheParams
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */