package org.apache.commons.lang3.text;

final class StrMatcher$StringMatcher
  extends StrMatcher
{
  private final char[] chars;
  
  StrMatcher$StringMatcher(String paramString)
  {
    chars = paramString.toCharArray();
  }
  
  public int isMatch(char[] paramArrayOfChar, int paramInt1, int paramInt2, int paramInt3)
  {
    int i = chars.length;
    if (paramInt1 + i > paramInt3)
    {
      paramInt3 = 0;
      return paramInt3;
    }
    paramInt2 = 0;
    for (;;)
    {
      paramInt3 = i;
      if (paramInt2 >= chars.length) {
        break;
      }
      if (chars[paramInt2] != paramArrayOfChar[paramInt1]) {
        return 0;
      }
      paramInt2 += 1;
      paramInt1 += 1;
    }
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.text.StrMatcher.StringMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */