package com.google.common.cache;

import com.google.common.base.Equivalence;
import com.google.common.base.Ticker;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.concurrent.TimeUnit;

class LocalCache$ManualSerializationProxy<K, V>
  extends ForwardingCache<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  final int concurrencyLevel;
  transient Cache<K, V> delegate;
  final long expireAfterAccessNanos;
  final long expireAfterWriteNanos;
  final Equivalence<Object> keyEquivalence;
  final LocalCache.Strength keyStrength;
  final CacheLoader<? super K, V> loader;
  final long maxWeight;
  final RemovalListener<? super K, ? super V> removalListener;
  final Ticker ticker;
  final Equivalence<Object> valueEquivalence;
  final LocalCache.Strength valueStrength;
  final Weigher<K, V> weigher;
  
  private LocalCache$ManualSerializationProxy(LocalCache.Strength paramStrength1, LocalCache.Strength paramStrength2, Equivalence<Object> paramEquivalence1, Equivalence<Object> paramEquivalence2, long paramLong1, long paramLong2, long paramLong3, Weigher<K, V> paramWeigher, int paramInt, RemovalListener<? super K, ? super V> paramRemovalListener, Ticker paramTicker, CacheLoader<? super K, V> paramCacheLoader)
  {
    keyStrength = paramStrength1;
    valueStrength = paramStrength2;
    keyEquivalence = paramEquivalence1;
    valueEquivalence = paramEquivalence2;
    expireAfterWriteNanos = paramLong1;
    expireAfterAccessNanos = paramLong2;
    maxWeight = paramLong3;
    weigher = paramWeigher;
    concurrencyLevel = paramInt;
    removalListener = paramRemovalListener;
    if (paramTicker != Ticker.systemTicker())
    {
      paramStrength1 = paramTicker;
      if (paramTicker != CacheBuilder.NULL_TICKER) {}
    }
    else
    {
      paramStrength1 = null;
    }
    ticker = paramStrength1;
    loader = paramCacheLoader;
  }
  
  LocalCache$ManualSerializationProxy(LocalCache<K, V> paramLocalCache)
  {
    this(keyStrength, valueStrength, keyEquivalence, valueEquivalence, expireAfterWriteNanos, expireAfterAccessNanos, maxWeight, weigher, concurrencyLevel, removalListener, ticker, defaultLoader);
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    delegate = recreateCacheBuilder().build();
  }
  
  private Object readResolve()
  {
    return delegate;
  }
  
  protected Cache<K, V> delegate()
  {
    return delegate;
  }
  
  CacheBuilder<K, V> recreateCacheBuilder()
  {
    CacheBuilder localCacheBuilder = CacheBuilder.newBuilder().setKeyStrength(keyStrength).setValueStrength(valueStrength).keyEquivalence(keyEquivalence).valueEquivalence(valueEquivalence).concurrencyLevel(concurrencyLevel).removalListener(removalListener);
    strictParsing = false;
    if (expireAfterWriteNanos > 0L) {
      localCacheBuilder.expireAfterWrite(expireAfterWriteNanos, TimeUnit.NANOSECONDS);
    }
    if (expireAfterAccessNanos > 0L) {
      localCacheBuilder.expireAfterAccess(expireAfterAccessNanos, TimeUnit.NANOSECONDS);
    }
    if (weigher != CacheBuilder.OneWeigher.INSTANCE)
    {
      localCacheBuilder.weigher(weigher);
      if (maxWeight != -1L) {
        localCacheBuilder.maximumWeight(maxWeight);
      }
    }
    for (;;)
    {
      if (ticker != null) {
        localCacheBuilder.ticker(ticker);
      }
      return localCacheBuilder;
      if (maxWeight != -1L) {
        localCacheBuilder.maximumSize(maxWeight);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.ManualSerializationProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */