package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.io.Serializable;
import javax.annotation.Nullable;

@Beta
public final class BloomFilter<T>
  implements Predicate<T>, Serializable
{
  private static final Strategy DEFAULT_STRATEGY = ;
  @VisibleForTesting
  static final String USE_MITZ32_PROPERTY = "com.google.common.hash.BloomFilter.useMitz32";
  private final BloomFilterStrategies.BitArray bits;
  private final Funnel<T> funnel;
  private final int numHashFunctions;
  private final Strategy strategy;
  
  private BloomFilter(BloomFilterStrategies.BitArray paramBitArray, int paramInt, Funnel<T> paramFunnel, Strategy paramStrategy)
  {
    if (paramInt > 0)
    {
      bool = true;
      Preconditions.checkArgument(bool, "numHashFunctions (%s) must be > 0", new Object[] { Integer.valueOf(paramInt) });
      if (paramInt > 255) {
        break label103;
      }
    }
    label103:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "numHashFunctions (%s) must be <= 255", new Object[] { Integer.valueOf(paramInt) });
      bits = ((BloomFilterStrategies.BitArray)Preconditions.checkNotNull(paramBitArray));
      numHashFunctions = paramInt;
      funnel = ((Funnel)Preconditions.checkNotNull(paramFunnel));
      strategy = ((Strategy)Preconditions.checkNotNull(paramStrategy));
      return;
      bool = false;
      break;
    }
  }
  
  public static <T> BloomFilter<T> create(Funnel<T> paramFunnel, int paramInt)
  {
    return create(paramFunnel, paramInt, 0.03D);
  }
  
  public static <T> BloomFilter<T> create(Funnel<T> paramFunnel, int paramInt, double paramDouble)
  {
    return create(paramFunnel, paramInt, paramDouble, DEFAULT_STRATEGY);
  }
  
  @VisibleForTesting
  static <T> BloomFilter<T> create(Funnel<T> paramFunnel, int paramInt, double paramDouble, Strategy paramStrategy)
  {
    Preconditions.checkNotNull(paramFunnel);
    if (paramInt >= 0)
    {
      bool = true;
      Preconditions.checkArgument(bool, "Expected insertions (%s) must be >= 0", new Object[] { Integer.valueOf(paramInt) });
      if (paramDouble <= 0.0D) {
        break label147;
      }
      bool = true;
      label39:
      Preconditions.checkArgument(bool, "False positive probability (%s) must be > 0.0", new Object[] { Double.valueOf(paramDouble) });
      if (paramDouble >= 1.0D) {
        break label153;
      }
    }
    label147:
    label153:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "False positive probability (%s) must be < 1.0", new Object[] { Double.valueOf(paramDouble) });
      Preconditions.checkNotNull(paramStrategy);
      int i = paramInt;
      if (paramInt == 0) {
        i = 1;
      }
      l = optimalNumOfBits(i, paramDouble);
      paramInt = optimalNumOfHashFunctions(i, l);
      try
      {
        paramFunnel = new BloomFilter(new BloomFilterStrategies.BitArray(l), paramInt, paramFunnel, paramStrategy);
        return paramFunnel;
      }
      catch (IllegalArgumentException paramFunnel)
      {
        throw new IllegalArgumentException("Could not create BloomFilter of " + l + " bits", paramFunnel);
      }
      bool = false;
      break;
      bool = false;
      break label39;
    }
  }
  
  @VisibleForTesting
  static Strategy getDefaultStrategyFromSystemProperty()
  {
    if (Boolean.parseBoolean(System.getProperty("com.google.common.hash.BloomFilter.useMitz32"))) {
      return BloomFilterStrategies.MURMUR128_MITZ_32;
    }
    return BloomFilterStrategies.MURMUR128_MITZ_64;
  }
  
  @VisibleForTesting
  static long optimalNumOfBits(long paramLong, double paramDouble)
  {
    double d = paramDouble;
    if (paramDouble == 0.0D) {
      d = Double.MIN_VALUE;
    }
    return (-paramLong * Math.log(d) / (Math.log(2.0D) * Math.log(2.0D)));
  }
  
  @VisibleForTesting
  static int optimalNumOfHashFunctions(long paramLong1, long paramLong2)
  {
    return Math.max(1, (int)Math.round(paramLong2 / paramLong1 * Math.log(2.0D)));
  }
  
  private Object writeReplace()
  {
    return new SerialForm(this);
  }
  
  @Deprecated
  public boolean apply(T paramT)
  {
    return mightContain(paramT);
  }
  
  @VisibleForTesting
  long bitSize()
  {
    return bits.bitSize();
  }
  
  public BloomFilter<T> copy()
  {
    return new BloomFilter(bits.copy(), numHashFunctions, funnel, strategy);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof BloomFilter)) {
        break;
      }
      paramObject = (BloomFilter)paramObject;
    } while ((numHashFunctions == numHashFunctions) && (funnel.equals(funnel)) && (bits.equals(bits)) && (strategy.equals(strategy)));
    return false;
    return false;
  }
  
  public double expectedFpp()
  {
    return Math.pow(bits.bitCount() / bitSize(), numHashFunctions);
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { Integer.valueOf(numHashFunctions), funnel, strategy, bits });
  }
  
  public boolean isCompatible(BloomFilter<T> paramBloomFilter)
  {
    Preconditions.checkNotNull(paramBloomFilter);
    return (this != paramBloomFilter) && (numHashFunctions == numHashFunctions) && (bitSize() == paramBloomFilter.bitSize()) && (strategy.equals(strategy)) && (funnel.equals(funnel));
  }
  
  public boolean mightContain(T paramT)
  {
    return strategy.mightContain(paramT, funnel, numHashFunctions, bits);
  }
  
  public boolean put(T paramT)
  {
    return strategy.put(paramT, funnel, numHashFunctions, bits);
  }
  
  public void putAll(BloomFilter<T> paramBloomFilter)
  {
    Preconditions.checkNotNull(paramBloomFilter);
    if (this != paramBloomFilter)
    {
      bool = true;
      Preconditions.checkArgument(bool, "Cannot combine a BloomFilter with itself.");
      if (numHashFunctions != numHashFunctions) {
        break label192;
      }
      bool = true;
      label31:
      Preconditions.checkArgument(bool, "BloomFilters must have the same number of hash functions (%s != %s)", new Object[] { Integer.valueOf(numHashFunctions), Integer.valueOf(numHashFunctions) });
      if (bitSize() != paramBloomFilter.bitSize()) {
        break label197;
      }
    }
    label192:
    label197:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "BloomFilters must have the same size underlying bit arrays (%s != %s)", new Object[] { Long.valueOf(bitSize()), Long.valueOf(paramBloomFilter.bitSize()) });
      Preconditions.checkArgument(strategy.equals(strategy), "BloomFilters must have equal strategies (%s != %s)", new Object[] { strategy, strategy });
      Preconditions.checkArgument(funnel.equals(funnel), "BloomFilters must have equal funnels (%s != %s)", new Object[] { funnel, funnel });
      bits.putAll(bits);
      return;
      bool = false;
      break;
      bool = false;
      break label31;
    }
  }
  
  private static class SerialForm<T>
    implements Serializable
  {
    private static final long serialVersionUID = 1L;
    final long[] data;
    final Funnel<T> funnel;
    final int numHashFunctions;
    final BloomFilter.Strategy strategy;
    
    SerialForm(BloomFilter<T> paramBloomFilter)
    {
      data = bits.data;
      numHashFunctions = numHashFunctions;
      funnel = funnel;
      strategy = strategy;
    }
    
    Object readResolve()
    {
      return new BloomFilter(new BloomFilterStrategies.BitArray(data), numHashFunctions, funnel, strategy, null);
    }
  }
  
  static abstract interface Strategy
    extends Serializable
  {
    public abstract <T> boolean mightContain(T paramT, Funnel<? super T> paramFunnel, int paramInt, BloomFilterStrategies.BitArray paramBitArray);
    
    public abstract int ordinal();
    
    public abstract <T> boolean put(T paramT, Funnel<? super T> paramFunnel, int paramInt, BloomFilterStrategies.BitArray paramBitArray);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.BloomFilter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */