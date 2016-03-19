package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@Beta
@GwtCompatible
public final class CharEscaperBuilder
{
  private final Map<Character, String> map = new HashMap();
  private int max = -1;
  
  public CharEscaperBuilder addEscape(char paramChar, String paramString)
  {
    map.put(Character.valueOf(paramChar), Preconditions.checkNotNull(paramString));
    if (paramChar > max) {
      max = paramChar;
    }
    return this;
  }
  
  public CharEscaperBuilder addEscapes(char[] paramArrayOfChar, String paramString)
  {
    Preconditions.checkNotNull(paramString);
    int j = paramArrayOfChar.length;
    int i = 0;
    while (i < j)
    {
      addEscape(paramArrayOfChar[i], paramString);
      i += 1;
    }
    return this;
  }
  
  public char[][] toArray()
  {
    char[][] arrayOfChar = new char[max + 1][];
    Iterator localIterator = map.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      arrayOfChar[((Character)localEntry.getKey()).charValue()] = ((String)localEntry.getValue()).toCharArray();
    }
    return arrayOfChar;
  }
  
  public Escaper toEscaper()
  {
    return new CharArrayDecorator(toArray());
  }
  
  private static class CharArrayDecorator
    extends CharEscaper
  {
    private final int replaceLength;
    private final char[][] replacements;
    
    CharArrayDecorator(char[][] paramArrayOfChar)
    {
      replacements = paramArrayOfChar;
      replaceLength = paramArrayOfChar.length;
    }
    
    public String escape(String paramString)
    {
      int j = paramString.length();
      int i = 0;
      for (;;)
      {
        String str = paramString;
        if (i < j)
        {
          int k = paramString.charAt(i);
          if ((k < replacements.length) && (replacements[k] != null)) {
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
    
    protected char[] escape(char paramChar)
    {
      if (paramChar < replaceLength) {
        return replacements[paramChar];
      }
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.escape.CharEscaperBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */