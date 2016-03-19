package com.actionbarsherlock.internal;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import com.actionbarsherlock.R.bool;
import com.actionbarsherlock.R.integer;

public final class ResourcesCompat
{
  private static final String TAG = "ResourcesCompat";
  
  public static boolean getResources_getBoolean(Context paramContext, int paramInt)
  {
    boolean bool = true;
    if (Build.VERSION.SDK_INT >= 14) {
      bool = paramContext.getResources().getBoolean(paramInt);
    }
    float f2;
    label81:
    do
    {
      float f1;
      do
      {
        do
        {
          return bool;
          paramContext = paramContext.getResources().getDisplayMetrics();
          f2 = widthPixels / density;
          f1 = heightPixels / density;
          if (f2 < f1) {
            f1 = f2;
          }
          for (;;)
          {
            if (paramInt != R.bool.abs__action_bar_embed_tabs) {
              break label81;
            }
            if (f2 >= 480.0F) {
              break;
            }
            return false;
          }
          if (paramInt != R.bool.abs__split_action_bar_is_narrow) {
            break;
          }
        } while (f2 < 480.0F);
        return false;
        if (paramInt != R.bool.abs__action_bar_expanded_action_views_exclusive) {
          break;
        }
      } while (f1 < 600.0F);
      return false;
      if (paramInt != R.bool.abs__config_allowActionMenuItemTextWithIcon) {
        break;
      }
    } while (f2 >= 480.0F);
    return false;
    throw new IllegalArgumentException("Unknown boolean resource ID " + paramInt);
  }
  
  public static int getResources_getInteger(Context paramContext, int paramInt)
  {
    if (Build.VERSION.SDK_INT >= 13) {
      return paramContext.getResources().getInteger(paramInt);
    }
    paramContext = paramContext.getResources().getDisplayMetrics();
    float f = widthPixels / density;
    if (paramInt == R.integer.abs__max_action_buttons)
    {
      if (f >= 600.0F) {
        return 5;
      }
      if (f >= 500.0F) {
        return 4;
      }
      if (f >= 360.0F) {
        return 3;
      }
      return 2;
    }
    throw new IllegalArgumentException("Unknown integer resource ID " + paramInt);
  }
  
  public static int loadLogoFromManifest(Activity paramActivity)
  {
    int k = 0;
    int i = 0;
    int j = k;
    for (;;)
    {
      Object localObject;
      int n;
      try
      {
        String str2 = paramActivity.getClass().getName();
        j = k;
        String str3 = getApplicationInfopackageName;
        j = k;
        XmlResourceParser localXmlResourceParser = paramActivity.createPackageContext(str3, 0).getAssets().openXmlResourceParser("AndroidManifest.xml");
        j = k;
        k = localXmlResourceParser.getEventType();
        j = k;
        k = i;
        if (j != 1)
        {
          k = i;
          if (j == 2)
          {
            j = i;
            paramActivity = localXmlResourceParser.getName();
            j = i;
            if (!"application".equals(paramActivity)) {
              continue;
            }
            j = i;
            m = localXmlResourceParser.getAttributeCount() - 1;
            k = i;
            if (m >= 0)
            {
              j = i;
              if (!"logo".equals(localXmlResourceParser.getAttributeName(m))) {
                break label348;
              }
              j = i;
              k = localXmlResourceParser.getAttributeResourceValue(m, 0);
            }
          }
          j = k;
          i = localXmlResourceParser.nextToken();
          j = i;
          i = k;
          continue;
          k = i;
          j = i;
          if (!"activity".equals(paramActivity)) {
            continue;
          }
          paramActivity = null;
          String str1 = null;
          m = 0;
          j = i;
          k = localXmlResourceParser.getAttributeCount() - 1;
          if (k >= 0)
          {
            j = i;
            String str4 = localXmlResourceParser.getAttributeName(k);
            j = i;
            if ("logo".equals(str4))
            {
              j = i;
              localObject = Integer.valueOf(localXmlResourceParser.getAttributeResourceValue(k, 0));
              n = m;
              j = i;
              if (localObject == null) {
                break label357;
              }
              j = i;
              if (str1 == null) {
                break label357;
              }
              j = i;
              i = ((Integer)localObject).intValue();
              j = i;
              break label357;
            }
            localObject = paramActivity;
            n = m;
            j = i;
            if (!"name".equals(str4)) {
              continue;
            }
            j = i;
            str1 = ActionBarSherlockCompat.cleanActivityName(str3, localXmlResourceParser.getAttributeValue(k));
            j = i;
            boolean bool = str2.equals(str1);
            if (bool) {}
          }
          else
          {
            k = i;
            if (m == 0) {
              continue;
            }
            k = i;
          }
        }
        else
        {
          return k;
        }
        n = 1;
        localObject = paramActivity;
        continue;
        m -= 1;
      }
      catch (Exception paramActivity)
      {
        paramActivity.printStackTrace();
        return j;
      }
      label348:
      continue;
      label357:
      k -= 1;
      paramActivity = (Activity)localObject;
      int m = n;
      i = j;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.ResourcesCompat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */