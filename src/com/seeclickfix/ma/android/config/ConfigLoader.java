package com.seeclickfix.ma.android.config;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import java.io.IOException;
import org.apache.commons.io.IOUtils;

public class ConfigLoader
{
  private void loadConfig(Context paramContext)
    throws IOException
  {
    IOUtils.toString(paramContext.getResources().getAssets().open("file://android_asset/json/config.json"), "UTF-8");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.ConfigLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */