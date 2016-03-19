package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;
import com.seeclickfix.ma.android.util.StringUtil;
import java.util.HashMap;
import java.util.Map;

public class ZoneButtonFactory
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ZoneButtonFactory";
  private static Map<String, String> iconMap;
  
  public static NetworkButton create(EnhancedWatchAreas paramEnhancedWatchAreas, MobileButtonsWithDefaults paramMobileButtonsWithDefaults, NetworkButton paramNetworkButton, Context paramContext)
  {
    paramContext = paramMobileButtonsWithDefaults.getLabel();
    paramMobileButtonsWithDefaults.getIcon();
    paramMobileButtonsWithDefaults.getAction();
    paramMobileButtonsWithDefaults.getUri();
    paramEnhancedWatchAreas.getStartGradientButtonColor();
    paramEnhancedWatchAreas.getButtonColor();
    paramEnhancedWatchAreas.getTextColor();
    paramNetworkButton.setText(paramContext);
    return paramNetworkButton;
  }
  
  @Deprecated
  public static NetworkButton createOld(EnhancedWatchAreas paramEnhancedWatchAreas, MobileButtonsWithDefaults paramMobileButtonsWithDefaults, Context paramContext)
  {
    paramContext = new NetworkButton(paramContext);
    String str = paramMobileButtonsWithDefaults.getLabel();
    paramMobileButtonsWithDefaults.getIcon();
    paramMobileButtonsWithDefaults.getAction();
    paramMobileButtonsWithDefaults.getUri();
    paramEnhancedWatchAreas.getStartGradientButtonColor();
    paramEnhancedWatchAreas.getButtonColor();
    paramEnhancedWatchAreas.getTextColor();
    paramContext.setBackgroundResource(2130837656);
    paramContext.setText(str);
    return paramContext;
  }
  
  @Deprecated
  private static Drawable getIconForButton(Context paramContext, String paramString)
  {
    paramString = StringUtil.removeExtension(paramString);
    Resources localResources = paramContext.getResources();
    int i = localResources.getIdentifier(paramString, "drawable", getApplicationInfopackageName);
    if (i == 0) {
      return null;
    }
    return localResources.getDrawable(i);
  }
  
  @Deprecated
  private static Drawable getIconForButtonLive(Context paramContext, String paramString)
  {
    paramString = (String)getIconMap().get(paramString);
    if (paramString == null) {}
    Resources localResources;
    int i;
    do
    {
      return null;
      localResources = paramContext.getResources();
      i = localResources.getIdentifier(paramString, "drawable", getApplicationInfopackageName);
    } while (i == 0);
    return localResources.getDrawable(i);
  }
  
  private static Map<String, String> getIconMap()
  {
    if (iconMap != null) {
      return iconMap;
    }
    iconMap = new HashMap();
    iconMap.put("83-calendar.png", "ic_calendar_custom");
    iconMap.put("75-phone.png", "ic_phone_white");
    return iconMap;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ZoneButtonFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */