package com.google.common.primitives;

import java.util.Comparator;

 enum Ints$LexicographicalComparator
  implements Comparator<int[]>
{
  INSTANCE;
  
  private Ints$LexicographicalComparator() {}
  
  public int compare(int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    int j = Math.min(paramArrayOfInt1.length, paramArrayOfInt2.length);
    int i = 0;
    while (i < j)
    {
      int k = Ints.compare(paramArrayOfInt1[i], paramArrayOfInt2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfInt1.length - paramArrayOfInt2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Ints.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */