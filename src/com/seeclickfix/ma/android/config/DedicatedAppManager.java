package com.seeclickfix.ma.android.config;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import java.io.IOException;
import java.util.List;
import org.apache.commons.io.IOUtils;

public class DedicatedAppManager
{
  private static DedicatedApp dedicatedApp;
  
  public static DedicatedApp getDedicatedApp(Context paramContext)
  {
    if (dedicatedApp == null) {}
    try
    {
      dedicatedApp = loadLocalAppConfig(paramContext);
      return dedicatedApp;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
      throw new RuntimeException("App must have a config to function");
    }
  }
  
  public static boolean isDedicatedApp(Context paramContext)
  {
    return getDedicatedApp(paramContext).getIsDedicatedApp();
  }
  
  private static DedicatedApp loadLocalAppConfig(Context paramContext)
    throws IOException
  {
    paramContext = IOUtils.toString(paramContext.getResources().getAssets().open("json/config.json"), "UTF-8");
    return (DedicatedApp)new DeserializeResponse().getJavaObject(paramContext, DedicatedApp.class).get(0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.DedicatedAppManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */