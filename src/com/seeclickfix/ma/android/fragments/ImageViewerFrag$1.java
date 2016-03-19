package com.seeclickfix.ma.android.fragments;

import android.widget.ImageView;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.android.volley.toolbox.ImageLoader.ImageListener;
import uk.co.senab.photoview.PhotoViewAttacher;

class ImageViewerFrag$1
  implements ImageLoader.ImageListener
{
  ImageViewerFrag$1(ImageViewerFrag paramImageViewerFrag, int paramInt1, String paramString, ImageView paramImageView, int paramInt2) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    if ((val$errorImageResId == 0) || (val$smallImgUrl != null)) {}
    while (val$errorImageResId == 0) {
      try
      {
        ImageViewerFrag.access$000(this$0, val$smallImgUrl, val$view, null);
        return;
      }
      catch (Exception paramVolleyError)
      {
        while (val$errorImageResId == 0) {}
        val$view.setImageResource(val$errorImageResId);
        return;
      }
    }
    val$view.setImageResource(val$errorImageResId);
  }
  
  public void onResponse(ImageLoader.ImageContainer paramImageContainer, boolean paramBoolean)
  {
    if (paramImageContainer.getBitmap() != null)
    {
      val$view.setImageBitmap(paramImageContainer.getBitmap());
      ImageViewerFrag.access$100(this$0).update();
    }
    do
    {
      do
      {
        return;
        if (val$smallImgUrl == null) {
          break;
        }
        try
        {
          ImageViewerFrag.access$000(this$0, val$smallImgUrl, val$view, null);
          return;
        }
        catch (Exception paramImageContainer) {}
      } while (val$errorImageResId == 0);
      val$view.setImageResource(val$errorImageResId);
      return;
    } while (val$defaultImageResId == 0);
    val$view.setImageResource(val$defaultImageResId);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ImageViewerFrag.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */