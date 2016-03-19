package com.seeclickfix.ma.android.file;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;

public class IoUtil
{
  @Deprecated
  public static String convertStreamToString(InputStream paramInputStream)
    throws IOException
  {
    StringWriter localStringWriter = new StringWriter();
    char[] arrayOfChar = new char['ࠀ'];
    try
    {
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(paramInputStream, "UTF-8"));
      for (;;)
      {
        int i = localBufferedReader.read(arrayOfChar);
        if (i == -1) {
          break;
        }
        localStringWriter.write(arrayOfChar, 0, i);
      }
    }
    finally
    {
      paramInputStream.close();
    }
    return localObject.toString();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.file.IoUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */