package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.math.BigInteger;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
public final class UnsignedLong
  extends Number
  implements Comparable<UnsignedLong>, Serializable
{
  public static final UnsignedLong MAX_VALUE = new UnsignedLong(-1L);
  public static final UnsignedLong ONE;
  private static final long UNSIGNED_MASK = Long.MAX_VALUE;
  public static final UnsignedLong ZERO = new UnsignedLong(0L);
  private final long value;
  
  static
  {
    ONE = new UnsignedLong(1L);
  }
  
  private UnsignedLong(long paramLong)
  {
    value = paramLong;
  }
  
  public static UnsignedLong fromLongBits(long paramLong)
  {
    return new UnsignedLong(paramLong);
  }
  
  public static UnsignedLong valueOf(long paramLong)
  {
    if (paramLong >= 0L) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "value (%s) is outside the range for an unsigned long value", new Object[] { Long.valueOf(paramLong) });
      return fromLongBits(paramLong);
    }
  }
  
  public static UnsignedLong valueOf(String paramString)
  {
    return valueOf(paramString, 10);
  }
  
  public static UnsignedLong valueOf(String paramString, int paramInt)
  {
    return fromLongBits(UnsignedLongs.parseUnsignedLong(paramString, paramInt));
  }
  
  public static UnsignedLong valueOf(BigInteger paramBigInteger)
  {
    Preconditions.checkNotNull(paramBigInteger);
    if ((paramBigInteger.signum() >= 0) && (paramBigInteger.bitLength() <= 64)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "value (%s) is outside the range for an unsigned long value", new Object[] { paramBigInteger });
      return fromLongBits(paramBigInteger.longValue());
    }
  }
  
  public BigInteger bigIntegerValue()
  {
    BigInteger localBigInteger2 = BigInteger.valueOf(value & 0x7FFFFFFFFFFFFFFF);
    BigInteger localBigInteger1 = localBigInteger2;
    if (value < 0L) {
      localBigInteger1 = localBigInteger2.setBit(63);
    }
    return localBigInteger1;
  }
  
  public int compareTo(UnsignedLong paramUnsignedLong)
  {
    Preconditions.checkNotNull(paramUnsignedLong);
    return UnsignedLongs.compare(value, value);
  }
  
  @CheckReturnValue
  public UnsignedLong dividedBy(UnsignedLong paramUnsignedLong)
  {
    return fromLongBits(UnsignedLongs.divide(value, checkNotNullvalue));
  }
  
  public double doubleValue()
  {
    double d2 = value & 0x7FFFFFFFFFFFFFFF;
    double d1 = d2;
    if (value < 0L) {
      d1 = d2 + 9.223372036854776E18D;
    }
    return d1;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof UnsignedLong))
    {
      paramObject = (UnsignedLong)paramObject;
      bool1 = bool2;
      if (value == value) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public float floatValue()
  {
    float f2 = (float)(value & 0x7FFFFFFFFFFFFFFF);
    float f1 = f2;
    if (value < 0L) {
      f1 = f2 + 9.223372E18F;
    }
    return f1;
  }
  
  public int hashCode()
  {
    return Longs.hashCode(value);
  }
  
  public int intValue()
  {
    return (int)value;
  }
  
  public long longValue()
  {
    return value;
  }
  
  public UnsignedLong minus(UnsignedLong paramUnsignedLong)
  {
    return fromLongBits(value - checkNotNullvalue);
  }
  
  @CheckReturnValue
  public UnsignedLong mod(UnsignedLong paramUnsignedLong)
  {
    return fromLongBits(UnsignedLongs.remainder(value, checkNotNullvalue));
  }
  
  public UnsignedLong plus(UnsignedLong paramUnsignedLong)
  {
    long l = value;
    return fromLongBits(checkNotNullvalue + l);
  }
  
  @CheckReturnValue
  public UnsignedLong times(UnsignedLong paramUnsignedLong)
  {
    long l = value;
    return fromLongBits(checkNotNullvalue * l);
  }
  
  public String toString()
  {
    return UnsignedLongs.toString(value);
  }
  
  public String toString(int paramInt)
  {
    return UnsignedLongs.toString(value, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.UnsignedLong
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */