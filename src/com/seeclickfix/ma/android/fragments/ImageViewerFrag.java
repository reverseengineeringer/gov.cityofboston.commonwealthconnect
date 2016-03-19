package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import com.android.volley.RequestQueue;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.android.volley.toolbox.ImageLoader.ImageListener;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.media.ImageParcel;
import uk.co.senab.photoview.PhotoViewAttacher;

public class ImageViewerFrag
  extends BaseFrag
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ImageViewerFrag";
  private Bundle args;
  private Context c;
  private ImageParcel imgParcel;
  private PhotoViewAttacher mAttacher;
  private ImageLoader mImageLoader;
  private ImageView mImageView;
  private RequestQueue mRequestQueue;
  
  private void cancelQueue()
  {
    if (mRequestQueue != null) {
      mRequestQueue.stop();
    }
  }
  
  private void loadImage(String paramString1, ImageView paramImageView, String paramString2)
  {
    if ((paramString1 == null) || (paramString1.equalsIgnoreCase("null")))
    {
      paramImageView.setImageResource(2130837842);
      return;
    }
    String str = paramString1;
    if (!paramString1.startsWith("http://")) {
      str = new String("http://seeclickfix.com" + paramString1);
    }
    paramString1 = getImageListener(paramImageView, 2130837810, 2130837842, paramString2);
    mImageLoader.get(str, paramString1, 1024, 1024);
  }
  
  private void showText()
  {
    TextView localTextView1 = (TextView)rootFrag.findViewById(2131361915);
    TextView localTextView2 = (TextView)rootFrag.findViewById(2131361916);
    if (imgParcel.getTitle() != null) {
      localTextView1.setText(imgParcel.getTitle());
    }
    if (imgParcel.getSubtitle() != null) {
      localTextView2.setText(imgParcel.getSubtitle());
    }
  }
  
  ImageLoader.ImageListener getImageListener(final ImageView paramImageView, final int paramInt1, final int paramInt2, final String paramString)
  {
    new ImageLoader.ImageListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        if ((paramInt2 == 0) || (paramString != null)) {}
        while (paramInt2 == 0) {
          try
          {
            ImageViewerFrag.this.loadImage(paramString, paramImageView, null);
            return;
          }
          catch (Exception paramAnonymousVolleyError)
          {
            while (paramInt2 == 0) {}
            paramImageView.setImageResource(paramInt2);
            return;
          }
        }
        paramImageView.setImageResource(paramInt2);
      }
      
      public void onResponse(ImageLoader.ImageContainer paramAnonymousImageContainer, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousImageContainer.getBitmap() != null)
        {
          paramImageView.setImageBitmap(paramAnonymousImageContainer.getBitmap());
          mAttacher.update();
        }
        do
        {
          do
          {
            return;
            if (paramString == null) {
              break;
            }
            try
            {
              ImageViewerFrag.this.loadImage(paramString, paramImageView, null);
              return;
            }
            catch (Exception paramAnonymousImageContainer) {}
          } while (paramInt2 == 0);
          paramImageView.setImageResource(paramInt2);
          return;
        } while (paramInt1 == 0);
        paramImageView.setImageResource(paramInt1);
      }
    };
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    mImageLoader = VolleyRequestQueue.getInstance(c).getImageLoader();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903082, paramViewGroup, false));
    return rootFrag;
  }
  
  public void onDetach()
  {
    super.onDetach();
    cancelQueue();
  }
  
  public void onResume()
  {
    super.onResume();
    args = getArguments();
    imgParcel = ((ImageParcel)args.getParcelable("IMAGE_PARCEL"));
    mImageView = ((ImageView)rootFrag.findViewById(2131361917));
    mAttacher = new PhotoViewAttacher(mImageView);
    mAttacher.setScaleType(ImageView.ScaleType.CENTER_CROP);
    String str1 = imgParcel.getUriPath();
    String str2 = imgParcel.getSmallImageUri();
    loadImage(str1, mImageView, str2);
    showText();
  }
  
  public void onStop()
  {
    super.onStop();
    cancelQueue();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ImageViewerFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */