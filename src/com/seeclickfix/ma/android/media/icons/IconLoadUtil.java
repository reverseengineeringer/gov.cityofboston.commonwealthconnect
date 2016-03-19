package com.seeclickfix.ma.android.media.icons;

import android.widget.ImageView;
import com.android.volley.toolbox.ImageLoader;

public class IconLoadUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IconLoadUtil";
  
  public static void loadIcon(String paramString, ImageView paramImageView, ImageLoader paramImageLoader)
  {
    if ((paramString == null) || (paramString.equalsIgnoreCase("null"))) {
      return;
    }
    String str = paramString;
    if (!paramString.startsWith("http://")) {
      str = new String("http://seeclickfix.com" + paramString);
    }
    paramImageLoader.get(str, ImageLoader.getImageListener(paramImageView, 2130837848, 2130837840), 96, 96);
  }
  
  public static void loadImage(String paramString, ImageView paramImageView, ImageLoader paramImageLoader)
  {
    if ((paramString == null) || (paramString.equalsIgnoreCase("null"))) {
      return;
    }
    String str = paramString;
    if (!paramString.startsWith("http://")) {
      str = new String("http://seeclickfix.com" + paramString);
    }
    paramImageLoader.get(str, ImageLoader.getImageListener(paramImageView, 2130837848, 2130837840), 680, 300);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.icons.IconLoadUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */