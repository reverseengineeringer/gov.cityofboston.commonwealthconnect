package com.seeclickfix.ma.android.media;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Environment;
import com.seeclickfix.ma.android.fragments.interfaces.CameraLaunchingActivity;
import com.seeclickfix.ma.android.fragments.interfaces.ImageCapturedCallback;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PhotoTaker
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "PhotoTaker";
  
  @SuppressLint({"SimpleDateFormat"})
  public static String launchCameraWithCallback(ImageCapturedCallback paramImageCapturedCallback, CameraLaunchingActivity paramCameraLaunchingActivity)
    throws IOException
  {
    Object localObject = ((Activity)paramCameraLaunchingActivity).getApplicationContext().getResources().getString(2131493166);
    localObject = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), (String)localObject);
    ((File)localObject).mkdirs();
    String str = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
    localObject = File.createTempFile("SCF__" + str, ".jpg", (File)localObject);
    str = ((File)localObject).getAbsolutePath();
    Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
    localIntent.putExtra("output", Uri.fromFile((File)localObject));
    paramCameraLaunchingActivity.launchCameraWithCallback(paramImageCapturedCallback, localIntent);
    return str;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.PhotoTaker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */