package com.seeclickfix.ma.android.media;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;

public class ImageDownsampler
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ImageDownsampler";
  
  public static File downsampleFileFromUri(Uri paramUri, Context paramContext)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inSampleSize = 4;
    paramContext = null;
    try
    {
      paramUri = localContentResolver.openInputStream(paramUri);
      paramUri = BitmapFactory.decodeStream(paramUri, null, localOptions);
      paramContext = new ByteArrayOutputStream();
      paramUri.compress(Bitmap.CompressFormat.JPEG, 75, paramContext);
      return null;
    }
    catch (FileNotFoundException paramUri)
    {
      for (;;)
      {
        paramUri = paramContext;
      }
    }
  }
  
  public static class Quality
  {
    public static final int JPEG_75 = 75;
    public static final int PNG = 100;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageDownsampler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */