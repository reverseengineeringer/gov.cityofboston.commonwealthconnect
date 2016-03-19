package com.google.common.collect;

import java.io.Serializable;

final class DiscreteDomain$IntegerDomain
  extends DiscreteDomain<Integer>
  implements Serializable
{
  private static final IntegerDomain INSTANCE = new IntegerDomain();
  private static final long serialVersionUID = 0L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  public long distance(Integer paramInteger1, Integer paramInteger2)
  {
    return paramInteger2.intValue() - paramInteger1.intValue();
  }
  
  public Integer maxValue()
  {
    return Integer.valueOf(Integer.MAX_VALUE);
  }
  
  public Integer minValue()
  {
    return Integer.valueOf(Integer.MIN_VALUE);
  }
  
  public Integer next(Integer paramInteger)
  {
    int i = paramInteger.intValue();
    if (i == Integer.MAX_VALUE) {
      return null;
    }
    return Integer.valueOf(i + 1);
  }
  
  public Integer previous(Integer paramInteger)
  {
    int i = paramInteger.intValue();
    if (i == Integer.MIN_VALUE) {
      return null;
    }
    return Integer.valueOf(i - 1);
  }
  
  public String toString()
  {
    return "DiscreteDomain.integers()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DiscreteDomain.IntegerDomain
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */