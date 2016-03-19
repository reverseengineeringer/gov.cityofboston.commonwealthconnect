package com.seeclickfix.ma.android.media;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.ImageView;

public class MediaCaptureHelper$Builder
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

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.MediaCaptureHelper.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */