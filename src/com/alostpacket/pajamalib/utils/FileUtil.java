package com.alostpacket.pajamalib.utils;

import android.os.Environment;
import android.os.Handler;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtil
{
  private static final boolean D = true;
  private static final boolean GLOBAL_DEBUG = true;
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
      if (i <= 0)
      {
        paramFile1.close();
        paramFile2.close();
        return;
      }
      paramFile2.write(arrayOfByte, 0, i);
    }
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
    }
    int j;
    int i;
    do
    {
      try
      {
        j = arrayOfString.length;
        i = 0;
      }
      catch (Exception paramString)
      {
        String str2;
        paramString.printStackTrace();
        Log.e("FileUtil", "error removing filename characters");
        return str1;
      }
      str2 = paramString;
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
      continue;
      Log.w("FileUtil", "WARNING! FileUtil.removeIllegalCharacters() encountered an error and is returning the unmodified string");
      return paramString;
    } while (i < j);
    return paramString;
  }
  
  public static boolean writeNoMediaFile(File paramFile, Handler paramHandler)
  {
    if (paramFile == null) {
      Log.e("FileUtil", "writeNoMediaFile() you must supply a directory File");
    }
    boolean bool;
    for (;;)
    {
      return false;
      if (isStorageWritable()) {
        try
        {
          if (paramFile.exists())
          {
            bool = paramFile.isDirectory();
            if (!bool) {}
            try
            {
              paramFile.mkdir();
              paramFile = new File(paramFile, ".nomedia");
              if (paramFile.exists())
              {
                Log.i("FileUtil", ".nomedia appears to exist already, returning without writing a new file");
                return true;
              }
            }
            catch (Exception paramFile)
            {
              paramFile.printStackTrace();
              return false;
            }
            bool = paramFile.createNewFile();
          }
        }
        catch (Exception paramFile)
        {
          Log.e("FileUtil", "error writing .nomedia-- Unknown exception?");
          paramFile.printStackTrace();
          return false;
        }
      }
    }
    Log.i("FileUtil", "writeNoMediaFile() fileCreated = " + bool);
    if (paramFile.canWrite())
    {
      paramFile = new FileOutputStream(paramFile);
      paramFile.write(0);
      paramFile.close();
      return true;
    }
    Log.e("FileUtil", "error writing .nomedia");
    return false;
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.FileUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */