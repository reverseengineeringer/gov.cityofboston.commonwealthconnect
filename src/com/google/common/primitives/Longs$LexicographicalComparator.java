package com.google.common.primitives;

import java.util.Comparator;

 enum Longs$LexicographicalComparator
  implements Comparator<long[]>
{
  INSTANCE;
  
  private Longs$LexicographicalComparator() {}
  
  public int compare(long[] paramArrayOfLong1, long[] paramArrayOfLong2)
  {
    int j = Math.min(paramArrayOfLong1.length, paramArrayOfLong2.length);
    int i = 0;
    while (i < j)
    {
      int k = Longs.compare(paramArrayOfLong1[i], paramArrayOfLong2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfLong1.length - paramArrayOfLong2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Longs.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */