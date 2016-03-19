package com.seeclickfix.ma.android.media;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.ImageView;

public class MediaCaptureHelper
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "MediaCaptureHelper";
  private Activity activity;
  private AsyncTask<String, Void, Bitmap> bitmapDecodeTask;
  private boolean forceScaleFactor = false;
  private Intent imageIntent;
  private ImageView imageView;
  private String photoPath;
  private int targetH = 0;
  private int targetW = 0;
  private View viewToHide;
  private View viewToShow;
  
  private MediaCaptureHelper(Builder paramBuilder)
  {
    photoPath = photoPath;
    imageIntent = imgIntent;
    activity = activity;
    viewToShow = viewToShow;
    viewToHide = viewToHide;
    imageView = imageView;
  }
  
  private void doAsyncPicSet()
  {
    imageView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
    {
      public void onGlobalLayout()
      {
        imageView.getViewTreeObserver().removeGlobalOnLayoutListener(this);
        if ((imageView.getHeight() == 0) || (imageView.getWidth() == 0)) {
          MediaCaptureHelper.access$602(MediaCaptureHelper.this, true);
        }
        MediaCaptureHelper.this.doPicSet();
      }
    });
  }
  
  private void doPicSet()
  {
    cancel();
    if (targetW > 0)
    {
      i = targetW;
      targetW = i;
      if (targetH <= 0) {
        break label75;
      }
    }
    label75:
    for (int i = targetH;; i = imageView.getHeight())
    {
      targetH = i;
      if ((forceScaleFactor) || ((targetH != 0) && (targetW != 0))) {
        break label86;
      }
      doAsyncPicSet();
      return;
      i = imageView.getWidth();
      break;
    }
    label86:
    bitmapDecodeTask = new AsyncTask()
    {
      protected Bitmap doInBackground(String... paramAnonymousVarArgs)
      {
        BitmapFactory.Options localOptions = new BitmapFactory.Options();
        inJustDecodeBounds = true;
        inPurgeable = true;
        BitmapFactory.decodeFile(paramAnonymousVarArgs[0], localOptions);
        int j = outWidth;
        int k = outHeight;
        int i = 8;
        if (!forceScaleFactor) {
          i = Math.min(j / targetW, k / targetH);
        }
        inJustDecodeBounds = false;
        inSampleSize = i;
        inPurgeable = true;
        try
        {
          paramAnonymousVarArgs = BitmapFactory.decodeFile(paramAnonymousVarArgs[0], localOptions);
          return paramAnonymousVarArgs;
        }
        catch (Exception paramAnonymousVarArgs) {}
        return null;
      }
      
      protected void onPostExecute(Bitmap paramAnonymousBitmap)
      {
        imageView.setImageBitmap(paramAnonymousBitmap);
        imageView.setVisibility(0);
        imageView.invalidate();
        imageView.requestLayout();
      }
    };
    bitmapDecodeTask.execute(new String[] { photoPath });
  }
  
  public void cancel()
  {
    if (bitmapDecodeTask != null) {
      bitmapDecodeTask.cancel(true);
    }
  }
  
  public String getPathFromtIntent(Intent paramIntent)
  {
    paramIntent = paramIntent.getData();
    return GalleryPathHelper.getPath(activity, paramIntent);
  }
  
  public void hidePic()
  {
    cancel();
    if (viewToHide != null) {
      viewToHide.setVisibility(0);
    }
    if (viewToShow != null) {
      viewToShow.setVisibility(8);
    }
    imageView.setImageDrawable(null);
  }
  
  public void setPic()
  {
    if (photoPath == null)
    {
      if (imageIntent == null)
      {
        hidePic();
        return;
      }
      photoPath = getPathFromtIntent(imageIntent);
    }
    if (viewToShow != null) {
      viewToShow.setVisibility(0);
    }
    if (viewToHide != null) {
      viewToHide.setVisibility(8);
    }
    if (targetW > 0)
    {
      i = targetW;
      targetW = i;
      if (targetH <= 0) {
        break label126;
      }
    }
    label126:
    for (int i = targetH;; i = imageView.getHeight())
    {
      targetH = i;
      if ((targetH != 0) && (targetW != 0)) {
        break label137;
      }
      doAsyncPicSet();
      return;
      i = imageView.getWidth();
      break;
    }
    label137:
    doPicSet();
  }
  
  public static class Builder
  {
    private Activity activity;
    private ImageView imageView;
    private Intent imgIntent;
    private String photoPath;
    private View viewToHide;
    private View viewToShow;
    
    public Builder activity(Activity paramActivity)
    {
      activity = paramActivity;
      return this;
    }
    
    public MediaCaptureHelper build()
    {
      return new MediaCaptureHelper(this, null);
    }
    
    public Builder imageView(ImageView paramImageView)
    {
      imageView = paramImageView;
      return this;
    }
    
    public Builder imgIntent(Intent paramIntent)
    {
      imgIntent = paramIntent;
      return this;
    }
    
    public Builder measureImageView(ImageView paramImageView)
    {
      return this;
    }
    
    public Builder photoPath(String paramString)
    {
      photoPath = paramString;
      return this;
    }
    
    public Builder viewToHide(View paramView)
    {
      viewToHide = paramView;
      return this;
    }
    
    public Builder viewToShow(View paramView)
    {
      viewToShow = paramView;
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.MediaCaptureHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */