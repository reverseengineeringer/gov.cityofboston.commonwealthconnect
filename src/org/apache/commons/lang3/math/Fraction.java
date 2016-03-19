package org.apache.commons.lang3.math;

import java.math.BigInteger;

public final class Fraction
  extends Number
  implements Comparable<Fraction>
{
  public static final Fraction FOUR_FIFTHS = new Fraction(4, 5);
  public static final Fraction ONE;
  public static final Fraction ONE_FIFTH;
  public static final Fraction ONE_HALF;
  public static final Fraction ONE_QUARTER;
  public static final Fraction ONE_THIRD;
  public static final Fraction THREE_FIFTHS;
  public static final Fraction THREE_QUARTERS;
  public static final Fraction TWO_FIFTHS;
  public static final Fraction TWO_QUARTERS;
  public static final Fraction TWO_THIRDS;
  public static final Fraction ZERO = new Fraction(0, 1);
  private static final long serialVersionUID = 65382027393090L;
  private final int denominator;
  private transient int hashCode = 0;
  private final int numerator;
  private transient String toProperString = null;
  private transient String toString = null;
  
  static
  {
    ONE = new Fraction(1, 1);
    ONE_HALF = new Fraction(1, 2);
    ONE_THIRD = new Fraction(1, 3);
    TWO_THIRDS = new Fraction(2, 3);
    ONE_QUARTER = new Fraction(1, 4);
    TWO_QUARTERS = new Fraction(2, 4);
    THREE_QUARTERS = new Fraction(3, 4);
    ONE_FIFTH = new Fraction(1, 5);
    TWO_FIFTHS = new Fraction(2, 5);
    THREE_FIFTHS = new Fraction(3, 5);
  }
  
  private Fraction(int paramInt1, int paramInt2)
  {
    numerator = paramInt1;
    denominator = paramInt2;
  }
  
  private static int addAndCheck(int paramInt1, int paramInt2)
  {
    long l = paramInt1 + paramInt2;
    if ((l < -2147483648L) || (l > 2147483647L)) {
      throw new ArithmeticException("overflow: add");
    }
    return (int)l;
  }
  
  private Fraction addSub(Fraction paramFraction, boolean paramBoolean)
  {
    if (paramFraction == null) {
      throw new IllegalArgumentException("The fraction must not be null");
    }
    if (numerator == 0)
    {
      if (paramBoolean) {
        return paramFraction;
      }
      return paramFraction.negate();
    }
    if (numerator == 0) {
      return this;
    }
    int j = greatestCommonDivisor(denominator, denominator);
    if (j == 1)
    {
      i = mulAndCheck(numerator, denominator);
      j = mulAndCheck(numerator, denominator);
      if (paramBoolean) {}
      for (i = addAndCheck(i, j);; i = subAndCheck(i, j)) {
        return new Fraction(i, mulPosAndCheck(denominator, denominator));
      }
    }
    BigInteger localBigInteger1 = BigInteger.valueOf(numerator).multiply(BigInteger.valueOf(denominator / j));
    BigInteger localBigInteger2 = BigInteger.valueOf(numerator).multiply(BigInteger.valueOf(denominator / j));
    if (paramBoolean)
    {
      localBigInteger1 = localBigInteger1.add(localBigInteger2);
      i = localBigInteger1.mod(BigInteger.valueOf(j)).intValue();
      if (i != 0) {
        break label253;
      }
    }
    label253:
    for (int i = j;; i = greatestCommonDivisor(i, j))
    {
      localBigInteger1 = localBigInteger1.divide(BigInteger.valueOf(i));
      if (localBigInteger1.bitLength() <= 31) {
        break label263;
      }
      throw new ArithmeticException("overflow: numerator too large after multiply");
      localBigInteger1 = localBigInteger1.subtract(localBigInteger2);
      break;
    }
    label263:
    return new Fraction(localBigInteger1.intValue(), mulPosAndCheck(denominator / j, denominator / i));
  }
  
  public static Fraction getFraction(double paramDouble)
  {
    if (paramDouble < 0.0D) {}
    for (int k = -1;; k = 1)
    {
      paramDouble = Math.abs(paramDouble);
      if ((paramDouble <= 2.147483647E9D) && (!Double.isNaN(paramDouble))) {
        break;
      }
      throw new ArithmeticException("The value must not be greater than Integer.MAX_VALUE or NaN");
    }
    int i6 = (int)paramDouble;
    double d5 = paramDouble - i6;
    int n = 0;
    int i1 = 1;
    int i = 1;
    int j = 0;
    int i4 = (int)d5;
    double d2 = 1.0D;
    paramDouble = d5 - i4;
    double d1 = Double.MAX_VALUE;
    int m = 1;
    int i2;
    int i5;
    int i3;
    do
    {
      double d3 = d2;
      i2 = (int)(d3 / paramDouble);
      double d6 = i2;
      i5 = i4 * i + n;
      n = i4 * j + i1;
      double d4 = Math.abs(d5 - i5 / n);
      i4 = i2;
      d2 = paramDouble;
      paramDouble = d3 - d6 * paramDouble;
      i2 = i;
      i3 = j;
      i = i5;
      j = n;
      i5 = m + 1;
      if ((d1 <= d4) || (n > 10000) || (n <= 0)) {
        break;
      }
      d1 = d4;
      i1 = i3;
      m = i5;
      n = i2;
    } while (i5 < 25);
    if (i5 == 25) {
      throw new ArithmeticException("Unable to convert double to fraction");
    }
    return getReducedFraction((i6 * i3 + i2) * k, i3);
  }
  
  public static Fraction getFraction(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0) {
      throw new ArithmeticException("The denominator must not be zero");
    }
    int j = paramInt1;
    int i = paramInt2;
    if (paramInt2 < 0)
    {
      if ((paramInt1 == Integer.MIN_VALUE) || (paramInt2 == Integer.MIN_VALUE)) {
        throw new ArithmeticException("overflow: can't negate");
      }
      j = -paramInt1;
      i = -paramInt2;
    }
    return new Fraction(j, i);
  }
  
  public static Fraction getFraction(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt3 == 0) {
      throw new ArithmeticException("The denominator must not be zero");
    }
    if (paramInt3 < 0) {
      throw new ArithmeticException("The denominator must not be negative");
    }
    if (paramInt2 < 0) {
      throw new ArithmeticException("The numerator must not be negative");
    }
    if (paramInt1 < 0) {}
    for (long l = paramInt1 * paramInt3 - paramInt2; (l < -2147483648L) || (l > 2147483647L); l = paramInt1 * paramInt3 + paramInt2) {
      throw new ArithmeticException("Numerator too large to represent as an Integer.");
    }
    return new Fraction((int)l, paramInt3);
  }
  
  public static Fraction getFraction(String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("The string must not be null");
    }
    if (paramString.indexOf('.') >= 0) {
      return getFraction(Double.parseDouble(paramString));
    }
    int j = paramString.indexOf(' ');
    if (j > 0)
    {
      i = Integer.parseInt(paramString.substring(0, j));
      paramString = paramString.substring(j + 1);
      j = paramString.indexOf('/');
      if (j < 0) {
        throw new NumberFormatException("The fraction could not be parsed as the format X Y/Z");
      }
      return getFraction(i, Integer.parseInt(paramString.substring(0, j)), Integer.parseInt(paramString.substring(j + 1)));
    }
    int i = paramString.indexOf('/');
    if (i < 0) {
      return getFraction(Integer.parseInt(paramString), 1);
    }
    return getFraction(Integer.parseInt(paramString.substring(0, i)), Integer.parseInt(paramString.substring(i + 1)));
  }
  
  public static Fraction getReducedFraction(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0) {
      throw new ArithmeticException("The denominator must not be zero");
    }
    if (paramInt1 == 0) {
      return ZERO;
    }
    int j = paramInt1;
    int i = paramInt2;
    if (paramInt2 == Integer.MIN_VALUE)
    {
      j = paramInt1;
      i = paramInt2;
      if ((paramInt1 & 0x1) == 0)
      {
        j = paramInt1 / 2;
        i = paramInt2 / 2;
      }
    }
    paramInt2 = j;
    paramInt1 = i;
    if (i < 0)
    {
      if ((j == Integer.MIN_VALUE) || (i == Integer.MIN_VALUE)) {
        throw new ArithmeticException("overflow: can't negate");
      }
      paramInt2 = -j;
      paramInt1 = -i;
    }
    i = greatestCommonDivisor(paramInt2, paramInt1);
    return new Fraction(paramInt2 / i, paramInt1 / i);
  }
  
  private static int greatestCommonDivisor(int paramInt1, int paramInt2)
  {
    int j = 1;
    if ((paramInt1 == 0) || (paramInt2 == 0))
    {
      if ((paramInt1 == Integer.MIN_VALUE) || (paramInt2 == Integer.MIN_VALUE)) {
        throw new ArithmeticException("overflow: gcd is 2^31");
      }
      i = Math.abs(paramInt1) + Math.abs(paramInt2);
    }
    do
    {
      do
      {
        return i;
        i = j;
      } while (Math.abs(paramInt1) == 1);
      i = j;
    } while (Math.abs(paramInt2) == 1);
    int i = paramInt1;
    if (paramInt1 > 0) {
      i = -paramInt1;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > 0) {
      paramInt1 = -paramInt2;
    }
    j = 0;
    paramInt2 = paramInt1;
    while (((i & 0x1) == 0) && ((paramInt2 & 0x1) == 0) && (j < 31))
    {
      i /= 2;
      paramInt2 /= 2;
      j += 1;
    }
    if (j == 31) {
      throw new ArithmeticException("overflow: gcd is 2^31");
    }
    if ((i & 0x1) == 1) {
      paramInt1 = paramInt2;
    }
    while ((paramInt1 & 0x1) == 0)
    {
      paramInt1 /= 2;
      continue;
      paramInt1 = -(i / 2);
    }
    int k;
    if (paramInt1 > 0) {
      k = -paramInt1;
    }
    for (;;)
    {
      int m = (paramInt2 - k) / 2;
      paramInt1 = m;
      i = k;
      if (m != 0) {
        break;
      }
      return (1 << j) * -k;
      k = i;
      paramInt2 = paramInt1;
    }
  }
  
  private static int mulAndCheck(int paramInt1, int paramInt2)
  {
    long l = paramInt1 * paramInt2;
    if ((l < -2147483648L) || (l > 2147483647L)) {
      throw new ArithmeticException("overflow: mul");
    }
    return (int)l;
  }
  
  private static int mulPosAndCheck(int paramInt1, int paramInt2)
  {
    long l = paramInt1 * paramInt2;
    if (l > 2147483647L) {
      throw new ArithmeticException("overflow: mulPos");
    }
    return (int)l;
  }
  
  private static int subAndCheck(int paramInt1, int paramInt2)
  {
    long l = paramInt1 - paramInt2;
    if ((l < -2147483648L) || (l > 2147483647L)) {
      throw new ArithmeticException("overflow: add");
    }
    return (int)l;
  }
  
  public Fraction abs()
  {
    if (numerator >= 0) {
      return this;
    }
    return negate();
  }
  
  public Fraction add(Fraction paramFraction)
  {
    return addSub(paramFraction, true);
  }
  
  public int compareTo(Fraction paramFraction)
  {
    if (this == paramFraction) {}
    long l1;
    long l2;
    do
    {
      do
      {
        return 0;
      } while ((numerator == numerator) && (denominator == denominator));
      l1 = numerator * denominator;
      l2 = numerator * denominator;
    } while (l1 == l2);
    if (l1 < l2) {
      return -1;
    }
    return 1;
  }
  
  public Fraction divideBy(Fraction paramFraction)
  {
    if (paramFraction == null) {
      throw new IllegalArgumentException("The fraction must not be null");
    }
    if (numerator == 0) {
      throw new ArithmeticException("The fraction to divide by must not be zero");
    }
    return multiplyBy(paramFraction.invert());
  }
  
  public double doubleValue()
  {
    return numerator / denominator;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof Fraction)) {
        return false;
      }
      paramObject = (Fraction)paramObject;
    } while ((getNumerator() == ((Fraction)paramObject).getNumerator()) && (getDenominator() == ((Fraction)paramObject).getDenominator()));
    return false;
  }
  
  public float floatValue()
  {
    return numerator / denominator;
  }
  
  public int getDenominator()
  {
    return denominator;
  }
  
  public int getNumerator()
  {
    return numerator;
  }
  
  public int getProperNumerator()
  {
    return Math.abs(numerator % denominator);
  }
  
  public int getProperWhole()
  {
    return numerator / denominator;
  }
  
  public int hashCode()
  {
    if (hashCode == 0) {
      hashCode = ((getNumerator() + 629) * 37 + getDenominator());
    }
    return hashCode;
  }
  
  public int intValue()
  {
    return numerator / denominator;
  }
  
  public Fraction invert()
  {
    if (numerator == 0) {
      throw new ArithmeticException("Unable to invert zero.");
    }
    if (numerator == Integer.MIN_VALUE) {
      throw new ArithmeticException("overflow: can't negate numerator");
    }
    if (numerator < 0) {
      return new Fraction(-denominator, -numerator);
    }
    return new Fraction(denominator, numerator);
  }
  
  public long longValue()
  {
    return numerator / denominator;
  }
  
  public Fraction multiplyBy(Fraction paramFraction)
  {
    if (paramFraction == null) {
      throw new IllegalArgumentException("The fraction must not be null");
    }
    if ((numerator == 0) || (numerator == 0)) {
      return ZERO;
    }
    int i = greatestCommonDivisor(numerator, denominator);
    int j = greatestCommonDivisor(numerator, denominator);
    return getReducedFraction(mulAndCheck(numerator / i, numerator / j), mulPosAndCheck(denominator / j, denominator / i));
  }
  
  public Fraction negate()
  {
    if (numerator == Integer.MIN_VALUE) {
      throw new ArithmeticException("overflow: too large to negate");
    }
    return new Fraction(-numerator, denominator);
  }
  
  public Fraction pow(int paramInt)
  {
    if (paramInt == 1) {
      return this;
    }
    if (paramInt == 0) {
      return ONE;
    }
    if (paramInt < 0)
    {
      if (paramInt == Integer.MIN_VALUE) {
        return invert().pow(2).pow(-(paramInt / 2));
      }
      return invert().pow(-paramInt);
    }
    Fraction localFraction = multiplyBy(this);
    if (paramInt % 2 == 0) {
      return localFraction.pow(paramInt / 2);
    }
    return localFraction.pow(paramInt / 2).multiplyBy(this);
  }
  
  public Fraction reduce()
  {
    if (numerator == 0) {
      if (!equals(ZERO)) {}
    }
    int i;
    do
    {
      return this;
      return ZERO;
      i = greatestCommonDivisor(Math.abs(numerator), denominator);
    } while (i == 1);
    return getFraction(numerator / i, denominator / i);
  }
  
  public Fraction subtract(Fraction paramFraction)
  {
    return addSub(paramFraction, false);
  }
  
  public String toProperString()
  {
    if (toProperString == null)
    {
      if (numerator != 0) {
        break label26;
      }
      toProperString = "0";
    }
    for (;;)
    {
      return toProperString;
      label26:
      if (numerator == denominator)
      {
        toProperString = "1";
      }
      else if (numerator == denominator * -1)
      {
        toProperString = "-1";
      }
      else
      {
        int i;
        if (numerator > 0) {
          i = -numerator;
        }
        for (;;)
        {
          if (i < -denominator)
          {
            i = getProperNumerator();
            if (i == 0)
            {
              toProperString = Integer.toString(getProperWhole());
              break;
              i = numerator;
              continue;
            }
            toProperString = (32 + getProperWhole() + ' ' + i + '/' + getDenominator());
            break;
          }
        }
        toProperString = (32 + getNumerator() + '/' + getDenominator());
      }
    }
  }
  
  public String toString()
  {
    if (toString == null) {
      toString = (32 + getNumerator() + '/' + getDenominator());
    }
    return toString;
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.math.Fraction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */