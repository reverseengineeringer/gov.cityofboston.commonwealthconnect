package com.google.common.primitives;

import java.util.Comparator;

 enum Shorts$LexicographicalComparator
  implements Comparator<short[]>
{
  INSTANCE;
  
  private Shorts$LexicographicalComparator() {}
  
  public int compare(short[] paramArrayOfShort1, short[] paramArrayOfShort2)
  {
    int j = Math.min(paramArrayOfShort1.length, paramArrayOfShort2.length);
    int i = 0;
    while (i < j)
    {
      int k = Shorts.compare(paramArrayOfShort1[i], paramArrayOfShort2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfShort1.length - paramArrayOfShort2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Shorts.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */