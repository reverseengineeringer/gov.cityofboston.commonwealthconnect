package com.seeclickfix.ma.android.media;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import com.seeclickfix.ma.android.androidsdk.APIUtil;
import java.io.FileDescriptor;

public class ImageResizer
  extends ImageWorker
{
  private static final String TAG = "ImageResizer";
  protected int mImageHeight;
  protected int mImageWidth;
  
  public ImageResizer(Context paramContext, int paramInt)
  {
    super(paramContext);
    setImageSize(paramInt);
  }
  
  public ImageResizer(Context paramContext, int paramInt1, int paramInt2)
  {
    super(paramContext);
    setImageSize(paramInt1, paramInt2);
  }
  
  @TargetApi(11)
  private static void addInBitmapOptions(BitmapFactory.Options paramOptions, ImageCache paramImageCache)
  {
    inMutable = true;
    if (paramImageCache != null)
    {
      paramImageCache = paramImageCache.getBitmapFromReusableSet(paramOptions);
      if (paramImageCache != null) {
        inBitmap = paramImageCache;
      }
    }
  }
  
  public static int calculateInSampleSize(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    int k = outHeight;
    int m = outWidth;
    int j = 1;
    if ((k > paramInt2) || (m > paramInt1))
    {
      int i = Math.round(k / paramInt2);
      j = Math.round(m / paramInt1);
      if (i < j) {}
      for (;;)
      {
        float f1 = m * k;
        float f2 = paramInt1 * paramInt2 * 2;
        for (;;)
        {
          j = i;
          if (f1 / (i * i) <= f2) {
            break;
          }
          i += 1;
        }
        i = j;
      }
    }
    return j;
  }
  
  public static Bitmap decodeSampledBitmapFromDescriptor(FileDescriptor paramFileDescriptor, int paramInt1, int paramInt2, ImageCache paramImageCache)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeFileDescriptor(paramFileDescriptor, null, localOptions);
    inSampleSize = calculateInSampleSize(localOptions, paramInt1, paramInt2);
    inJustDecodeBounds = false;
    if (APIUtil.hasHoneycomb()) {
      addInBitmapOptions(localOptions, paramImageCache);
    }
    return BitmapFactory.decodeFileDescriptor(paramFileDescriptor, null, localOptions);
  }
  
  public static Bitmap decodeSampledBitmapFromFile(String paramString, int paramInt1, int paramInt2, ImageCache paramImageCache)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeFile(paramString, localOptions);
    inSampleSize = calculateInSampleSize(localOptions, paramInt1, paramInt2);
    if (APIUtil.hasHoneycomb()) {
      addInBitmapOptions(localOptions, paramImageCache);
    }
    inJustDecodeBounds = false;
    return BitmapFactory.decodeFile(paramString, localOptions);
  }
  
  public static Bitmap decodeSampledBitmapFromResource(Resources paramResources, int paramInt1, int paramInt2, int paramInt3, ImageCache paramImageCache)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeResource(paramResources, paramInt1, localOptions);
    inSampleSize = calculateInSampleSize(localOptions, paramInt2, paramInt3);
    if (APIUtil.hasHoneycomb()) {
      addInBitmapOptions(localOptions, paramImageCache);
    }
    inJustDecodeBounds = false;
    return BitmapFactory.decodeResource(paramResources, paramInt1, localOptions);
  }
  
  private Bitmap processBitmap(int paramInt)
  {
    return decodeSampledBitmapFromResource(mResources, paramInt, mImageWidth, mImageHeight, getImageCache());
  }
  
  protected Bitmap processBitmap(Object paramObject)
  {
    return processBitmap(Integer.parseInt(String.valueOf(paramObject)));
  }
  
  public void setImageSize(int paramInt)
  {
    setImageSize(paramInt, paramInt);
  }
  
  public void setImageSize(int paramInt1, int paramInt2)
  {
    mImageWidth = paramInt1;
    mImageHeight = paramInt2;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageResizer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */