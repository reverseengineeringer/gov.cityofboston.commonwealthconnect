package com.google.common.collect;

import java.util.Comparator;
import javax.annotation.Nullable;

final class ComparisonChain$InactiveComparisonChain
  extends ComparisonChain
{
  final int result;
  
  ComparisonChain$InactiveComparisonChain(int paramInt)
  {
    super(null);
    result = paramInt;
  }
  
  public ComparisonChain compare(double paramDouble1, double paramDouble2)
  {
    return this;
  }
  
  public ComparisonChain compare(float paramFloat1, float paramFloat2)
  {
    return this;
  }
  
  public ComparisonChain compare(int paramInt1, int paramInt2)
  {
    return this;
  }
  
  public ComparisonChain compare(long paramLong1, long paramLong2)
  {
    return this;
  }
  
  public ComparisonChain compare(@Nullable Comparable paramComparable1, @Nullable Comparable paramComparable2)
  {
    return this;
  }
  
  public <T> ComparisonChain compare(@Nullable T paramT1, @Nullable T paramT2, @Nullable Comparator<T> paramComparator)
  {
    return this;
  }
  
  public ComparisonChain compareFalseFirst(boolean paramBoolean1, boolean paramBoolean2)
  {
    return this;
  }
  
  public ComparisonChain compareTrueFirst(boolean paramBoolean1, boolean paramBoolean2)
  {
    return this;
  }
  
  public int result()
  {
    return result;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ComparisonChain.InactiveComparisonChain
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */