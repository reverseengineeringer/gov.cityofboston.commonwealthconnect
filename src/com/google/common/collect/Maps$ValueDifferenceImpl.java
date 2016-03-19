package com.google.common.collect;

import com.google.common.base.Objects;
import javax.annotation.Nullable;

class Maps$ValueDifferenceImpl<V>
  implements MapDifference.ValueDifference<V>
{
  private final V left;
  private final V right;
  
  private Maps$ValueDifferenceImpl(@Nullable V paramV1, @Nullable V paramV2)
  {
    left = paramV1;
    right = paramV2;
  }
  
  static <V> MapDifference.ValueDifference<V> create(@Nullable V paramV1, @Nullable V paramV2)
  {
    return new ValueDifferenceImpl(paramV1, paramV2);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof MapDifference.ValueDifference))
    {
      paramObject = (MapDifference.ValueDifference)paramObject;
      bool1 = bool2;
      if (Objects.equal(left, ((MapDifference.ValueDifference)paramObject).leftValue()))
      {
        bool1 = bool2;
        if (Objects.equal(right, ((MapDifference.ValueDifference)paramObject).rightValue())) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { left, right });
  }
  
  public V leftValue()
  {
    return (V)left;
  }
  
  public V rightValue()
  {
    return (V)right;
  }
  
  public String toString()
  {
    return "(" + left + ", " + right + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.ValueDifferenceImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */