package com.alostpacket.pajamalib.utils;

import android.content.Context;
import android.content.res.Resources;
import android.os.Environment;
import android.util.Log;
import java.io.File;

public class FolderUtil
{
  private static final boolean D = true;
  private static final boolean GLOBAL_DEBUG = true;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "pjLIB_FileUtil";
  
  public static File getAppFolder(Context paramContext)
  {
    paramContext = AppUtil.getAppName(paramContext);
    return getOrCreateFolder(Environment.getExternalStorageDirectory(), paramContext);
  }
  
  public static File getFolder(Context paramContext, int paramInt)
  {
    String str = paramContext.getResources().getString(paramInt);
    return getOrCreateFolder(getAppFolder(paramContext), str);
  }
  
  private static File getOrCreateFolder(File paramFile, String paramString)
  {
    if (!FileUtil.isStorageWritable()) {
      return null;
    }
    if ((paramFile == null) || (paramString == null))
    {
      Log.e("pjLIB_FileUtil", "getOrCreateFolder() parentDir == null");
      return null;
    }
    try
    {
      paramFile = new File(paramFile, paramString);
      paramFile.printStackTrace();
    }
    catch (Exception paramFile)
    {
      try
      {
        if ((!paramFile.exists()) && (!paramFile.mkdir())) {
          Log.e("pjLIB_FileUtil", "Error: getOrCreateFolder(): mkdir() failed ");
        }
        Log.v("pjLIB_FileUtil", "getOrCreateFolder() ::: childFolder.getAbsolutePath() :" + paramFile.getAbsolutePath());
        return paramFile;
      }
      catch (Exception paramFile)
      {
        for (;;) {}
      }
      paramFile = paramFile;
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.FolderUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */