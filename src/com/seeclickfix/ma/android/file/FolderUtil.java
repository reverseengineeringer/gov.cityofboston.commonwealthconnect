package com.seeclickfix.ma.android.file;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import com.seeclickfix.ma.android.util.HandlerUtils;
import java.io.File;

public class FolderUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "FolderUtil";
  
  public static File getCacheFolder(Context paramContext, Handler paramHandler)
  {
    return getFolder(getRemovablePublicAppFolder(paramContext, paramHandler), paramContext, paramHandler, 2131493172);
  }
  
  public static String getCacheFolderFullPath(Context paramContext, Handler paramHandler)
  {
    return getCacheFolder(paramContext, paramHandler).getAbsolutePath();
  }
  
  private static File getFolder(File paramFile, Context paramContext, Handler paramHandler, int paramInt)
  {
    return getOrCreateFolder(paramFile, paramContext.getResources().getString(paramInt), paramHandler);
  }
  
  private static File getOrCreateFolder(File paramFile, String paramString, Handler paramHandler)
  {
    Object localObject = null;
    if (!FileUtil.isStorageWritable())
    {
      HandlerUtils.showError(paramHandler, "getMusicFolder() Storage is not available. Please be sure your device is not in USB storage mode.");
      return null;
    }
    if ((paramFile == null) || (paramString == null))
    {
      HandlerUtils.showError(paramHandler, "getOrCreateFolder(): parentDir=null or name=null");
      return null;
    }
    for (;;)
    {
      try
      {
        paramFile = new File(paramFile, paramString);
        HandlerUtils.showError(paramHandler, "getOrCreateFolder(): unknown exception ");
      }
      catch (Exception paramFile)
      {
        try
        {
          if ((!paramFile.exists()) && (!paramFile.mkdir())) {
            HandlerUtils.showError(paramHandler, "getOrCreateFolder():mkdir() failed ");
          }
          return paramFile;
        }
        catch (Exception paramString)
        {
          for (;;) {}
        }
        paramFile = paramFile;
        paramFile = (File)localObject;
      }
    }
  }
  
  @TargetApi(8)
  public static File getRemovablePublicAppFolder(Context paramContext, Handler paramHandler)
  {
    return paramContext.getExternalFilesDir(null);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.file.FolderUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */