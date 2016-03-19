package com.android.volley.toolbox;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.android.volley.VolleyError;

public class NetworkImageView
  extends ImageView
{
  private int mDefaultImageId;
  private int mErrorImageId;
  private ImageLoader.ImageContainer mImageContainer;
  private ImageLoader mImageLoader;
  private String mUrl;
  
  public NetworkImageView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NetworkImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public NetworkImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void setDefaultImageOrNull()
  {
    if (mDefaultImageId != 0)
    {
      setImageResource(mDefaultImageId);
      return;
    }
    setImageBitmap(null);
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    invalidate();
  }
  
  public String getImageURL()
  {
    return mUrl;
  }
  
  void loadImageIfNecessary(final boolean paramBoolean)
  {
    int n = getWidth();
    int m = getHeight();
    ImageView.ScaleType localScaleType = getScaleType();
    int j = 0;
    int i = 0;
    label57:
    int k;
    if (getLayoutParams() != null)
    {
      if (getLayoutParamswidth == -2)
      {
        j = 1;
        if (getLayoutParamsheight != -2) {
          break label89;
        }
        i = 1;
      }
    }
    else
    {
      if ((j == 0) || (i == 0)) {
        break label94;
      }
      k = 1;
      label68:
      if ((n != 0) || (m != 0) || (k != 0)) {
        break label100;
      }
    }
    label89:
    label94:
    label100:
    do
    {
      return;
      j = 0;
      break;
      i = 0;
      break label57;
      k = 0;
      break label68;
      if (TextUtils.isEmpty(mUrl))
      {
        if (mImageContainer != null)
        {
          mImageContainer.cancelRequest();
          mImageContainer = null;
        }
        setDefaultImageOrNull();
        return;
      }
      if ((mImageContainer == null) || (mImageContainer.getRequestUrl() == null)) {
        break label179;
      }
    } while (mImageContainer.getRequestUrl().equals(mUrl));
    mImageContainer.cancelRequest();
    setDefaultImageOrNull();
    label179:
    if (j != 0)
    {
      j = 0;
      if (i == 0) {
        break label226;
      }
    }
    label226:
    for (i = 0;; i = m)
    {
      mImageContainer = mImageLoader.get(mUrl, new ImageLoader.ImageListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          if (mErrorImageId != 0) {
            setImageResource(mErrorImageId);
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
              setImageBitmap(paramAnonymousImageContainer.getBitmap());
              return;
            }
          } while (mDefaultImageId == 0);
          setImageResource(mDefaultImageId);
        }
      }, j, i, localScaleType);
      return;
      j = n;
      break;
    }
  }
  
  protected void onDetachedFromWindow()
  {
    if (mImageContainer != null)
    {
      mImageContainer.cancelRequest();
      setImageBitmap(null);
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
  
  public void setImageUrl(String paramString, ImageLoader paramImageLoader)
  {
    mUrl = paramString;
    mImageLoader = paramImageLoader;
    loadImageIfNecessary(false);
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.NetworkImageView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */