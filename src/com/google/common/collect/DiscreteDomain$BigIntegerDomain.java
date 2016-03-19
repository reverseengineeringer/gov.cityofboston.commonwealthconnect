package com.google.common.collect;

import java.io.Serializable;
import java.math.BigInteger;

final class DiscreteDomain$BigIntegerDomain
  extends DiscreteDomain<BigInteger>
  implements Serializable
{
  private static final BigIntegerDomain INSTANCE = new BigIntegerDomain();
  private static final BigInteger MAX_LONG = BigInteger.valueOf(Long.MAX_VALUE);
  private static final BigInteger MIN_LONG = BigInteger.valueOf(Long.MIN_VALUE);
  private static final long serialVersionUID = 0L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  public long distance(BigInteger paramBigInteger1, BigInteger paramBigInteger2)
  {
    return paramBigInteger2.subtract(paramBigInteger1).max(MIN_LONG).min(MAX_LONG).longValue();
  }
  
  public BigInteger next(BigInteger paramBigInteger)
  {
    return paramBigInteger.add(BigInteger.ONE);
  }
  
  public BigInteger previous(BigInteger paramBigInteger)
  {
    return paramBigInteger.subtract(BigInteger.ONE);
  }
  
  public String toString()
  {
    return "DiscreteDomain.bigIntegers()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DiscreteDomain.BigIntegerDomain
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */