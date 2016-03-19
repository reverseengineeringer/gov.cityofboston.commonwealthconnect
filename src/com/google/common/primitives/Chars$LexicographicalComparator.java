package com.google.common.primitives;

import java.util.Comparator;

 enum Chars$LexicographicalComparator
  implements Comparator<char[]>
{
  INSTANCE;
  
  private Chars$LexicographicalComparator() {}
  
  public int compare(char[] paramArrayOfChar1, char[] paramArrayOfChar2)
  {
    int j = Math.min(paramArrayOfChar1.length, paramArrayOfChar2.length);
    int i = 0;
    while (i < j)
    {
      int k = Chars.compare(paramArrayOfChar1[i], paramArrayOfChar2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfChar1.length - paramArrayOfChar2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Chars.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */