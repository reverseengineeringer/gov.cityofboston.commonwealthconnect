package com.google.common.collect;

import java.io.Serializable;

final class DiscreteDomain$LongDomain
  extends DiscreteDomain<Long>
  implements Serializable
{
  private static final LongDomain INSTANCE = new LongDomain();
  private static final long serialVersionUID = 0L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  public long distance(Long paramLong1, Long paramLong2)
  {
    long l2 = paramLong2.longValue() - paramLong1.longValue();
    long l1;
    if ((paramLong2.longValue() > paramLong1.longValue()) && (l2 < 0L)) {
      l1 = Long.MAX_VALUE;
    }
    do
    {
      do
      {
        return l1;
        l1 = l2;
      } while (paramLong2.longValue() >= paramLong1.longValue());
      l1 = l2;
    } while (l2 <= 0L);
    return Long.MIN_VALUE;
  }
  
  public Long maxValue()
  {
    return Long.valueOf(Long.MAX_VALUE);
  }
  
  public Long minValue()
  {
    return Long.valueOf(Long.MIN_VALUE);
  }
  
  public Long next(Long paramLong)
  {
    long l = paramLong.longValue();
    if (l == Long.MAX_VALUE) {
      return null;
    }
    return Long.valueOf(1L + l);
  }
  
  public Long previous(Long paramLong)
  {
    long l = paramLong.longValue();
    if (l == Long.MIN_VALUE) {
      return null;
    }
    return Long.valueOf(l - 1L);
  }
  
  public String toString()
  {
    return "DiscreteDomain.longs()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DiscreteDomain.LongDomain
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */