package com.seeclickfix.ma.android.media;

import android.content.Intent;
import com.seeclickfix.ma.android.fragments.interfaces.GalleryLauncher;
import com.seeclickfix.ma.android.fragments.interfaces.ImageCapturedCallback;

public class GalleryPicker
{
  public static final String MIME_TYPE = "image/*";
  
  public static void launchGalleryForCallback(ImageCapturedCallback paramImageCapturedCallback, GalleryLauncher paramGalleryLauncher)
  {
    Intent localIntent = new Intent();
    localIntent.setType("image/*");
    localIntent.setAction("android.intent.action.GET_CONTENT");
    paramGalleryLauncher.launchGalleryForCallback(paramImageCapturedCallback, localIntent);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.GalleryPicker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */