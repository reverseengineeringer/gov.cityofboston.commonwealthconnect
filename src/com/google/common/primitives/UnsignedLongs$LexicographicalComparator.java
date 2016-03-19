package com.google.common.primitives;

import java.util.Comparator;

 enum UnsignedLongs$LexicographicalComparator
  implements Comparator<long[]>
{
  INSTANCE;
  
  private UnsignedLongs$LexicographicalComparator() {}
  
  public int compare(long[] paramArrayOfLong1, long[] paramArrayOfLong2)
  {
    int j = Math.min(paramArrayOfLong1.length, paramArrayOfLong2.length);
    int i = 0;
    while (i < j)
    {
      if (paramArrayOfLong1[i] != paramArrayOfLong2[i]) {
        return UnsignedLongs.compare(paramArrayOfLong1[i], paramArrayOfLong2[i]);
      }
      i += 1;
    }
    return paramArrayOfLong1.length - paramArrayOfLong2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.UnsignedLongs.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */