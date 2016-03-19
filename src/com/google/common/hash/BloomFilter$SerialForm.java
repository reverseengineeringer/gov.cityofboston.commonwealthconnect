package com.google.common.hash;

import java.io.Serializable;

class BloomFilter$SerialForm<T>
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  final long[] data;
  final Funnel<T> funnel;
  final int numHashFunctions;
  final BloomFilter.Strategy strategy;
  
  BloomFilter$SerialForm(BloomFilter<T> paramBloomFilter)
  {
    data = access$000data;
    numHashFunctions = BloomFilter.access$100(paramBloomFilter);
    funnel = BloomFilter.access$200(paramBloomFilter);
    strategy = BloomFilter.access$300(paramBloomFilter);
  }
  
  Object readResolve()
  {
    return new BloomFilter(new BloomFilterStrategies.BitArray(data), numHashFunctions, funnel, strategy, null);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.BloomFilter.SerialForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */