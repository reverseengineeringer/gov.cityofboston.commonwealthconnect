package com.google.common.primitives;

import java.util.Comparator;

 enum Doubles$LexicographicalComparator
  implements Comparator<double[]>
{
  INSTANCE;
  
  private Doubles$LexicographicalComparator() {}
  
  public int compare(double[] paramArrayOfDouble1, double[] paramArrayOfDouble2)
  {
    int j = Math.min(paramArrayOfDouble1.length, paramArrayOfDouble2.length);
    int i = 0;
    while (i < j)
    {
      int k = Doubles.compare(paramArrayOfDouble1[i], paramArrayOfDouble2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfDouble1.length - paramArrayOfDouble2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Doubles.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */