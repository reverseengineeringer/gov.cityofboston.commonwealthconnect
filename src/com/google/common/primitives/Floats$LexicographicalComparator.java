package com.google.common.primitives;

import java.util.Comparator;

 enum Floats$LexicographicalComparator
  implements Comparator<float[]>
{
  INSTANCE;
  
  private Floats$LexicographicalComparator() {}
  
  public int compare(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    int j = Math.min(paramArrayOfFloat1.length, paramArrayOfFloat2.length);
    int i = 0;
    while (i < j)
    {
      int k = Floats.compare(paramArrayOfFloat1[i], paramArrayOfFloat2[i]);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return paramArrayOfFloat1.length - paramArrayOfFloat2.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Floats.LexicographicalComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */