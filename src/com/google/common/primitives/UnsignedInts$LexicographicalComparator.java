package com.google.common.primitives;

import java.util.Comparator;

 enum UnsignedInts$LexicographicalComparator
  implements Comparator<int[]>
{
  INSTANCE;
  
  private UnsignedInts$LexicographicalComparator() {}
  
  public int compare(int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    int j = Math.min(paramArrayOfInt1.length, paramArrayOfInt2.length);
    int i = 0;
    while (i < j)
    {
      if (paramArrayOfInt1[i] != paramArrayOfInt2[i]) {
        return UnsignedInts.compare(paramArrayOfInt1[i], paramArrayOfInt2[i]);
      }
      i += 1;
    }
    return paramArrayOfInt1.length - paramArrayOfInt2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.UnsignedInts.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */