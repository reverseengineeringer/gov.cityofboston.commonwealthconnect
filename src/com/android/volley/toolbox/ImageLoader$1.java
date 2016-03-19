package com.android.volley.toolbox;

import android.widget.ImageView;
import com.android.volley.VolleyError;

final class ImageLoader$1
  implements ImageLoader.ImageListener
{
  ImageLoader$1(int paramInt1, ImageView paramImageView, int paramInt2) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    if (val$errorImageResId != 0) {
      val$view.setImageResource(val$errorImageResId);
    }
  }
  
  public void onResponse(ImageLoader.ImageContainer paramImageContainer, boolean paramBoolean)
  {
    if (paramImageContainer.getBitmap() != null) {
      val$view.setImageBitmap(paramImageContainer.getBitmap());
    }
    while (val$defaultImageResId == 0) {
      return;
    }
    val$view.setImageResource(val$defaultImageResId);
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.ImageLoader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */