package com.google.common.util.concurrent;

import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

class Futures$CombinedFuture<V, C>
  extends AbstractFuture<C>
{
  private static final Logger logger = Logger.getLogger(CombinedFuture.class.getName());
  final boolean allMustSucceed;
  Futures.FutureCombiner<V, C> combiner;
  ImmutableCollection<? extends ListenableFuture<? extends V>> futures;
  final AtomicInteger remaining;
  Set<Throwable> seenExceptions;
  final Object seenExceptionsLock = new Object();
  List<Optional<V>> values;
  
  Futures$CombinedFuture(ImmutableCollection<? extends ListenableFuture<? extends V>> paramImmutableCollection, boolean paramBoolean, Executor paramExecutor, Futures.FutureCombiner<V, C> paramFutureCombiner)
  {
    futures = paramImmutableCollection;
    allMustSucceed = paramBoolean;
    remaining = new AtomicInteger(paramImmutableCollection.size());
    combiner = paramFutureCombiner;
    values = Lists.newArrayListWithCapacity(paramImmutableCollection.size());
    init(paramExecutor);
  }
  
  private void setExceptionAndMaybeLog(Throwable paramThrowable)
  {
    boolean bool2 = false;
    boolean bool1 = true;
    if (allMustSucceed) {
      bool2 = super.setException(paramThrowable);
    }
    synchronized (seenExceptionsLock)
    {
      if (seenExceptions == null) {
        seenExceptions = Sets.newHashSet();
      }
      bool1 = seenExceptions.add(paramThrowable);
      if (((paramThrowable instanceof Error)) || ((allMustSucceed) && (!bool2) && (bool1))) {
        logger.log(Level.SEVERE, "input future failed.", paramThrowable);
      }
      return;
    }
  }
  
  private void setOneValue(int paramInt, Future<? extends V> paramFuture)
  {
    boolean bool3 = true;
    boolean bool4 = true;
    boolean bool5 = true;
    boolean bool6 = true;
    boolean bool2 = true;
    List localList = values;
    if ((isDone()) || (localList == null))
    {
      if ((!allMustSucceed) && (!isCancelled())) {
        break label142;
      }
      bool1 = true;
      Preconditions.checkState(bool1, "Future was done before all dependencies completed");
    }
    for (;;)
    {
      try
      {
        Preconditions.checkState(paramFuture.isDone(), "Tried to set value from future which is not done");
        paramFuture = Uninterruptibles.getUninterruptibly(paramFuture);
        if (localList != null) {
          localList.set(paramInt, Optional.fromNullable(paramFuture));
        }
        paramInt = remaining.decrementAndGet();
        if (paramInt < 0) {
          continue;
        }
        bool1 = bool2;
        Preconditions.checkState(bool1, "Less than 0 remaining futures");
        if (paramInt == 0)
        {
          paramFuture = combiner;
          if ((paramFuture == null) || (localList == null)) {
            continue;
          }
          set(paramFuture.combine(localList));
        }
        return;
      }
      catch (CancellationException paramFuture)
      {
        if (!allMustSucceed) {
          continue;
        }
        cancel(false);
        paramInt = remaining.decrementAndGet();
        if (paramInt < 0) {
          continue;
        }
        bool1 = bool3;
        Preconditions.checkState(bool1, "Less than 0 remaining futures");
        if (paramInt != 0) {
          continue;
        }
        paramFuture = combiner;
        if ((paramFuture == null) || (localList == null)) {
          continue;
        }
        set(paramFuture.combine(localList));
        return;
        bool1 = false;
        continue;
        Preconditions.checkState(isDone());
        return;
      }
      catch (ExecutionException paramFuture)
      {
        setExceptionAndMaybeLog(paramFuture.getCause());
        paramInt = remaining.decrementAndGet();
        if (paramInt < 0) {
          continue;
        }
        bool1 = bool4;
        Preconditions.checkState(bool1, "Less than 0 remaining futures");
        if (paramInt != 0) {
          continue;
        }
        paramFuture = combiner;
        if ((paramFuture == null) || (localList == null)) {
          continue;
        }
        set(paramFuture.combine(localList));
        return;
        bool1 = false;
        continue;
        Preconditions.checkState(isDone());
        return;
      }
      catch (Throwable paramFuture)
      {
        label142:
        setExceptionAndMaybeLog(paramFuture);
        paramInt = remaining.decrementAndGet();
        if (paramInt < 0) {
          continue;
        }
        bool1 = bool5;
        Preconditions.checkState(bool1, "Less than 0 remaining futures");
        if (paramInt != 0) {
          continue;
        }
        paramFuture = combiner;
        if ((paramFuture == null) || (localList == null)) {
          continue;
        }
        set(paramFuture.combine(localList));
        return;
        bool1 = false;
        continue;
        Preconditions.checkState(isDone());
        return;
      }
      finally
      {
        paramInt = remaining.decrementAndGet();
        if (paramInt < 0) {
          break label445;
        }
      }
      bool1 = false;
      break;
      bool1 = false;
    }
    Preconditions.checkState(isDone());
    return;
    boolean bool1 = bool6;
    Preconditions.checkState(bool1, "Less than 0 remaining futures");
    if (paramInt == 0)
    {
      Futures.FutureCombiner localFutureCombiner = combiner;
      if ((localFutureCombiner == null) || (localList == null)) {
        break label450;
      }
      set(localFutureCombiner.combine(localList));
    }
    for (;;)
    {
      throw paramFuture;
      label445:
      bool1 = false;
      break;
      label450:
      Preconditions.checkState(isDone());
    }
  }
  
  protected void init(Executor paramExecutor)
  {
    addListener(new Runnable()
    {
      public void run()
      {
        if (isCancelled())
        {
          Iterator localIterator = futures.iterator();
          while (localIterator.hasNext()) {
            ((ListenableFuture)localIterator.next()).cancel(wasInterrupted());
          }
        }
        futures = null;
        values = null;
        combiner = null;
      }
    }, MoreExecutors.sameThreadExecutor());
    if (futures.isEmpty()) {
      set(combiner.combine(ImmutableList.of()));
    }
    for (;;)
    {
      return;
      final int i = 0;
      while (i < futures.size())
      {
        values.add(null);
        i += 1;
      }
      i = 0;
      Iterator localIterator = futures.iterator();
      while (localIterator.hasNext())
      {
        final ListenableFuture localListenableFuture = (ListenableFuture)localIterator.next();
        localListenableFuture.addListener(new Runnable()
        {
          public void run()
          {
            Futures.CombinedFuture.this.setOneValue(i, localListenableFuture);
          }
        }, paramExecutor);
        i += 1;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.CombinedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */