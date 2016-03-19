package com.google.common.cache;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Equivalence;
import com.google.common.base.Preconditions;
import com.google.common.base.Ticker;
import com.google.common.util.concurrent.ExecutionError;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.UncheckedExecutionException;
import com.google.common.util.concurrent.Uninterruptibles;
import java.lang.ref.ReferenceQueue;
import java.util.Iterator;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

class LocalCache$Segment<K, V>
  extends ReentrantLock
{
  @GuardedBy("Segment.this")
  final Queue<LocalCache.ReferenceEntry<K, V>> accessQueue;
  volatile int count;
  final ReferenceQueue<K> keyReferenceQueue;
  final LocalCache<K, V> map;
  final long maxSegmentWeight;
  int modCount;
  final AtomicInteger readCount = new AtomicInteger();
  final Queue<LocalCache.ReferenceEntry<K, V>> recencyQueue;
  final AbstractCache.StatsCounter statsCounter;
  volatile AtomicReferenceArray<LocalCache.ReferenceEntry<K, V>> table;
  int threshold;
  @GuardedBy("Segment.this")
  int totalWeight;
  final ReferenceQueue<V> valueReferenceQueue;
  @GuardedBy("Segment.this")
  final Queue<LocalCache.ReferenceEntry<K, V>> writeQueue;
  
  LocalCache$Segment(LocalCache<K, V> paramLocalCache, int paramInt, long paramLong, AbstractCache.StatsCounter paramStatsCounter)
  {
    map = paramLocalCache;
    maxSegmentWeight = paramLong;
    statsCounter = ((AbstractCache.StatsCounter)Preconditions.checkNotNull(paramStatsCounter));
    initTable(newEntryArray(paramInt));
    if (paramLocalCache.usesKeyReferences())
    {
      paramStatsCounter = new ReferenceQueue();
      keyReferenceQueue = paramStatsCounter;
      paramStatsCounter = (AbstractCache.StatsCounter)localObject;
      if (paramLocalCache.usesValueReferences()) {
        paramStatsCounter = new ReferenceQueue();
      }
      valueReferenceQueue = paramStatsCounter;
      if (!paramLocalCache.usesAccessQueue()) {
        break label168;
      }
      paramStatsCounter = new ConcurrentLinkedQueue();
      label113:
      recencyQueue = paramStatsCounter;
      if (!paramLocalCache.usesWriteQueue()) {
        break label176;
      }
      paramStatsCounter = new LocalCache.WriteQueue();
      label135:
      writeQueue = paramStatsCounter;
      if (!paramLocalCache.usesAccessQueue()) {
        break label184;
      }
    }
    label168:
    label176:
    label184:
    for (paramLocalCache = new LocalCache.AccessQueue();; paramLocalCache = LocalCache.discardingQueue())
    {
      accessQueue = paramLocalCache;
      return;
      paramStatsCounter = null;
      break;
      paramStatsCounter = LocalCache.discardingQueue();
      break label113;
      paramStatsCounter = LocalCache.discardingQueue();
      break label135;
    }
  }
  
  void cleanUp()
  {
    runLockedCleanup(map.ticker.read());
    runUnlockedCleanup();
  }
  
  void clear()
  {
    if (count != 0) {
      lock();
    }
    for (;;)
    {
      try
      {
        AtomicReferenceArray localAtomicReferenceArray = table;
        i = 0;
        if (i >= localAtomicReferenceArray.length()) {
          break label164;
        }
        LocalCache.ReferenceEntry localReferenceEntry = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
        if (localReferenceEntry != null)
        {
          if (localReferenceEntry.getValueReference().isActive()) {
            enqueueNotification(localReferenceEntry, RemovalCause.EXPLICIT);
          }
          localReferenceEntry = localReferenceEntry.getNext();
          continue;
          if (i < localAtomicReferenceArray.length())
          {
            localAtomicReferenceArray.set(i, null);
            i += 1;
            continue;
          }
          clearReferenceQueues();
          writeQueue.clear();
          accessQueue.clear();
          readCount.set(0);
          modCount += 1;
          count = 0;
          return;
        }
      }
      finally
      {
        unlock();
        postWriteCleanup();
      }
      i += 1;
      continue;
      label164:
      int i = 0;
    }
  }
  
  void clearKeyReferenceQueue()
  {
    while (keyReferenceQueue.poll() != null) {}
  }
  
  void clearReferenceQueues()
  {
    if (map.usesKeyReferences()) {
      clearKeyReferenceQueue();
    }
    if (map.usesValueReferences()) {
      clearValueReferenceQueue();
    }
  }
  
  void clearValueReferenceQueue()
  {
    while (valueReferenceQueue.poll() != null) {}
  }
  
  boolean containsKey(Object paramObject, int paramInt)
  {
    boolean bool = false;
    try
    {
      if (count != 0)
      {
        paramObject = getLiveEntry(paramObject, paramInt, map.ticker.read());
        if (paramObject == null) {
          return false;
        }
        paramObject = ((LocalCache.ReferenceEntry)paramObject).getValueReference().get();
        if (paramObject != null) {
          bool = true;
        }
        return bool;
      }
      return false;
    }
    finally
    {
      postReadCleanup();
    }
  }
  
  @VisibleForTesting
  boolean containsValue(Object paramObject)
  {
    try
    {
      if (count != 0)
      {
        long l = map.ticker.read();
        AtomicReferenceArray localAtomicReferenceArray = table;
        int j = localAtomicReferenceArray.length();
        int i = 0;
        while (i < j)
        {
          LocalCache.ReferenceEntry localReferenceEntry = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
          if (localReferenceEntry != null)
          {
            Object localObject = getLiveValue(localReferenceEntry, l);
            if (localObject == null) {}
            boolean bool;
            do
            {
              localReferenceEntry = localReferenceEntry.getNext();
              break;
              bool = map.valueEquivalence.equivalent(paramObject, localObject);
            } while (!bool);
            return true;
          }
          i += 1;
        }
      }
      return false;
    }
    finally
    {
      postReadCleanup();
    }
  }
  
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> copyEntry(LocalCache.ReferenceEntry<K, V> paramReferenceEntry1, LocalCache.ReferenceEntry<K, V> paramReferenceEntry2)
  {
    if (paramReferenceEntry1.getKey() == null) {}
    LocalCache.ValueReference localValueReference;
    Object localObject;
    do
    {
      return null;
      localValueReference = paramReferenceEntry1.getValueReference();
      localObject = localValueReference.get();
    } while ((localObject == null) && (localValueReference.isActive()));
    paramReferenceEntry1 = map.entryFactory.copyEntry(this, paramReferenceEntry1, paramReferenceEntry2);
    paramReferenceEntry1.setValueReference(localValueReference.copyFor(valueReferenceQueue, localObject, paramReferenceEntry1));
    return paramReferenceEntry1;
  }
  
  @GuardedBy("Segment.this")
  void drainKeyReferenceQueue()
  {
    int i = 0;
    int j;
    do
    {
      Object localObject = keyReferenceQueue.poll();
      if (localObject == null) {
        break;
      }
      localObject = (LocalCache.ReferenceEntry)localObject;
      map.reclaimKey((LocalCache.ReferenceEntry)localObject);
      j = i + 1;
      i = j;
    } while (j != 16);
  }
  
  @GuardedBy("Segment.this")
  void drainRecencyQueue()
  {
    for (;;)
    {
      LocalCache.ReferenceEntry localReferenceEntry = (LocalCache.ReferenceEntry)recencyQueue.poll();
      if (localReferenceEntry == null) {
        break;
      }
      if (accessQueue.contains(localReferenceEntry)) {
        accessQueue.add(localReferenceEntry);
      }
    }
  }
  
  @GuardedBy("Segment.this")
  void drainReferenceQueues()
  {
    if (map.usesKeyReferences()) {
      drainKeyReferenceQueue();
    }
    if (map.usesValueReferences()) {
      drainValueReferenceQueue();
    }
  }
  
  @GuardedBy("Segment.this")
  void drainValueReferenceQueue()
  {
    int i = 0;
    int j;
    do
    {
      Object localObject = valueReferenceQueue.poll();
      if (localObject == null) {
        break;
      }
      localObject = (LocalCache.ValueReference)localObject;
      map.reclaimValue((LocalCache.ValueReference)localObject);
      j = i + 1;
      i = j;
    } while (j != 16);
  }
  
  @GuardedBy("Segment.this")
  void enqueueNotification(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, RemovalCause paramRemovalCause)
  {
    enqueueNotification(paramReferenceEntry.getKey(), paramReferenceEntry.getHash(), paramReferenceEntry.getValueReference(), paramRemovalCause);
  }
  
  @GuardedBy("Segment.this")
  void enqueueNotification(@Nullable K paramK, int paramInt, LocalCache.ValueReference<K, V> paramValueReference, RemovalCause paramRemovalCause)
  {
    totalWeight -= paramValueReference.getWeight();
    if (paramRemovalCause.wasEvicted()) {
      statsCounter.recordEviction();
    }
    if (map.removalNotificationQueue != LocalCache.DISCARDING_QUEUE)
    {
      paramK = new RemovalNotification(paramK, paramValueReference.get(), paramRemovalCause);
      map.removalNotificationQueue.offer(paramK);
    }
  }
  
  @GuardedBy("Segment.this")
  void evictEntries()
  {
    if (!map.evictsBySize()) {}
    LocalCache.ReferenceEntry localReferenceEntry;
    do
    {
      return;
      while (totalWeight <= maxSegmentWeight) {
        drainRecencyQueue();
      }
      localReferenceEntry = getNextEvictable();
    } while (removeEntry(localReferenceEntry, localReferenceEntry.getHash(), RemovalCause.SIZE));
    throw new AssertionError();
  }
  
  @GuardedBy("Segment.this")
  void expand()
  {
    AtomicReferenceArray localAtomicReferenceArray1 = table;
    int i1 = localAtomicReferenceArray1.length();
    if (i1 >= 1073741824) {
      return;
    }
    int i = count;
    AtomicReferenceArray localAtomicReferenceArray2 = newEntryArray(i1 << 1);
    threshold = (localAtomicReferenceArray2.length() * 3 / 4);
    int i2 = localAtomicReferenceArray2.length() - 1;
    int j = 0;
    if (j < i1)
    {
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray1.get(j);
      int k = i;
      LocalCache.ReferenceEntry localReferenceEntry1;
      if (localReferenceEntry2 != null)
      {
        localReferenceEntry1 = localReferenceEntry2.getNext();
        k = localReferenceEntry2.getHash() & i2;
        if (localReferenceEntry1 != null) {
          break label129;
        }
        localAtomicReferenceArray2.set(k, localReferenceEntry2);
        k = i;
      }
      label129:
      LocalCache.ReferenceEntry localReferenceEntry3;
      do
      {
        j += 1;
        i = k;
        break;
        localReferenceEntry3 = localReferenceEntry2;
        while (localReferenceEntry1 != null)
        {
          int n = localReferenceEntry1.getHash() & i2;
          int m = k;
          if (n != k)
          {
            m = n;
            localReferenceEntry3 = localReferenceEntry1;
          }
          localReferenceEntry1 = localReferenceEntry1.getNext();
          k = m;
        }
        localAtomicReferenceArray2.set(k, localReferenceEntry3);
        localReferenceEntry1 = localReferenceEntry2;
        k = i;
      } while (localReferenceEntry1 == localReferenceEntry3);
      k = localReferenceEntry1.getHash() & i2;
      localReferenceEntry2 = copyEntry(localReferenceEntry1, (LocalCache.ReferenceEntry)localAtomicReferenceArray2.get(k));
      if (localReferenceEntry2 != null) {
        localAtomicReferenceArray2.set(k, localReferenceEntry2);
      }
      for (;;)
      {
        localReferenceEntry1 = localReferenceEntry1.getNext();
        break;
        removeCollectedEntry(localReferenceEntry1);
        i -= 1;
      }
    }
    table = localAtomicReferenceArray2;
    count = i;
  }
  
  @GuardedBy("Segment.this")
  void expireEntries(long paramLong)
  {
    drainRecencyQueue();
    LocalCache.ReferenceEntry localReferenceEntry;
    do
    {
      localReferenceEntry = (LocalCache.ReferenceEntry)writeQueue.peek();
      if ((localReferenceEntry == null) || (!map.isExpired(localReferenceEntry, paramLong))) {
        break;
      }
    } while (removeEntry(localReferenceEntry, localReferenceEntry.getHash(), RemovalCause.EXPIRED));
    throw new AssertionError();
    do
    {
      localReferenceEntry = (LocalCache.ReferenceEntry)accessQueue.peek();
      if ((localReferenceEntry == null) || (!map.isExpired(localReferenceEntry, paramLong))) {
        break;
      }
    } while (removeEntry(localReferenceEntry, localReferenceEntry.getHash(), RemovalCause.EXPIRED));
    throw new AssertionError();
  }
  
  @Nullable
  V get(Object paramObject, int paramInt)
  {
    try
    {
      if (count != 0)
      {
        long l = map.ticker.read();
        paramObject = getLiveEntry(paramObject, paramInt, l);
        if (paramObject == null) {
          return null;
        }
        Object localObject = ((LocalCache.ReferenceEntry)paramObject).getValueReference().get();
        if (localObject != null)
        {
          recordRead((LocalCache.ReferenceEntry)paramObject, l);
          paramObject = scheduleRefresh((LocalCache.ReferenceEntry)paramObject, ((LocalCache.ReferenceEntry)paramObject).getKey(), paramInt, localObject, l, map.defaultLoader);
          return (V)paramObject;
        }
        tryDrainReferenceQueues();
      }
      return null;
    }
    finally
    {
      postReadCleanup();
    }
  }
  
  V get(K paramK, int paramInt, CacheLoader<? super K, V> paramCacheLoader)
    throws ExecutionException
  {
    Preconditions.checkNotNull(paramK);
    Preconditions.checkNotNull(paramCacheLoader);
    try
    {
      if (count != 0)
      {
        LocalCache.ReferenceEntry localReferenceEntry = getEntry(paramK, paramInt);
        if (localReferenceEntry != null)
        {
          long l = map.ticker.read();
          Object localObject = getLiveValue(localReferenceEntry, l);
          if (localObject != null)
          {
            recordRead(localReferenceEntry, l);
            statsCounter.recordHits(1);
            paramK = scheduleRefresh(localReferenceEntry, paramK, paramInt, localObject, l, paramCacheLoader);
            return paramK;
          }
          localObject = localReferenceEntry.getValueReference();
          if (((LocalCache.ValueReference)localObject).isLoading())
          {
            paramK = waitForLoadingValue(localReferenceEntry, paramK, (LocalCache.ValueReference)localObject);
            return paramK;
          }
        }
      }
      paramK = lockedGetOrLoad(paramK, paramInt, paramCacheLoader);
      return paramK;
    }
    catch (ExecutionException paramK)
    {
      paramCacheLoader = paramK.getCause();
      if ((paramCacheLoader instanceof Error)) {
        throw new ExecutionError((Error)paramCacheLoader);
      }
    }
    finally
    {
      postReadCleanup();
    }
    if ((paramCacheLoader instanceof RuntimeException)) {
      throw new UncheckedExecutionException(paramCacheLoader);
    }
    throw paramK;
  }
  
  V getAndRecordStats(K paramK, int paramInt, LocalCache.LoadingValueReference<K, V> paramLoadingValueReference, ListenableFuture<V> paramListenableFuture)
    throws ExecutionException
  {
    ListenableFuture<V> localListenableFuture = null;
    try
    {
      paramListenableFuture = Uninterruptibles.getUninterruptibly(paramListenableFuture);
      if (paramListenableFuture == null)
      {
        localListenableFuture = paramListenableFuture;
        throw new CacheLoader.InvalidCacheLoadException("CacheLoader returned null for key " + paramK + ".");
      }
    }
    finally
    {
      if (localListenableFuture == null)
      {
        statsCounter.recordLoadException(paramLoadingValueReference.elapsedNanos());
        removeLoadingValue(paramK, paramInt, paramLoadingValueReference);
      }
    }
    localListenableFuture = paramListenableFuture;
    statsCounter.recordLoadSuccess(paramLoadingValueReference.elapsedNanos());
    localListenableFuture = paramListenableFuture;
    storeLoadedValue(paramK, paramInt, paramLoadingValueReference, paramListenableFuture);
    if (paramListenableFuture == null)
    {
      statsCounter.recordLoadException(paramLoadingValueReference.elapsedNanos());
      removeLoadingValue(paramK, paramInt, paramLoadingValueReference);
    }
    return paramListenableFuture;
  }
  
  @Nullable
  LocalCache.ReferenceEntry<K, V> getEntry(Object paramObject, int paramInt)
  {
    LocalCache.ReferenceEntry localReferenceEntry = getFirst(paramInt);
    if (localReferenceEntry != null)
    {
      if (localReferenceEntry.getHash() != paramInt) {}
      Object localObject;
      label50:
      do
      {
        for (;;)
        {
          localReferenceEntry = localReferenceEntry.getNext();
          break;
          localObject = localReferenceEntry.getKey();
          if (localObject != null) {
            break label50;
          }
          tryDrainReferenceQueues();
        }
      } while (!map.keyEquivalence.equivalent(paramObject, localObject));
      return localReferenceEntry;
    }
    return null;
  }
  
  LocalCache.ReferenceEntry<K, V> getFirst(int paramInt)
  {
    AtomicReferenceArray localAtomicReferenceArray = table;
    return (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(localAtomicReferenceArray.length() - 1 & paramInt);
  }
  
  @Nullable
  LocalCache.ReferenceEntry<K, V> getLiveEntry(Object paramObject, int paramInt, long paramLong)
  {
    LocalCache.ReferenceEntry localReferenceEntry = getEntry(paramObject, paramInt);
    if (localReferenceEntry == null) {
      paramObject = null;
    }
    do
    {
      return (LocalCache.ReferenceEntry<K, V>)paramObject;
      paramObject = localReferenceEntry;
    } while (!map.isExpired(localReferenceEntry, paramLong));
    tryExpireEntries(paramLong);
    return null;
  }
  
  V getLiveValue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, long paramLong)
  {
    Object localObject;
    if (paramReferenceEntry.getKey() == null)
    {
      tryDrainReferenceQueues();
      localObject = null;
    }
    do
    {
      return (V)localObject;
      localObject = paramReferenceEntry.getValueReference().get();
      if (localObject == null)
      {
        tryDrainReferenceQueues();
        return null;
      }
    } while (!map.isExpired(paramReferenceEntry, paramLong));
    tryExpireEntries(paramLong);
    return null;
  }
  
  LocalCache.ReferenceEntry<K, V> getNextEvictable()
  {
    Iterator localIterator = accessQueue.iterator();
    while (localIterator.hasNext())
    {
      LocalCache.ReferenceEntry localReferenceEntry = (LocalCache.ReferenceEntry)localIterator.next();
      if (localReferenceEntry.getValueReference().getWeight() > 0) {
        return localReferenceEntry;
      }
    }
    throw new AssertionError();
  }
  
  void initTable(AtomicReferenceArray<LocalCache.ReferenceEntry<K, V>> paramAtomicReferenceArray)
  {
    threshold = (paramAtomicReferenceArray.length() * 3 / 4);
    if ((!map.customWeigher()) && (threshold == maxSegmentWeight)) {
      threshold += 1;
    }
    table = paramAtomicReferenceArray;
  }
  
  @Nullable
  LocalCache.LoadingValueReference<K, V> insertLoadingValueReference(K paramK, int paramInt, boolean paramBoolean)
  {
    lock();
    try
    {
      long l1 = map.ticker.read();
      preWriteCleanup(l1);
      AtomicReferenceArray localAtomicReferenceArray = table;
      int i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (Object localObject1 = localReferenceEntry; localObject1 != null; localObject1 = ((LocalCache.ReferenceEntry)localObject1).getNext())
      {
        Object localObject2 = ((LocalCache.ReferenceEntry)localObject1).getKey();
        if ((((LocalCache.ReferenceEntry)localObject1).getHash() == paramInt) && (localObject2 != null) && (map.keyEquivalence.equivalent(paramK, localObject2)))
        {
          paramK = ((LocalCache.ReferenceEntry)localObject1).getValueReference();
          if (!paramK.isLoading())
          {
            if (paramBoolean)
            {
              long l2 = ((LocalCache.ReferenceEntry)localObject1).getWriteTime();
              long l3 = map.refreshNanos;
              if (l1 - l2 >= l3) {}
            }
          }
          else {
            return null;
          }
          modCount += 1;
          paramK = new LocalCache.LoadingValueReference(paramK);
          ((LocalCache.ReferenceEntry)localObject1).setValueReference(paramK);
          return paramK;
        }
      }
      modCount += 1;
      localObject1 = new LocalCache.LoadingValueReference();
      paramK = newEntry(paramK, paramInt, localReferenceEntry);
      paramK.setValueReference((LocalCache.ValueReference)localObject1);
      localAtomicReferenceArray.set(i, paramK);
      return (LocalCache.LoadingValueReference<K, V>)localObject1;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  ListenableFuture<V> loadAsync(final K paramK, final int paramInt, final LocalCache.LoadingValueReference<K, V> paramLoadingValueReference, final CacheLoader<? super K, V> paramCacheLoader)
  {
    paramCacheLoader = paramLoadingValueReference.loadFuture(paramK, paramCacheLoader);
    paramCacheLoader.addListener(new Runnable()
    {
      public void run()
      {
        try
        {
          getAndRecordStats(paramK, paramInt, paramLoadingValueReference, paramCacheLoader);
          return;
        }
        catch (Throwable localThrowable)
        {
          LocalCache.logger.log(Level.WARNING, "Exception thrown during refresh", localThrowable);
          paramLoadingValueReference.setException(localThrowable);
        }
      }
    }, LocalCache.sameThreadExecutor);
    return paramCacheLoader;
  }
  
  V loadSync(K paramK, int paramInt, LocalCache.LoadingValueReference<K, V> paramLoadingValueReference, CacheLoader<? super K, V> paramCacheLoader)
    throws ExecutionException
  {
    return (V)getAndRecordStats(paramK, paramInt, paramLoadingValueReference, paramLoadingValueReference.loadFuture(paramK, paramCacheLoader));
  }
  
  /* Error */
  V lockedGetOrLoad(K paramK, int paramInt, CacheLoader<? super K, V> paramCacheLoader)
    throws ExecutionException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 13
    //   3: aconst_null
    //   4: astore 11
    //   6: iconst_1
    //   7: istore 5
    //   9: aload_0
    //   10: invokevirtual 138	com/google/common/cache/LocalCache$Segment:lock	()V
    //   13: aload_0
    //   14: getfield 52	com/google/common/cache/LocalCache$Segment:map	Lcom/google/common/cache/LocalCache;
    //   17: getfield 119	com/google/common/cache/LocalCache:ticker	Lcom/google/common/base/Ticker;
    //   20: invokevirtual 125	com/google/common/base/Ticker:read	()J
    //   23: lstore 8
    //   25: aload_0
    //   26: lload 8
    //   28: invokevirtual 502	com/google/common/cache/LocalCache$Segment:preWriteCleanup	(J)V
    //   31: aload_0
    //   32: getfield 135	com/google/common/cache/LocalCache$Segment:count	I
    //   35: istore 7
    //   37: aload_0
    //   38: getfield 140	com/google/common/cache/LocalCache$Segment:table	Ljava/util/concurrent/atomic/AtomicReferenceArray;
    //   41: astore 15
    //   43: iload_2
    //   44: aload 15
    //   46: invokevirtual 146	java/util/concurrent/atomic/AtomicReferenceArray:length	()I
    //   49: iconst_1
    //   50: isub
    //   51: iand
    //   52: istore 6
    //   54: aload 15
    //   56: iload 6
    //   58: invokevirtual 150	java/util/concurrent/atomic/AtomicReferenceArray:get	(I)Ljava/lang/Object;
    //   61: checkcast 152	com/google/common/cache/LocalCache$ReferenceEntry
    //   64: astore 14
    //   66: aload 14
    //   68: astore 10
    //   70: iload 5
    //   72: istore 4
    //   74: aload 13
    //   76: astore 12
    //   78: aload 10
    //   80: ifnull +66 -> 146
    //   83: aload 10
    //   85: invokeinterface 242 1 0
    //   90: astore 16
    //   92: aload 10
    //   94: invokeinterface 286 1 0
    //   99: iload_2
    //   100: if_icmpne +272 -> 372
    //   103: aload 16
    //   105: ifnull +267 -> 372
    //   108: aload_0
    //   109: getfield 52	com/google/common/cache/LocalCache$Segment:map	Lcom/google/common/cache/LocalCache;
    //   112: getfield 473	com/google/common/cache/LocalCache:keyEquivalence	Lcom/google/common/base/Equivalence;
    //   115: aload_1
    //   116: aload 16
    //   118: invokevirtual 236	com/google/common/base/Equivalence:equivalent	(Ljava/lang/Object;Ljava/lang/Object;)Z
    //   121: ifeq +251 -> 372
    //   124: aload 10
    //   126: invokeinterface 156 1 0
    //   131: astore 12
    //   133: aload 12
    //   135: invokeinterface 388 1 0
    //   140: ifeq +98 -> 238
    //   143: iconst_0
    //   144: istore 4
    //   146: aload 10
    //   148: astore 13
    //   150: iload 4
    //   152: ifeq +45 -> 197
    //   155: new 448	com/google/common/cache/LocalCache$LoadingValueReference
    //   158: dup
    //   159: invokespecial 511	com/google/common/cache/LocalCache$LoadingValueReference:<init>	()V
    //   162: astore 11
    //   164: aload 10
    //   166: ifnonnull +218 -> 384
    //   169: aload_0
    //   170: aload_1
    //   171: iload_2
    //   172: aload 14
    //   174: invokevirtual 515	com/google/common/cache/LocalCache$Segment:newEntry	(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    //   177: astore 13
    //   179: aload 13
    //   181: aload 11
    //   183: invokeinterface 259 2 0
    //   188: aload 15
    //   190: iload 6
    //   192: aload 13
    //   194: invokevirtual 179	java/util/concurrent/atomic/AtomicReferenceArray:set	(ILjava/lang/Object;)V
    //   197: aload_0
    //   198: invokevirtual 194	com/google/common/cache/LocalCache$Segment:unlock	()V
    //   201: aload_0
    //   202: invokevirtual 197	com/google/common/cache/LocalCache$Segment:postWriteCleanup	()V
    //   205: iload 4
    //   207: ifeq +212 -> 419
    //   210: aload 13
    //   212: monitorenter
    //   213: aload_0
    //   214: aload_1
    //   215: iload_2
    //   216: aload 11
    //   218: aload_3
    //   219: invokevirtual 543	com/google/common/cache/LocalCache$Segment:loadSync	(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    //   222: astore_1
    //   223: aload 13
    //   225: monitorexit
    //   226: aload_0
    //   227: getfield 64	com/google/common/cache/LocalCache$Segment:statsCounter	Lcom/google/common/cache/AbstractCache$StatsCounter;
    //   230: iconst_1
    //   231: invokeinterface 546 2 0
    //   236: aload_1
    //   237: areturn
    //   238: aload 12
    //   240: invokeinterface 219 1 0
    //   245: astore 13
    //   247: aload 13
    //   249: ifnonnull +65 -> 314
    //   252: aload_0
    //   253: aload 16
    //   255: iload_2
    //   256: aload 12
    //   258: getstatic 549	com/google/common/cache/RemovalCause:COLLECTED	Lcom/google/common/cache/RemovalCause;
    //   261: invokevirtual 289	com/google/common/cache/LocalCache$Segment:enqueueNotification	(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V
    //   264: aload_0
    //   265: getfield 102	com/google/common/cache/LocalCache$Segment:writeQueue	Ljava/util/Queue;
    //   268: aload 10
    //   270: invokeinterface 552 2 0
    //   275: pop
    //   276: aload_0
    //   277: getfield 107	com/google/common/cache/LocalCache$Segment:accessQueue	Ljava/util/Queue;
    //   280: aload 10
    //   282: invokeinterface 552 2 0
    //   287: pop
    //   288: aload_0
    //   289: iload 7
    //   291: iconst_1
    //   292: isub
    //   293: putfield 135	com/google/common/cache/LocalCache$Segment:count	I
    //   296: iload 5
    //   298: istore 4
    //   300: goto -154 -> 146
    //   303: astore_1
    //   304: aload_0
    //   305: invokevirtual 194	com/google/common/cache/LocalCache$Segment:unlock	()V
    //   308: aload_0
    //   309: invokevirtual 197	com/google/common/cache/LocalCache$Segment:postWriteCleanup	()V
    //   312: aload_1
    //   313: athrow
    //   314: aload_0
    //   315: getfield 52	com/google/common/cache/LocalCache$Segment:map	Lcom/google/common/cache/LocalCache;
    //   318: aload 10
    //   320: lload 8
    //   322: invokevirtual 354	com/google/common/cache/LocalCache:isExpired	(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z
    //   325: ifeq +18 -> 343
    //   328: aload_0
    //   329: aload 16
    //   331: iload_2
    //   332: aload 12
    //   334: getstatic 357	com/google/common/cache/RemovalCause:EXPIRED	Lcom/google/common/cache/RemovalCause;
    //   337: invokevirtual 289	com/google/common/cache/LocalCache$Segment:enqueueNotification	(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V
    //   340: goto -76 -> 264
    //   343: aload_0
    //   344: aload 10
    //   346: lload 8
    //   348: invokevirtual 555	com/google/common/cache/LocalCache$Segment:recordLockedRead	(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    //   351: aload_0
    //   352: getfield 64	com/google/common/cache/LocalCache$Segment:statsCounter	Lcom/google/common/cache/AbstractCache$StatsCounter;
    //   355: iconst_1
    //   356: invokeinterface 385 2 0
    //   361: aload_0
    //   362: invokevirtual 194	com/google/common/cache/LocalCache$Segment:unlock	()V
    //   365: aload_0
    //   366: invokevirtual 197	com/google/common/cache/LocalCache$Segment:postWriteCleanup	()V
    //   369: aload 13
    //   371: areturn
    //   372: aload 10
    //   374: invokeinterface 175 1 0
    //   379: astore 10
    //   381: goto -311 -> 70
    //   384: aload 10
    //   386: aload 11
    //   388: invokeinterface 259 2 0
    //   393: aload 10
    //   395: astore 13
    //   397: goto -200 -> 197
    //   400: astore_1
    //   401: aload 13
    //   403: monitorexit
    //   404: aload_1
    //   405: athrow
    //   406: astore_1
    //   407: aload_0
    //   408: getfield 64	com/google/common/cache/LocalCache$Segment:statsCounter	Lcom/google/common/cache/AbstractCache$StatsCounter;
    //   411: iconst_1
    //   412: invokeinterface 546 2 0
    //   417: aload_1
    //   418: athrow
    //   419: aload_0
    //   420: aload 13
    //   422: aload_1
    //   423: aload 12
    //   425: invokevirtual 392	com/google/common/cache/LocalCache$Segment:waitForLoadingValue	(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;
    //   428: areturn
    //   429: astore_1
    //   430: goto -126 -> 304
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	433	0	this	Segment
    //   0	433	1	paramK	K
    //   0	433	2	paramInt	int
    //   0	433	3	paramCacheLoader	CacheLoader<? super K, V>
    //   72	227	4	i	int
    //   7	290	5	j	int
    //   52	139	6	k	int
    //   35	258	7	m	int
    //   23	324	8	l	long
    //   68	326	10	localReferenceEntry1	LocalCache.ReferenceEntry
    //   4	383	11	localLoadingValueReference	LocalCache.LoadingValueReference
    //   76	348	12	localObject1	Object
    //   1	420	13	localObject2	Object
    //   64	109	14	localReferenceEntry2	LocalCache.ReferenceEntry
    //   41	148	15	localAtomicReferenceArray	AtomicReferenceArray
    //   90	240	16	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   13	66	303	finally
    //   83	103	303	finally
    //   108	143	303	finally
    //   155	164	303	finally
    //   238	247	303	finally
    //   252	264	303	finally
    //   264	296	303	finally
    //   314	340	303	finally
    //   343	361	303	finally
    //   372	381	303	finally
    //   213	226	400	finally
    //   401	404	400	finally
    //   210	213	406	finally
    //   404	406	406	finally
    //   169	197	429	finally
    //   384	393	429	finally
  }
  
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> newEntry(K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return map.entryFactory.newEntry(this, Preconditions.checkNotNull(paramK), paramInt, paramReferenceEntry);
  }
  
  AtomicReferenceArray<LocalCache.ReferenceEntry<K, V>> newEntryArray(int paramInt)
  {
    return new AtomicReferenceArray(paramInt);
  }
  
  void postReadCleanup()
  {
    if ((readCount.incrementAndGet() & 0x3F) == 0) {
      cleanUp();
    }
  }
  
  void postWriteCleanup()
  {
    runUnlockedCleanup();
  }
  
  @GuardedBy("Segment.this")
  void preWriteCleanup(long paramLong)
  {
    runLockedCleanup(paramLong);
  }
  
  @Nullable
  V put(K paramK, int paramInt, V paramV, boolean paramBoolean)
  {
    lock();
    try
    {
      long l = map.ticker.read();
      preWriteCleanup(l);
      if (count + 1 > threshold)
      {
        expand();
        i = count;
      }
      Object localObject3 = table;
      int i = paramInt & ((AtomicReferenceArray)localObject3).length() - 1;
      Object localObject2 = (LocalCache.ReferenceEntry)((AtomicReferenceArray)localObject3).get(i);
      for (Object localObject1 = localObject2; localObject1 != null; localObject1 = ((LocalCache.ReferenceEntry)localObject1).getNext())
      {
        Object localObject4 = ((LocalCache.ReferenceEntry)localObject1).getKey();
        if ((((LocalCache.ReferenceEntry)localObject1).getHash() == paramInt) && (localObject4 != null) && (map.keyEquivalence.equivalent(paramK, localObject4)))
        {
          localObject2 = ((LocalCache.ReferenceEntry)localObject1).getValueReference();
          localObject3 = ((LocalCache.ValueReference)localObject2).get();
          if (localObject3 == null)
          {
            modCount += 1;
            if (((LocalCache.ValueReference)localObject2).isActive())
            {
              enqueueNotification(paramK, paramInt, (LocalCache.ValueReference)localObject2, RemovalCause.COLLECTED);
              setValue((LocalCache.ReferenceEntry)localObject1, paramK, paramV, l);
            }
            for (paramInt = count;; paramInt = count + 1)
            {
              count = paramInt;
              evictEntries();
              return null;
              setValue((LocalCache.ReferenceEntry)localObject1, paramK, paramV, l);
            }
          }
          if (paramBoolean)
          {
            recordLockedRead((LocalCache.ReferenceEntry)localObject1, l);
            return (V)localObject3;
          }
          modCount += 1;
          enqueueNotification(paramK, paramInt, (LocalCache.ValueReference)localObject2, RemovalCause.REPLACED);
          setValue((LocalCache.ReferenceEntry)localObject1, paramK, paramV, l);
          evictEntries();
          return (V)localObject3;
        }
      }
      modCount += 1;
      localObject1 = newEntry(paramK, paramInt, (LocalCache.ReferenceEntry)localObject2);
      setValue((LocalCache.ReferenceEntry)localObject1, paramK, paramV, l);
      ((AtomicReferenceArray)localObject3).set(i, localObject1);
      count += 1;
      evictEntries();
      return null;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  boolean reclaimKey(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, int paramInt)
  {
    lock();
    try
    {
      int i = count;
      AtomicReferenceArray localAtomicReferenceArray = table;
      i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext()) {
        if (localReferenceEntry1 == paramReferenceEntry)
        {
          modCount += 1;
          paramReferenceEntry = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localReferenceEntry1.getKey(), paramInt, localReferenceEntry1.getValueReference(), RemovalCause.COLLECTED);
          paramInt = count;
          localAtomicReferenceArray.set(i, paramReferenceEntry);
          count = (paramInt - 1);
          return true;
        }
      }
      return false;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  boolean reclaimValue(K paramK, int paramInt, LocalCache.ValueReference<K, V> paramValueReference)
  {
    boolean bool1 = false;
    lock();
    try
    {
      int i = count;
      AtomicReferenceArray localAtomicReferenceArray = table;
      i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext())
      {
        Object localObject = localReferenceEntry1.getKey();
        if ((localReferenceEntry1.getHash() == paramInt) && (localObject != null) && (map.keyEquivalence.equivalent(paramK, localObject)))
        {
          if (localReferenceEntry1.getValueReference() == paramValueReference)
          {
            modCount += 1;
            paramK = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localObject, paramInt, paramValueReference, RemovalCause.COLLECTED);
            paramInt = count;
            localAtomicReferenceArray.set(i, paramK);
            count = (paramInt - 1);
            boolean bool2 = true;
            unlock();
            bool1 = bool2;
            if (!isHeldByCurrentThread())
            {
              postWriteCleanup();
              bool1 = bool2;
            }
            return bool1;
          }
          return false;
        }
      }
      return false;
    }
    finally
    {
      unlock();
      if (!isHeldByCurrentThread()) {
        postWriteCleanup();
      }
    }
  }
  
  @GuardedBy("Segment.this")
  void recordLockedRead(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, long paramLong)
  {
    if (map.recordsAccess()) {
      paramReferenceEntry.setAccessTime(paramLong);
    }
    accessQueue.add(paramReferenceEntry);
  }
  
  void recordRead(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, long paramLong)
  {
    if (map.recordsAccess()) {
      paramReferenceEntry.setAccessTime(paramLong);
    }
    recencyQueue.add(paramReferenceEntry);
  }
  
  @GuardedBy("Segment.this")
  void recordWrite(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, int paramInt, long paramLong)
  {
    drainRecencyQueue();
    totalWeight += paramInt;
    if (map.recordsAccess()) {
      paramReferenceEntry.setAccessTime(paramLong);
    }
    if (map.recordsWrite()) {
      paramReferenceEntry.setWriteTime(paramLong);
    }
    accessQueue.add(paramReferenceEntry);
    writeQueue.add(paramReferenceEntry);
  }
  
  @Nullable
  V refresh(K paramK, int paramInt, CacheLoader<? super K, V> paramCacheLoader, boolean paramBoolean)
  {
    LocalCache.LoadingValueReference localLoadingValueReference = insertLoadingValueReference(paramK, paramInt, paramBoolean);
    if (localLoadingValueReference == null) {}
    do
    {
      return null;
      paramK = loadAsync(paramK, paramInt, localLoadingValueReference, paramCacheLoader);
    } while (!paramK.isDone());
    try
    {
      paramK = Uninterruptibles.getUninterruptibly(paramK);
      return paramK;
    }
    catch (Throwable paramK) {}
    return null;
  }
  
  @Nullable
  V remove(Object paramObject, int paramInt)
  {
    lock();
    try
    {
      preWriteCleanup(map.ticker.read());
      int i = count;
      AtomicReferenceArray localAtomicReferenceArray = table;
      i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext())
      {
        Object localObject1 = localReferenceEntry1.getKey();
        if ((localReferenceEntry1.getHash() == paramInt) && (localObject1 != null) && (map.keyEquivalence.equivalent(paramObject, localObject1)))
        {
          LocalCache.ValueReference localValueReference = localReferenceEntry1.getValueReference();
          Object localObject2 = localValueReference.get();
          if (localObject2 != null) {}
          for (paramObject = RemovalCause.EXPLICIT;; paramObject = RemovalCause.COLLECTED)
          {
            modCount += 1;
            paramObject = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localObject1, paramInt, localValueReference, (RemovalCause)paramObject);
            paramInt = count;
            localAtomicReferenceArray.set(i, paramObject);
            count = (paramInt - 1);
            return (V)localObject2;
            if (!localValueReference.isActive()) {
              break;
            }
          }
          return null;
        }
      }
      return null;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  boolean remove(Object paramObject1, int paramInt, Object paramObject2)
  {
    lock();
    try
    {
      preWriteCleanup(map.ticker.read());
      int i = count;
      AtomicReferenceArray localAtomicReferenceArray = table;
      i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext())
      {
        Object localObject = localReferenceEntry1.getKey();
        if ((localReferenceEntry1.getHash() == paramInt) && (localObject != null) && (map.keyEquivalence.equivalent(paramObject1, localObject)))
        {
          LocalCache.ValueReference localValueReference = localReferenceEntry1.getValueReference();
          paramObject1 = localValueReference.get();
          if (map.valueEquivalence.equivalent(paramObject2, paramObject1))
          {
            paramObject1 = RemovalCause.EXPLICIT;
            modCount += 1;
            paramObject2 = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localObject, paramInt, localValueReference, (RemovalCause)paramObject1);
            paramInt = count;
            localAtomicReferenceArray.set(i, paramObject2);
            count = (paramInt - 1);
            paramObject2 = RemovalCause.EXPLICIT;
            if (paramObject1 != paramObject2) {
              break label238;
            }
          }
          label238:
          for (boolean bool = true;; bool = false)
          {
            return bool;
            if ((paramObject1 == null) && (localValueReference.isActive()))
            {
              paramObject1 = RemovalCause.COLLECTED;
              break;
            }
            return false;
          }
        }
      }
      return false;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  @GuardedBy("Segment.this")
  void removeCollectedEntry(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    enqueueNotification(paramReferenceEntry, RemovalCause.COLLECTED);
    writeQueue.remove(paramReferenceEntry);
    accessQueue.remove(paramReferenceEntry);
  }
  
  @GuardedBy("Segment.this")
  boolean removeEntry(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, int paramInt, RemovalCause paramRemovalCause)
  {
    int i = count;
    AtomicReferenceArray localAtomicReferenceArray = table;
    i = paramInt & localAtomicReferenceArray.length() - 1;
    LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
    for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext()) {
      if (localReferenceEntry1 == paramReferenceEntry)
      {
        modCount += 1;
        paramReferenceEntry = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localReferenceEntry1.getKey(), paramInt, localReferenceEntry1.getValueReference(), paramRemovalCause);
        paramInt = count;
        localAtomicReferenceArray.set(i, paramReferenceEntry);
        count = (paramInt - 1);
        return true;
      }
    }
    return false;
  }
  
  @Nullable
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> removeEntryFromChain(LocalCache.ReferenceEntry<K, V> paramReferenceEntry1, LocalCache.ReferenceEntry<K, V> paramReferenceEntry2)
  {
    int i = count;
    Object localObject = paramReferenceEntry2.getNext();
    if (paramReferenceEntry1 != paramReferenceEntry2)
    {
      LocalCache.ReferenceEntry localReferenceEntry = copyEntry(paramReferenceEntry1, (LocalCache.ReferenceEntry)localObject);
      if (localReferenceEntry != null) {
        localObject = localReferenceEntry;
      }
      for (;;)
      {
        paramReferenceEntry1 = paramReferenceEntry1.getNext();
        break;
        removeCollectedEntry(paramReferenceEntry1);
        i -= 1;
      }
    }
    count = i;
    return (LocalCache.ReferenceEntry<K, V>)localObject;
  }
  
  boolean removeLoadingValue(K paramK, int paramInt, LocalCache.LoadingValueReference<K, V> paramLoadingValueReference)
  {
    lock();
    for (;;)
    {
      try
      {
        AtomicReferenceArray localAtomicReferenceArray = table;
        int i = paramInt & localAtomicReferenceArray.length() - 1;
        LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
        localReferenceEntry1 = localReferenceEntry2;
        if (localReferenceEntry1 == null) {
          break;
        }
        Object localObject = localReferenceEntry1.getKey();
        if ((localReferenceEntry1.getHash() != paramInt) || (localObject == null) || (!map.keyEquivalence.equivalent(paramK, localObject))) {
          break label161;
        }
        if (localReferenceEntry1.getValueReference() == paramLoadingValueReference)
        {
          if (paramLoadingValueReference.isActive())
          {
            localReferenceEntry1.setValueReference(paramLoadingValueReference.getOldValue());
            return true;
          }
          localAtomicReferenceArray.set(i, removeEntryFromChain(localReferenceEntry2, localReferenceEntry1));
          continue;
        }
        unlock();
      }
      finally
      {
        unlock();
        postWriteCleanup();
      }
      postWriteCleanup();
      return false;
      label161:
      LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry1.getNext();
    }
    unlock();
    postWriteCleanup();
    return false;
  }
  
  @Nullable
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> removeValueFromChain(LocalCache.ReferenceEntry<K, V> paramReferenceEntry1, LocalCache.ReferenceEntry<K, V> paramReferenceEntry2, @Nullable K paramK, int paramInt, LocalCache.ValueReference<K, V> paramValueReference, RemovalCause paramRemovalCause)
  {
    enqueueNotification(paramK, paramInt, paramValueReference, paramRemovalCause);
    writeQueue.remove(paramReferenceEntry2);
    accessQueue.remove(paramReferenceEntry2);
    if (paramValueReference.isLoading())
    {
      paramValueReference.notifyNewValue(null);
      return paramReferenceEntry1;
    }
    return removeEntryFromChain(paramReferenceEntry1, paramReferenceEntry2);
  }
  
  @Nullable
  V replace(K paramK, int paramInt, V paramV)
  {
    lock();
    try
    {
      long l = map.ticker.read();
      preWriteCleanup(l);
      AtomicReferenceArray localAtomicReferenceArray = table;
      int i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext())
      {
        Object localObject1 = localReferenceEntry1.getKey();
        if ((localReferenceEntry1.getHash() == paramInt) && (localObject1 != null) && (map.keyEquivalence.equivalent(paramK, localObject1)))
        {
          LocalCache.ValueReference localValueReference = localReferenceEntry1.getValueReference();
          Object localObject2 = localValueReference.get();
          if (localObject2 == null)
          {
            if (localValueReference.isActive())
            {
              int j = count;
              modCount += 1;
              paramK = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localObject1, paramInt, localValueReference, RemovalCause.COLLECTED);
              paramInt = count;
              localAtomicReferenceArray.set(i, paramK);
              count = (paramInt - 1);
            }
            return null;
          }
          modCount += 1;
          enqueueNotification(paramK, paramInt, localValueReference, RemovalCause.REPLACED);
          setValue(localReferenceEntry1, paramK, paramV, l);
          evictEntries();
          return (V)localObject2;
        }
      }
      return null;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  boolean replace(K paramK, int paramInt, V paramV1, V paramV2)
  {
    lock();
    try
    {
      long l = map.ticker.read();
      preWriteCleanup(l);
      AtomicReferenceArray localAtomicReferenceArray = table;
      int i = paramInt & localAtomicReferenceArray.length() - 1;
      LocalCache.ReferenceEntry localReferenceEntry2 = (LocalCache.ReferenceEntry)localAtomicReferenceArray.get(i);
      for (LocalCache.ReferenceEntry localReferenceEntry1 = localReferenceEntry2; localReferenceEntry1 != null; localReferenceEntry1 = localReferenceEntry1.getNext())
      {
        Object localObject1 = localReferenceEntry1.getKey();
        if ((localReferenceEntry1.getHash() == paramInt) && (localObject1 != null) && (map.keyEquivalence.equivalent(paramK, localObject1)))
        {
          LocalCache.ValueReference localValueReference = localReferenceEntry1.getValueReference();
          Object localObject2 = localValueReference.get();
          if (localObject2 == null)
          {
            if (localValueReference.isActive())
            {
              int j = count;
              modCount += 1;
              paramK = removeValueFromChain(localReferenceEntry2, localReferenceEntry1, localObject1, paramInt, localValueReference, RemovalCause.COLLECTED);
              paramInt = count;
              localAtomicReferenceArray.set(i, paramK);
              count = (paramInt - 1);
            }
            return false;
          }
          if (map.valueEquivalence.equivalent(paramV1, localObject2))
          {
            modCount += 1;
            enqueueNotification(paramK, paramInt, localValueReference, RemovalCause.REPLACED);
            setValue(localReferenceEntry1, paramK, paramV2, l);
            evictEntries();
            return true;
          }
          recordLockedRead(localReferenceEntry1, l);
          return false;
        }
      }
      return false;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  void runLockedCleanup(long paramLong)
  {
    if (tryLock()) {}
    try
    {
      drainReferenceQueues();
      expireEntries(paramLong);
      readCount.set(0);
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  void runUnlockedCleanup()
  {
    if (!isHeldByCurrentThread()) {
      map.processPendingNotifications();
    }
  }
  
  V scheduleRefresh(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, K paramK, int paramInt, V paramV, long paramLong, CacheLoader<? super K, V> paramCacheLoader)
  {
    if ((map.refreshes()) && (paramLong - paramReferenceEntry.getWriteTime() > map.refreshNanos) && (!paramReferenceEntry.getValueReference().isLoading()))
    {
      paramReferenceEntry = refresh(paramK, paramInt, paramCacheLoader, true);
      if (paramReferenceEntry != null) {
        return paramReferenceEntry;
      }
    }
    return paramV;
  }
  
  @GuardedBy("Segment.this")
  void setValue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, K paramK, V paramV, long paramLong)
  {
    LocalCache.ValueReference localValueReference = paramReferenceEntry.getValueReference();
    int i = map.weigher.weigh(paramK, paramV);
    if (i >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Weights must be non-negative");
      paramReferenceEntry.setValueReference(map.valueStrength.referenceValue(this, paramReferenceEntry, paramV, i));
      recordWrite(paramReferenceEntry, i, paramLong);
      localValueReference.notifyNewValue(paramV);
      return;
    }
  }
  
  boolean storeLoadedValue(K paramK, int paramInt, LocalCache.LoadingValueReference<K, V> paramLoadingValueReference, V paramV)
  {
    lock();
    try
    {
      long l = map.ticker.read();
      preWriteCleanup(l);
      int j = count + 1;
      int i = j;
      if (j > threshold)
      {
        expand();
        i = count + 1;
      }
      Object localObject3 = table;
      j = paramInt & ((AtomicReferenceArray)localObject3).length() - 1;
      Object localObject2 = (LocalCache.ReferenceEntry)((AtomicReferenceArray)localObject3).get(j);
      for (Object localObject1 = localObject2; localObject1 != null; localObject1 = ((LocalCache.ReferenceEntry)localObject1).getNext())
      {
        Object localObject4 = ((LocalCache.ReferenceEntry)localObject1).getKey();
        if ((((LocalCache.ReferenceEntry)localObject1).getHash() == paramInt) && (localObject4 != null) && (map.keyEquivalence.equivalent(paramK, localObject4)))
        {
          localObject2 = ((LocalCache.ReferenceEntry)localObject1).getValueReference();
          localObject3 = ((LocalCache.ValueReference)localObject2).get();
          if ((paramLoadingValueReference == localObject2) || ((localObject3 == null) && (localObject2 != LocalCache.UNSET)))
          {
            modCount += 1;
            j = i;
            if (paramLoadingValueReference.isActive()) {
              if (localObject3 != null) {
                break label248;
              }
            }
            label248:
            for (localObject2 = RemovalCause.COLLECTED;; localObject2 = RemovalCause.REPLACED)
            {
              enqueueNotification(paramK, paramInt, paramLoadingValueReference, (RemovalCause)localObject2);
              j = i - 1;
              setValue((LocalCache.ReferenceEntry)localObject1, paramK, paramV, l);
              count = j;
              evictEntries();
              return true;
            }
          }
          enqueueNotification(paramK, paramInt, new LocalCache.WeightedStrongValueReference(paramV, 0), RemovalCause.REPLACED);
          return false;
        }
      }
      modCount += 1;
      paramLoadingValueReference = newEntry(paramK, paramInt, (LocalCache.ReferenceEntry)localObject2);
      setValue(paramLoadingValueReference, paramK, paramV, l);
      ((AtomicReferenceArray)localObject3).set(j, paramLoadingValueReference);
      count = i;
      evictEntries();
      return true;
    }
    finally
    {
      unlock();
      postWriteCleanup();
    }
  }
  
  void tryDrainReferenceQueues()
  {
    if (tryLock()) {}
    try
    {
      drainReferenceQueues();
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  void tryExpireEntries(long paramLong)
  {
    if (tryLock()) {}
    try
    {
      expireEntries(paramLong);
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  V waitForLoadingValue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry, K paramK, LocalCache.ValueReference<K, V> paramValueReference)
    throws ExecutionException
  {
    if (!paramValueReference.isLoading()) {
      throw new AssertionError();
    }
    if (!Thread.holdsLock(paramReferenceEntry)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Recursive load of: %s", new Object[] { paramK });
      try
      {
        paramValueReference = paramValueReference.waitForValue();
        if (paramValueReference != null) {
          break;
        }
        throw new CacheLoader.InvalidCacheLoadException("CacheLoader returned null for key " + paramK + ".");
      }
      finally
      {
        statsCounter.recordMisses(1);
      }
    }
    recordRead(paramReferenceEntry, map.ticker.read());
    statsCounter.recordMisses(1);
    return paramValueReference;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.Segment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */