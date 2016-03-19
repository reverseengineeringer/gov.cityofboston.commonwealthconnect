package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;

@Beta
public final class Escapers$Builder
{
  private final Map<Character, String> replacementMap = new HashMap();
  private char safeMax = 65535;
  private char safeMin = '\000';
  private String unsafeReplacement = null;
  
  public Builder addEscape(char paramChar, String paramString)
  {
    Preconditions.checkNotNull(paramString);
    replacementMap.put(Character.valueOf(paramChar), paramString);
    return this;
  }
  
  public Escaper build()
  {
    new ArrayBasedCharEscaper(replacementMap, safeMin, safeMax)
    {
      private final char[] replacementChars;
      
      protected char[] escapeUnsafe(char paramAnonymousChar)
      {
        return replacementChars;
      }
    };
  }
  
  public Builder setSafeRange(char paramChar1, char paramChar2)
  {
    safeMin = paramChar1;
    safeMax = paramChar2;
    return this;
  }
  
  public Builder setUnsafeReplacement(@Nullable String paramString)
  {
    unsafeReplacement = paramString;
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.escape.Escapers.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */