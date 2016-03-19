package com.google.common.math;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.math.RoundingMode;

@GwtCompatible(emulated=true)
public final class LongMath
{
  @VisibleForTesting
  static final long FLOOR_SQRT_MAX_LONG = 3037000499L;
  @VisibleForTesting
  static final long MAX_POWER_OF_SQRT2_UNSIGNED = -5402926248376769404L;
  static final int[] biggestBinomials = { Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, 3810779, 121977, 16175, 4337, 1733, 887, 534, 361, 265, 206, 169, 143, 125, 111, 101, 94, 88, 83, 79, 76, 74, 72, 70, 69, 68, 67, 67, 66, 66, 66, 66 };
  @VisibleForTesting
  static final int[] biggestSimpleBinomials = { Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, 2642246, 86251, 11724, 3218, 1313, 684, 419, 287, 214, 169, 139, 119, 105, 95, 87, 81, 76, 73, 70, 68, 66, 64, 63, 62, 62, 61, 61, 61 };
  static final long[] factorials;
  @GwtIncompatible("TODO")
  @VisibleForTesting
  static final long[] halfPowersOf10;
  @VisibleForTesting
  static final byte[] maxLog10ForLeadingZeros = { 19, 18, 18, 18, 18, 17, 17, 17, 16, 16, 16, 15, 15, 15, 15, 14, 14, 14, 13, 13, 13, 12, 12, 12, 12, 11, 11, 11, 10, 10, 10, 9, 9, 9, 9, 8, 8, 8, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0 };
  @GwtIncompatible("TODO")
  @VisibleForTesting
  static final long[] powersOf10 = { 1L, 10L, 100L, 1000L, 10000L, 100000L, 1000000L, 10000000L, 100000000L, 1000000000L, 10000000000L, 100000000000L, 1000000000000L, 10000000000000L, 100000000000000L, 1000000000000000L, 10000000000000000L, 100000000000000000L, 1000000000000000000L };
  
  static
  {
    halfPowersOf10 = new long[] { 3L, 31L, 316L, 3162L, 31622L, 316227L, 3162277L, 31622776L, 316227766L, 3162277660L, 31622776601L, 316227766016L, 3162277660168L, 31622776601683L, 316227766016837L, 3162277660168379L, 31622776601683793L, 316227766016837933L, 3162277660168379331L };
    factorials = new long[] { 1L, 1L, 2L, 6L, 24L, 120L, 720L, 5040L, 40320L, 362880L, 3628800L, 39916800L, 479001600L, 6227020800L, 87178291200L, 1307674368000L, 20922789888000L, 355687428096000L, 6402373705728000L, 121645100408832000L, 2432902008176640000L };
  }
  
  public static long binomial(int paramInt1, int paramInt2)
  {
    MathPreconditions.checkNonNegative("n", paramInt1);
    MathPreconditions.checkNonNegative("k", paramInt2);
    if (paramInt2 <= paramInt1) {}
    int i;
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "k (%s) > n (%s)", new Object[] { Integer.valueOf(paramInt2), Integer.valueOf(paramInt1) });
      i = paramInt2;
      if (paramInt2 > paramInt1 >> 1) {
        i = paramInt1 - paramInt2;
      }
      switch (i)
      {
      default: 
        if (paramInt1 >= factorials.length) {
          break label127;
        }
        l2 = factorials[paramInt1] / (factorials[i] * factorials[(paramInt1 - i)]);
        return l2;
      }
    }
    return 1L;
    return paramInt1;
    label127:
    if ((i >= biggestBinomials.length) || (paramInt1 > biggestBinomials[i])) {
      return Long.MAX_VALUE;
    }
    if ((i < biggestSimpleBinomials.length) && (paramInt1 <= biggestSimpleBinomials[i]))
    {
      l1 = paramInt1;
      j = 2;
      paramInt2 = paramInt1 - 1;
      paramInt1 = j;
      for (;;)
      {
        l2 = l1;
        if (paramInt1 > i) {
          break;
        }
        l1 = l1 * paramInt2 / paramInt1;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
    }
    paramInt2 = log2(paramInt1, RoundingMode.CEILING);
    long l3 = 1L;
    long l2 = paramInt1;
    long l1 = 1L;
    int k = paramInt2;
    int m = 2;
    int j = paramInt1 - 1;
    paramInt1 = k;
    k = m;
    if (k <= i)
    {
      if (paramInt1 + paramInt2 < 63)
      {
        l2 *= j;
        l1 *= k;
        paramInt1 += paramInt2;
      }
      for (;;)
      {
        k += 1;
        j -= 1;
        break;
        l3 = multiplyFraction(l3, l2, l1);
        l2 = j;
        l1 = k;
        paramInt1 = paramInt2;
      }
    }
    return multiplyFraction(l3, l2, l1);
  }
  
  @GwtIncompatible("TODO")
  public static long checkedAdd(long paramLong1, long paramLong2)
  {
    int j = 1;
    long l = paramLong1 + paramLong2;
    int i;
    if ((paramLong1 ^ paramLong2) < 0L)
    {
      i = 1;
      if ((paramLong1 ^ l) < 0L) {
        break label45;
      }
    }
    for (;;)
    {
      MathPreconditions.checkNoOverflow(j | i);
      return l;
      i = 0;
      break;
      label45:
      j = 0;
    }
  }
  
  @GwtIncompatible("TODO")
  public static long checkedMultiply(long paramLong1, long paramLong2)
  {
    boolean bool2 = false;
    int i = Long.numberOfLeadingZeros(paramLong1) + Long.numberOfLeadingZeros(paramLong1 ^ 0xFFFFFFFFFFFFFFFF) + Long.numberOfLeadingZeros(paramLong2) + Long.numberOfLeadingZeros(paramLong2 ^ 0xFFFFFFFFFFFFFFFF);
    if (i > 65) {
      return paramLong1 * paramLong2;
    }
    boolean bool1;
    if (i >= 64)
    {
      bool1 = true;
      MathPreconditions.checkNoOverflow(bool1);
      if (paramLong1 < 0L) {
        break label127;
      }
      i = 1;
      label67:
      if (paramLong2 == Long.MIN_VALUE) {
        break label133;
      }
    }
    label127:
    label133:
    for (int j = 1;; j = 0)
    {
      MathPreconditions.checkNoOverflow(j | i);
      long l = paramLong1 * paramLong2;
      if (paramLong1 != 0L)
      {
        bool1 = bool2;
        if (l / paramLong1 != paramLong2) {}
      }
      else
      {
        bool1 = true;
      }
      MathPreconditions.checkNoOverflow(bool1);
      return l;
      bool1 = false;
      break;
      i = 0;
      break label67;
    }
  }
  
  @GwtIncompatible("TODO")
  public static long checkedPow(long paramLong, int paramInt)
  {
    boolean bool = true;
    MathPreconditions.checkNonNegative("exponent", paramInt);
    int i;
    int j;
    if (paramLong >= -2L)
    {
      i = 1;
      if (paramLong > 2L) {
        break label89;
      }
      j = 1;
    }
    for (;;)
    {
      if ((j & i) != 0) {
        switch ((int)paramLong)
        {
        default: 
          throw new AssertionError();
          i = 0;
          break;
          j = 0;
          break;
        case 0: 
          if (paramInt != 0) {}
        case 1: 
        case -1: 
          do
          {
            return 1L;
            return 0L;
          } while ((paramInt & 0x1) == 0);
          return -1L;
        case 2: 
          if (paramInt < 63) {}
          for (bool = true;; bool = false)
          {
            MathPreconditions.checkNoOverflow(bool);
            return 1L << paramInt;
          }
        case -2: 
          label89:
          if (paramInt < 64) {}
          for (;;)
          {
            MathPreconditions.checkNoOverflow(bool);
            if ((paramInt & 0x1) != 0) {
              break;
            }
            return 1L << paramInt;
            bool = false;
          }
          return -1L << paramInt;
        }
      }
    }
    long l1 = 1L;
    long l2;
    do
    {
      switch (paramInt)
      {
      default: 
        l2 = l1;
        if ((paramInt & 0x1) != 0) {
          l2 = checkedMultiply(l1, paramLong);
        }
        i = paramInt >> 1;
        l1 = l2;
        paramInt = i;
      }
    } while (i <= 0);
    if (paramLong <= 3037000499L) {}
    for (bool = true;; bool = false)
    {
      MathPreconditions.checkNoOverflow(bool);
      paramLong *= paramLong;
      l1 = l2;
      paramInt = i;
      break;
      return l1;
      return checkedMultiply(l1, paramLong);
    }
  }
  
  @GwtIncompatible("TODO")
  public static long checkedSubtract(long paramLong1, long paramLong2)
  {
    int j = 1;
    long l = paramLong1 - paramLong2;
    int i;
    if ((paramLong1 ^ paramLong2) >= 0L)
    {
      i = 1;
      if ((paramLong1 ^ l) < 0L) {
        break label45;
      }
    }
    for (;;)
    {
      MathPreconditions.checkNoOverflow(j | i);
      return l;
      i = 0;
      break;
      label45:
      j = 0;
    }
  }
  
  @GwtIncompatible("TODO")
  public static long divide(long paramLong1, long paramLong2, RoundingMode paramRoundingMode)
  {
    Preconditions.checkNotNull(paramRoundingMode);
    long l1 = paramLong1 / paramLong2;
    long l2 = paramLong1 - paramLong2 * l1;
    if (l2 == 0L) {
      return l1;
    }
    int m = (int)((paramLong1 ^ paramLong2) >> 63) | 0x1;
    boolean bool;
    switch (paramRoundingMode)
    {
    default: 
      throw new AssertionError();
    case ???: 
      if (l2 == 0L)
      {
        bool = true;
        MathPreconditions.checkRoundingUnnecessary(bool);
      }
    case ???: 
    case ???: 
      for (i = 0; i != 0; i = 1)
      {
        return l1 + m;
        bool = false;
        break label114;
      }
    case ???: 
      if (m > 0) {}
      for (i = 1;; i = 0) {
        break;
      }
    case ???: 
      label114:
      if (m < 0) {}
      for (i = 1;; i = 0) {
        break;
      }
    }
    paramLong1 = Math.abs(l2);
    paramLong1 -= Math.abs(paramLong2) - paramLong1;
    if (paramLong1 == 0L)
    {
      label212:
      int j;
      if (paramRoundingMode == RoundingMode.HALF_UP)
      {
        i = 1;
        if (paramRoundingMode != RoundingMode.HALF_EVEN) {
          break label254;
        }
        j = 1;
        label223:
        if ((1L & l1) == 0L) {
          break label260;
        }
      }
      label254:
      label260:
      for (int k = 1;; k = 0)
      {
        i |= k & j;
        break;
        i = 0;
        break label212;
        j = 0;
        break label223;
      }
    }
    if (paramLong1 > 0L) {}
    for (int i = 1;; i = 0) {
      break;
    }
  }
  
  @GwtIncompatible("TODO")
  public static long factorial(int paramInt)
  {
    MathPreconditions.checkNonNegative("n", paramInt);
    if (paramInt < factorials.length) {
      return factorials[paramInt];
    }
    return Long.MAX_VALUE;
  }
  
  static boolean fitsInInt(long paramLong)
  {
    return (int)paramLong == paramLong;
  }
  
  public static long gcd(long paramLong1, long paramLong2)
  {
    MathPreconditions.checkNonNegative("a", paramLong1);
    MathPreconditions.checkNonNegative("b", paramLong2);
    if (paramLong1 == 0L) {
      l = paramLong2;
    }
    do
    {
      return l;
      l = paramLong1;
    } while (paramLong2 == 0L);
    int i = Long.numberOfTrailingZeros(paramLong1);
    long l = paramLong1 >> i;
    int j = Long.numberOfTrailingZeros(paramLong2);
    paramLong1 = paramLong2 >> j;
    for (paramLong2 = l; paramLong2 != paramLong1; paramLong2 = l >> Long.numberOfTrailingZeros(l))
    {
      l = paramLong2 - paramLong1;
      paramLong2 = l & l >> 63;
      l = l - paramLong2 - paramLong2;
      paramLong1 += paramLong2;
    }
    return paramLong2 << Math.min(i, j);
  }
  
  public static boolean isPowerOfTwo(long paramLong)
  {
    int j = 1;
    int i;
    if (paramLong > 0L)
    {
      i = 1;
      if ((paramLong - 1L & paramLong) != 0L) {
        break label29;
      }
    }
    for (;;)
    {
      return j & i;
      i = 0;
      break;
      label29:
      j = 0;
    }
  }
  
  @VisibleForTesting
  static int lessThanBranchFree(long paramLong1, long paramLong2)
  {
    return (int)((paramLong1 - paramLong2 ^ 0xFFFFFFFFFFFFFFFF ^ 0xFFFFFFFFFFFFFFFF) >>> 63);
  }
  
  @GwtIncompatible("TODO")
  public static int log10(long paramLong, RoundingMode paramRoundingMode)
  {
    MathPreconditions.checkPositive("x", paramLong);
    int i = log10Floor(paramLong);
    long l = powersOf10[i];
    switch (paramRoundingMode)
    {
    default: 
      throw new AssertionError();
    case ???: 
      if (paramLong != l) {
        break;
      }
    case ???: 
    case ???: 
      for (boolean bool = true;; bool = false)
      {
        MathPreconditions.checkRoundingUnnecessary(bool);
        return i;
      }
    case ???: 
    case ???: 
      return i + lessThanBranchFree(l, paramLong);
    }
    return i + lessThanBranchFree(halfPowersOf10[i], paramLong);
  }
  
  @GwtIncompatible("TODO")
  static int log10Floor(long paramLong)
  {
    int i = maxLog10ForLeadingZeros[Long.numberOfLeadingZeros(paramLong)];
    return i - lessThanBranchFree(paramLong, powersOf10[i]);
  }
  
  public static int log2(long paramLong, RoundingMode paramRoundingMode)
  {
    MathPreconditions.checkPositive("x", paramLong);
    switch (paramRoundingMode)
    {
    default: 
      throw new AssertionError("impossible");
    case ???: 
      MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(paramLong));
    case ???: 
    case ???: 
      return 63 - Long.numberOfLeadingZeros(paramLong);
    case ???: 
    case ???: 
      return 64 - Long.numberOfLeadingZeros(paramLong - 1L);
    }
    int i = Long.numberOfLeadingZeros(paramLong);
    return lessThanBranchFree(-5402926248376769404L >>> i, paramLong) + (63 - i);
  }
  
  public static long mean(long paramLong1, long paramLong2)
  {
    return (paramLong1 & paramLong2) + ((paramLong1 ^ paramLong2) >> 1);
  }
  
  @GwtIncompatible("TODO")
  public static int mod(long paramLong, int paramInt)
  {
    return (int)mod(paramLong, paramInt);
  }
  
  @GwtIncompatible("TODO")
  public static long mod(long paramLong1, long paramLong2)
  {
    if (paramLong2 <= 0L) {
      throw new ArithmeticException("Modulus must be positive");
    }
    paramLong1 %= paramLong2;
    if (paramLong1 >= 0L) {
      return paramLong1;
    }
    return paramLong1 + paramLong2;
  }
  
  static long multiplyFraction(long paramLong1, long paramLong2, long paramLong3)
  {
    if (paramLong1 == 1L) {
      return paramLong2 / paramLong3;
    }
    long l = gcd(paramLong1, paramLong3);
    paramLong1 /= l;
    return paramLong2 / (paramLong3 / l) * paramLong1;
  }
  
  @GwtIncompatible("TODO")
  public static long pow(long paramLong, int paramInt)
  {
    long l1 = 0L;
    MathPreconditions.checkNonNegative("exponent", paramInt);
    if ((-2L <= paramLong) && (paramLong <= 2L))
    {
      switch ((int)paramLong)
      {
      default: 
        throw new AssertionError();
      case 0: 
        if (paramInt != 0) {
          break;
        }
      case 1: 
      case -1: 
        do
        {
          return 1L;
          return 0L;
        } while ((paramInt & 0x1) == 0);
        return -1L;
      case 2: 
        paramLong = l1;
        if (paramInt < 64) {
          paramLong = 1L << paramInt;
        }
        return paramLong;
      }
      if (paramInt < 64)
      {
        if ((paramInt & 0x1) == 0) {
          return 1L << paramInt;
        }
        return -(1L << paramInt);
      }
      return 0L;
    }
    l1 = 1L;
    switch (paramInt)
    {
    default: 
      if ((paramInt & 0x1) != 0) {
        break;
      }
    }
    for (long l2 = 1L;; l2 = paramLong)
    {
      l1 *= l2;
      paramLong *= paramLong;
      paramInt >>= 1;
      break;
      return l1;
      return l1 * paramLong;
    }
  }
  
  @GwtIncompatible("TODO")
  public static long sqrt(long paramLong, RoundingMode paramRoundingMode)
  {
    MathPreconditions.checkNonNegative("x", paramLong);
    long l1;
    if (fitsInInt(paramLong)) {
      l1 = IntMath.sqrt((int)paramLong, paramRoundingMode);
    }
    long l2;
    long l3;
    do
    {
      do
      {
        return l1;
        l2 = Math.sqrt(paramLong);
        l3 = l2 * l2;
        switch (paramRoundingMode)
        {
        default: 
          throw new AssertionError();
        case ???: 
          if (l3 == paramLong) {}
          for (boolean bool = true;; bool = false)
          {
            MathPreconditions.checkRoundingUnnecessary(bool);
            return l2;
          }
        case ???: 
        case ???: 
          l1 = l2;
        }
      } while (paramLong >= l3);
      return l2 - 1L;
      l1 = l2;
    } while (paramLong <= l3);
    return l2 + 1L;
    if (paramLong < l3) {}
    for (int i = 1;; i = 0)
    {
      l1 = l2 - i;
      return l1 + lessThanBranchFree(l1 * l1 + l1, paramLong);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.math.LongMath
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */