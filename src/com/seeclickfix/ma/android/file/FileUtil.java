package com.seeclickfix.ma.android.file;

import android.os.Environment;
import android.os.Handler;
import com.seeclickfix.ma.android.util.HandlerUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  public static final String[] ILLEGAL_FILENAME_CHARS = { "\"", "/", "\\", "|", "$", "@", "!", "~", "^", "'", "*", ".", "<", ">", "[", "]", "+" };
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "FileUtil";
  
  public static void copy(File paramFile1, File paramFile2)
    throws IOException
  {
    paramFile1 = new FileInputStream(paramFile1);
    paramFile2 = new FileOutputStream(paramFile2);
    byte[] arrayOfByte = new byte['Ѐ'];
    for (;;)
    {
      int i = paramFile1.read(arrayOfByte);
      if (i <= 0) {
        break;
      }
      paramFile2.write(arrayOfByte, 0, i);
    }
    paramFile1.close();
    paramFile2.close();
  }
  
  public static boolean isStorageWritable()
  {
    return "mounted".equals(Environment.getExternalStorageState());
  }
  
  public static String removeIllegalCharacters(String paramString)
  {
    String[] arrayOfString = ILLEGAL_FILENAME_CHARS;
    String str1;
    if (paramString != null)
    {
      paramString = new String(paramString);
      str1 = paramString;
      try
      {
        int j = arrayOfString.length;
        int i = 0;
        for (;;)
        {
          str1 = paramString;
          if (i >= j) {
            break;
          }
          String str2 = paramString;
          if (paramString != null)
          {
            str2 = paramString;
            str1 = paramString;
            if (paramString.contains(arrayOfString[i]))
            {
              str1 = paramString;
              str2 = paramString.replace(arrayOfString[i], "_");
            }
          }
          i += 1;
          paramString = str2;
        }
        return str1;
      }
      catch (Exception paramString)
      {
        paramString.printStackTrace();
      }
    }
    return paramString;
  }
  
  public static boolean writeNoMediaFile(File paramFile, Handler paramHandler)
  {
    if (paramFile == null)
    {
      HandlerUtils.showError(paramHandler, "writeNoMediaFile() the directory was null");
      return false;
    }
    if (!isStorageWritable())
    {
      HandlerUtils.showError(paramHandler, "writeNoMediaFile() Storage is not available. Please be sure your device is not in USB storage mode.");
      return false;
    }
    try
    {
      if (!paramFile.exists())
      {
        HandlerUtils.showError(paramHandler, "writeNoMediaFile() the directory does not exist");
        return false;
      }
    }
    catch (Exception paramFile)
    {
      HandlerUtils.showError(paramHandler, "writeNoMediaFile() Unknown error, unable to write the .nomedia file");
      return false;
    }
    boolean bool = paramFile.isDirectory();
    if (!bool) {}
    try
    {
      paramFile.mkdir();
      paramFile = new File(paramFile, ".nomedia");
      if (paramFile.exists()) {
        return true;
      }
    }
    catch (Exception paramFile)
    {
      HandlerUtils.showError(paramHandler, "writeNoMediaFile() file was not a directory, unable to convert");
      return false;
    }
    paramFile.createNewFile();
    if (paramFile.canWrite())
    {
      paramFile = new FileOutputStream(paramFile);
      paramFile.write(0);
      paramFile.close();
      return true;
    }
    HandlerUtils.showError(paramHandler, "writeNoMediaFile()  noMedia.canWrite() is false");
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.file.FileUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */