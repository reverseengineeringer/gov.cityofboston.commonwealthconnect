package com.google.common.primitives;

import java.util.Comparator;

 enum Booleans$LexicographicalComparator
  implements Comparator<boolean[]>
{
  INSTANCE;
  
  private Booleans$LexicographicalComparator() {}
  
  public int compare(boolean[] paramArrayOfBoolean1, boolean[] paramArrayOfBoolean2)
  {
    int j = Math.min(paramArrayOfBoolean1.length, paramArrayOfBoolean2.length);
    int i = 0;
    while (i < j)
    {
      int k = Booleans.compare(paramArrayOfBoolean1[i], paramArrayOfBoolean2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfBoolean1.length - paramArrayOfBoolean2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Booleans.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */