package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Map;

@Beta
@GwtCompatible
public abstract class ArrayBasedCharEscaper
  extends CharEscaper
{
  private final char[][] replacements;
  private final int replacementsLength;
  private final char safeMax;
  private final char safeMin;
  
  protected ArrayBasedCharEscaper(ArrayBasedEscaperMap paramArrayBasedEscaperMap, char paramChar1, char paramChar2)
  {
    Preconditions.checkNotNull(paramArrayBasedEscaperMap);
    replacements = paramArrayBasedEscaperMap.getReplacementArray();
    replacementsLength = replacements.length;
    int i = paramChar1;
    char c = paramChar2;
    if (paramChar2 < paramChar1)
    {
      c = '\000';
      i = 65535;
    }
    safeMin = i;
    safeMax = c;
  }
  
  protected ArrayBasedCharEscaper(Map<Character, String> paramMap, char paramChar1, char paramChar2)
  {
    this(ArrayBasedEscaperMap.create(paramMap), paramChar1, paramChar2);
  }
  
  public final String escape(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    int i = 0;
    for (;;)
    {
      String str = paramString;
      if (i < paramString.length())
      {
        int j = paramString.charAt(i);
        if (((j < replacementsLength) && (replacements[j] != null)) || (j > safeMax) || (j < safeMin)) {
          str = escapeSlow(paramString, i);
        }
      }
      else
      {
        return str;
      }
      i += 1;
    }
  }
  
  protected final char[] escape(char paramChar)
  {
    if (paramChar < replacementsLength)
    {
      char[] arrayOfChar = replacements[paramChar];
      if (arrayOfChar != null) {
        return arrayOfChar;
      }
    }
    if ((paramChar >= safeMin) && (paramChar <= safeMax)) {
      return null;
    }
    return escapeUnsafe(paramChar);
  }
  
  protected abstract char[] escapeUnsafe(char paramChar);
}

/* Location:
 * Qualified Name:     com.google.common.escape.ArrayBasedCharEscaper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */