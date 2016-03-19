package com.google.common.math;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;

@GwtIncompatible("com.google.common.math.DoubleUtils")
final class DoubleMath$MeanAccumulator
{
  private long count = 0L;
  private double mean = 0.0D;
  
  void add(double paramDouble)
  {
    Preconditions.checkArgument(DoubleUtils.isFinite(paramDouble));
    count += 1L;
    mean += (paramDouble - mean) / count;
  }
  
  double mean()
  {
    if (count > 0L) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Cannot take mean of 0 values");
      return mean;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.math.DoubleMath.MeanAccumulator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */