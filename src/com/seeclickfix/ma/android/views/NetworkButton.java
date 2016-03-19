package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ColorFilter;
import android.graphics.drawable.BitmapDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import com.android.volley.Request.Priority;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.android.volley.toolbox.ImageLoader.ImageListener;

public class NetworkButton
  extends Button
{
  private ColorFilter filter;
  private int mDefaultImageId;
  private int mErrorImageId;
  private ImageLoader.ImageContainer mImageContainer;
  private ImageLoader mImageLoader;
  private Request.Priority mPriority;
  private String mUrl;
  
  public NetworkButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NetworkButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public NetworkButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void loadImageIfNecessary(final boolean paramBoolean)
  {
    int j = getWidth();
    int k = getHeight();
    int i;
    if ((getLayoutParams() != null) && (getLayoutParamsheight == -2) && (getLayoutParamswidth == -2))
    {
      i = 1;
      if ((j != 0) || (k != 0) || (i != 0)) {
        break label63;
      }
    }
    label63:
    do
    {
      return;
      i = 0;
      break;
      if (TextUtils.isEmpty(mUrl))
      {
        if (mImageContainer != null)
        {
          mImageContainer.cancelRequest();
          mImageContainer = null;
        }
        if (mDefaultImageId != 0)
        {
          setIconDrawableFromResId(mDefaultImageId);
          return;
        }
        setIconDrawableFromBitmap(null);
        return;
      }
      if ((mImageContainer == null) || (mImageContainer.getRequestUrl() == null)) {
        break label160;
      }
    } while (mImageContainer.getRequestUrl().equals(mUrl));
    mImageContainer.cancelRequest();
    setIconDrawableFromBitmap(null);
    label160:
    mImageContainer = mImageLoader.get(mUrl, new ImageLoader.ImageListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        if (mErrorImageId != 0) {
          NetworkButton.this.setIconDrawableFromResId(mErrorImageId);
        }
      }
      
      public void onResponse(final ImageLoader.ImageContainer paramAnonymousImageContainer, boolean paramAnonymousBoolean)
      {
        if ((paramAnonymousBoolean) && (paramBoolean)) {
          post(new Runnable()
          {
            public void run()
            {
              onResponse(paramAnonymousImageContainer, false);
            }
          });
        }
        do
        {
          return;
          if (paramAnonymousImageContainer.getBitmap() != null)
          {
            NetworkButton.this.setIconDrawableFromBitmap(paramAnonymousImageContainer.getBitmap());
            return;
          }
        } while (mDefaultImageId == 0);
        NetworkButton.this.setIconDrawableFromResId(mDefaultImageId);
      }
    }, 0, 0);
  }
  
  private void setIconDrawableFromBitmap(Bitmap paramBitmap)
  {
    paramBitmap = new BitmapDrawable(getContext().getResources(), paramBitmap);
    if (filter != null) {
      paramBitmap.setColorFilter(filter);
    }
    setCompoundDrawablesWithIntrinsicBounds(paramBitmap, null, null, null);
  }
  
  private void setIconDrawableFromResId(int paramInt)
  {
    setIconDrawableFromBitmap(BitmapFactory.decodeResource(getResources(), paramInt));
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    invalidate();
  }
  
  public ColorFilter getFilter()
  {
    return filter;
  }
  
  protected void onDetachedFromWindow()
  {
    if (mImageContainer != null)
    {
      mImageContainer.cancelRequest();
      setIconDrawableFromBitmap(null);
      mImageContainer = null;
    }
    super.onDetachedFromWindow();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    loadImageIfNecessary(true);
  }
  
  public void setDefaultImageResId(int paramInt)
  {
    mDefaultImageId = paramInt;
  }
  
  public void setErrorImageResId(int paramInt)
  {
    mErrorImageId = paramInt;
  }
  
  public void setFilter(ColorFilter paramColorFilter)
  {
    filter = paramColorFilter;
  }
  
  public void setImageUrl(String paramString, ImageLoader paramImageLoader, Request.Priority paramPriority)
  {
    mUrl = paramString;
    mImageLoader = paramImageLoader;
    mPriority = paramPriority;
    loadImageIfNecessary(false);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.NetworkButton
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */