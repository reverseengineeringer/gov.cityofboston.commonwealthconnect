package com.google.common.io;

import java.io.IOException;

abstract class LineBuffer
{
  private StringBuilder line = new StringBuilder();
  private boolean sawReturn;
  
  private boolean finishLine(boolean paramBoolean)
    throws IOException
  {
    String str2 = line.toString();
    String str1;
    if (sawReturn) {
      if (paramBoolean) {
        str1 = "\r\n";
      }
    }
    for (;;)
    {
      handleLine(str2, str1);
      line = new StringBuilder();
      sawReturn = false;
      return paramBoolean;
      str1 = "\r";
      continue;
      if (paramBoolean) {
        str1 = "\n";
      } else {
        str1 = "";
      }
    }
  }
  
  protected void add(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    int j = paramInt1;
    int i = j;
    boolean bool;
    if (sawReturn)
    {
      i = j;
      if (paramInt2 > 0)
      {
        if (paramArrayOfChar[j] != '\n') {
          break label133;
        }
        bool = true;
        i = j;
        if (finishLine(bool)) {
          i = j + 1;
        }
      }
    }
    int m = i;
    int n = paramInt1 + paramInt2;
    label62:
    if (i < n)
    {
      int k = i;
      j = m;
      switch (paramArrayOfChar[i])
      {
      default: 
        j = m;
        k = i;
      }
      for (;;)
      {
        i = k + 1;
        m = j;
        break label62;
        label133:
        bool = false;
        break;
        line.append(paramArrayOfChar, m, i - m);
        sawReturn = true;
        j = i;
        if (i + 1 < n) {
          if (paramArrayOfChar[(i + 1)] != '\n') {
            break label223;
          }
        }
        label223:
        for (bool = true;; bool = false)
        {
          j = i;
          if (finishLine(bool)) {
            j = i + 1;
          }
          i = j + 1;
          k = j;
          j = i;
          break;
        }
        line.append(paramArrayOfChar, m, i - m);
        finishLine(true);
        j = i + 1;
        k = i;
      }
    }
    line.append(paramArrayOfChar, m, paramInt1 + paramInt2 - m);
  }
  
  protected void finish()
    throws IOException
  {
    if ((sawReturn) || (line.length() > 0)) {
      finishLine(false);
    }
  }
  
  protected abstract void handleLine(String paramString1, String paramString2)
    throws IOException;
}

/* Location:
 * Qualified Name:     com.google.common.io.LineBuffer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */