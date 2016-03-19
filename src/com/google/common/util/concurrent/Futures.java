package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;
import com.google.common.collect.Lists;
import com.google.common.collect.Ordering;
import com.google.common.collect.Queues;
import com.google.common.collect.Sets;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Nullable;

@Beta
public final class Futures
{
  private static final AsyncFunction<ListenableFuture<Object>, Object> DEREFERENCER = new AsyncFunction()
  {
    public ListenableFuture<Object> apply(ListenableFuture<Object> paramAnonymousListenableFuture)
    {
      return paramAnonymousListenableFuture;
    }
  };
  private static final Ordering<Constructor<?>> WITH_STRING_PARAM_FIRST = Ordering.natural().onResultOf(new Function()
  {
    public Boolean apply(Constructor<?> paramAnonymousConstructor)
    {
      return Boolean.valueOf(Arrays.asList(paramAnonymousConstructor.getParameterTypes()).contains(String.class));
    }
  }).reverse();
  
  public static <V> void addCallback(ListenableFuture<V> paramListenableFuture, FutureCallback<? super V> paramFutureCallback)
  {
    addCallback(paramListenableFuture, paramFutureCallback, MoreExecutors.sameThreadExecutor());
  }
  
  public static <V> void addCallback(ListenableFuture<V> paramListenableFuture, final FutureCallback<? super V> paramFutureCallback, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramFutureCallback);
    paramListenableFuture.addListener(new Runnable()
    {
      public void run()
      {
        try
        {
          Object localObject = Uninterruptibles.getUninterruptibly(val$future);
          paramFutureCallback.onSuccess(localObject);
          return;
        }
        catch (ExecutionException localExecutionException)
        {
          paramFutureCallback.onFailure(localExecutionException.getCause());
          return;
        }
        catch (RuntimeException localRuntimeException)
        {
          paramFutureCallback.onFailure(localRuntimeException);
          return;
        }
        catch (Error localError)
        {
          paramFutureCallback.onFailure(localError);
        }
      }
    }, paramExecutor);
  }
  
  @Beta
  public static <V> ListenableFuture<List<V>> allAsList(Iterable<? extends ListenableFuture<? extends V>> paramIterable)
  {
    return listFuture(ImmutableList.copyOf(paramIterable), true, MoreExecutors.sameThreadExecutor());
  }
  
  @Beta
  public static <V> ListenableFuture<List<V>> allAsList(ListenableFuture<? extends V>... paramVarArgs)
  {
    return listFuture(ImmutableList.copyOf(paramVarArgs), true, MoreExecutors.sameThreadExecutor());
  }
  
  public static <V> ListenableFuture<V> dereference(ListenableFuture<? extends ListenableFuture<? extends V>> paramListenableFuture)
  {
    return transform(paramListenableFuture, DEREFERENCER);
  }
  
  public static <V, X extends Exception> V get(Future<V> paramFuture, long paramLong, TimeUnit paramTimeUnit, Class<X> paramClass)
    throws Exception
  {
    Preconditions.checkNotNull(paramFuture);
    Preconditions.checkNotNull(paramTimeUnit);
    if (!RuntimeException.class.isAssignableFrom(paramClass)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Futures.get exception type (%s) must not be a RuntimeException", new Object[] { paramClass });
      try
      {
        paramFuture = paramFuture.get(paramLong, paramTimeUnit);
        return paramFuture;
      }
      catch (InterruptedException paramFuture)
      {
        Thread.currentThread().interrupt();
        throw newWithCause(paramClass, paramFuture);
      }
      catch (TimeoutException paramFuture)
      {
        throw newWithCause(paramClass, paramFuture);
      }
      catch (ExecutionException paramFuture)
      {
        wrapAndThrowExceptionOrError(paramFuture.getCause(), paramClass);
        throw new AssertionError();
      }
    }
  }
  
  public static <V, X extends Exception> V get(Future<V> paramFuture, Class<X> paramClass)
    throws Exception
  {
    Preconditions.checkNotNull(paramFuture);
    if (!RuntimeException.class.isAssignableFrom(paramClass)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Futures.get exception type (%s) must not be a RuntimeException", new Object[] { paramClass });
      try
      {
        paramFuture = paramFuture.get();
        return paramFuture;
      }
      catch (InterruptedException paramFuture)
      {
        Thread.currentThread().interrupt();
        throw newWithCause(paramClass, paramFuture);
      }
      catch (ExecutionException paramFuture)
      {
        wrapAndThrowExceptionOrError(paramFuture.getCause(), paramClass);
        throw new AssertionError();
      }
    }
  }
  
  public static <V> V getUnchecked(Future<V> paramFuture)
  {
    Preconditions.checkNotNull(paramFuture);
    try
    {
      paramFuture = Uninterruptibles.getUninterruptibly(paramFuture);
      return paramFuture;
    }
    catch (ExecutionException paramFuture)
    {
      wrapAndThrowUnchecked(paramFuture.getCause());
      throw new AssertionError();
    }
  }
  
  public static <V> ListenableFuture<V> immediateCancelledFuture()
  {
    return new ImmediateCancelledFuture();
  }
  
  public static <V, X extends Exception> CheckedFuture<V, X> immediateCheckedFuture(@Nullable V paramV)
  {
    return new ImmediateSuccessfulCheckedFuture(paramV);
  }
  
  public static <V, X extends Exception> CheckedFuture<V, X> immediateFailedCheckedFuture(X paramX)
  {
    Preconditions.checkNotNull(paramX);
    return new ImmediateFailedCheckedFuture(paramX);
  }
  
  public static <V> ListenableFuture<V> immediateFailedFuture(Throwable paramThrowable)
  {
    Preconditions.checkNotNull(paramThrowable);
    return new ImmediateFailedFuture(paramThrowable);
  }
  
  public static <V> ListenableFuture<V> immediateFuture(@Nullable V paramV)
  {
    return new ImmediateSuccessfulFuture(paramV);
  }
  
  @Beta
  public static <T> ImmutableList<ListenableFuture<T>> inCompletionOrder(Iterable<? extends ListenableFuture<? extends T>> paramIterable)
  {
    ConcurrentLinkedQueue localConcurrentLinkedQueue = Queues.newConcurrentLinkedQueue();
    ImmutableList.Builder localBuilder = ImmutableList.builder();
    SerializingExecutor localSerializingExecutor = new SerializingExecutor(MoreExecutors.sameThreadExecutor());
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext())
    {
      final ListenableFuture localListenableFuture = (ListenableFuture)paramIterable.next();
      AsyncSettableFuture localAsyncSettableFuture = AsyncSettableFuture.create();
      localConcurrentLinkedQueue.add(localAsyncSettableFuture);
      localListenableFuture.addListener(new Runnable()
      {
        public void run()
        {
          ((AsyncSettableFuture)val$delegates.remove()).setFuture(localListenableFuture);
        }
      }, localSerializingExecutor);
      localBuilder.add(localAsyncSettableFuture);
    }
    return localBuilder.build();
  }
  
  public static <I, O> Future<O> lazyTransform(Future<I> paramFuture, final Function<? super I, ? extends O> paramFunction)
  {
    Preconditions.checkNotNull(paramFuture);
    Preconditions.checkNotNull(paramFunction);
    new Future()
    {
      private O applyTransformation(I paramAnonymousI)
        throws ExecutionException
      {
        try
        {
          paramAnonymousI = paramFunction.apply(paramAnonymousI);
          return paramAnonymousI;
        }
        catch (Throwable paramAnonymousI)
        {
          throw new ExecutionException(paramAnonymousI);
        }
      }
      
      public boolean cancel(boolean paramAnonymousBoolean)
      {
        return val$input.cancel(paramAnonymousBoolean);
      }
      
      public O get()
        throws InterruptedException, ExecutionException
      {
        return (O)applyTransformation(val$input.get());
      }
      
      public O get(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
        throws InterruptedException, ExecutionException, TimeoutException
      {
        return (O)applyTransformation(val$input.get(paramAnonymousLong, paramAnonymousTimeUnit));
      }
      
      public boolean isCancelled()
      {
        return val$input.isCancelled();
      }
      
      public boolean isDone()
      {
        return val$input.isDone();
      }
    };
  }
  
  private static <V> ListenableFuture<List<V>> listFuture(ImmutableList<ListenableFuture<? extends V>> paramImmutableList, boolean paramBoolean, Executor paramExecutor)
  {
    new CombinedFuture(paramImmutableList, paramBoolean, paramExecutor, new FutureCombiner()
    {
      public List<V> combine(List<Optional<V>> paramAnonymousList)
      {
        ArrayList localArrayList = Lists.newArrayList();
        Iterator localIterator = paramAnonymousList.iterator();
        if (localIterator.hasNext())
        {
          paramAnonymousList = (Optional)localIterator.next();
          if (paramAnonymousList != null) {}
          for (paramAnonymousList = paramAnonymousList.orNull();; paramAnonymousList = null)
          {
            localArrayList.add(paramAnonymousList);
            break;
          }
        }
        return Collections.unmodifiableList(localArrayList);
      }
    });
  }
  
  public static <V, X extends Exception> CheckedFuture<V, X> makeChecked(ListenableFuture<V> paramListenableFuture, Function<Exception, X> paramFunction)
  {
    return new MappingCheckedFuture((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture), paramFunction);
  }
  
  @Nullable
  private static <X> X newFromConstructor(Constructor<X> paramConstructor, Throwable paramThrowable)
  {
    Object localObject2 = null;
    Class[] arrayOfClass = paramConstructor.getParameterTypes();
    Object[] arrayOfObject = new Object[arrayOfClass.length];
    int i = 0;
    Object localObject1;
    if (i < arrayOfClass.length)
    {
      Class localClass = arrayOfClass[i];
      if (localClass.equals(String.class)) {
        arrayOfObject[i] = paramThrowable.toString();
      }
      for (;;)
      {
        i += 1;
        break;
        localObject1 = localObject2;
        if (!localClass.equals(Throwable.class)) {
          break label87;
        }
        arrayOfObject[i] = paramThrowable;
      }
    }
    try
    {
      localObject1 = paramConstructor.newInstance(arrayOfObject);
      label87:
      return (X)localObject1;
    }
    catch (IllegalArgumentException paramConstructor)
    {
      return null;
    }
    catch (InstantiationException paramConstructor)
    {
      return null;
    }
    catch (IllegalAccessException paramConstructor)
    {
      return null;
    }
    catch (InvocationTargetException paramConstructor) {}
    return null;
  }
  
  private static <X extends Exception> X newWithCause(Class<X> paramClass, Throwable paramThrowable)
  {
    Iterator localIterator = preferringStrings(Arrays.asList(paramClass.getConstructors())).iterator();
    while (localIterator.hasNext())
    {
      Exception localException = (Exception)newFromConstructor((Constructor)localIterator.next(), paramThrowable);
      if (localException != null)
      {
        if (localException.getCause() == null) {
          localException.initCause(paramThrowable);
        }
        return localException;
      }
    }
    throw new IllegalArgumentException("No appropriate constructor for exception of type " + paramClass + " in response to chained exception", paramThrowable);
  }
  
  public static <V> ListenableFuture<V> nonCancellationPropagating(ListenableFuture<V> paramListenableFuture)
  {
    return new NonCancellationPropagatingFuture(paramListenableFuture);
  }
  
  private static <X extends Exception> List<Constructor<X>> preferringStrings(List<Constructor<X>> paramList)
  {
    return WITH_STRING_PARAM_FIRST.sortedCopy(paramList);
  }
  
  @Beta
  public static <V> ListenableFuture<List<V>> successfulAsList(Iterable<? extends ListenableFuture<? extends V>> paramIterable)
  {
    return listFuture(ImmutableList.copyOf(paramIterable), false, MoreExecutors.sameThreadExecutor());
  }
  
  @Beta
  public static <V> ListenableFuture<List<V>> successfulAsList(ListenableFuture<? extends V>... paramVarArgs)
  {
    return listFuture(ImmutableList.copyOf(paramVarArgs), false, MoreExecutors.sameThreadExecutor());
  }
  
  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, Function<? super I, ? extends O> paramFunction)
  {
    return transform(paramListenableFuture, paramFunction, MoreExecutors.sameThreadExecutor());
  }
  
  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, Function<? super I, ? extends O> paramFunction, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramFunction);
    transform(paramListenableFuture, new AsyncFunction()
    {
      public ListenableFuture<O> apply(I paramAnonymousI)
      {
        return Futures.immediateFuture(val$function.apply(paramAnonymousI));
      }
    }, paramExecutor);
  }
  
  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, AsyncFunction<? super I, ? extends O> paramAsyncFunction)
  {
    return transform(paramListenableFuture, paramAsyncFunction, MoreExecutors.sameThreadExecutor());
  }
  
  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, AsyncFunction<? super I, ? extends O> paramAsyncFunction, Executor paramExecutor)
  {
    paramAsyncFunction = new ChainingListenableFuture(paramAsyncFunction, paramListenableFuture, null);
    paramListenableFuture.addListener(paramAsyncFunction, paramExecutor);
    return paramAsyncFunction;
  }
  
  public static <V> ListenableFuture<V> withFallback(ListenableFuture<? extends V> paramListenableFuture, FutureFallback<? extends V> paramFutureFallback)
  {
    return withFallback(paramListenableFuture, paramFutureFallback, MoreExecutors.sameThreadExecutor());
  }
  
  public static <V> ListenableFuture<V> withFallback(ListenableFuture<? extends V> paramListenableFuture, FutureFallback<? extends V> paramFutureFallback, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramFutureFallback);
    return new FallbackFuture(paramListenableFuture, paramFutureFallback, paramExecutor);
  }
  
  private static <X extends Exception> void wrapAndThrowExceptionOrError(Throwable paramThrowable, Class<X> paramClass)
    throws Exception
  {
    if ((paramThrowable instanceof Error)) {
      throw new ExecutionError((Error)paramThrowable);
    }
    if ((paramThrowable instanceof RuntimeException)) {
      throw new UncheckedExecutionException(paramThrowable);
    }
    throw newWithCause(paramClass, paramThrowable);
  }
  
  private static void wrapAndThrowUnchecked(Throwable paramThrowable)
  {
    if ((paramThrowable instanceof Error)) {
      throw new ExecutionError((Error)paramThrowable);
    }
    throw new UncheckedExecutionException(paramThrowable);
  }
  
  private static class ChainingListenableFuture<I, O>
    extends AbstractFuture<O>
    implements Runnable
  {
    private AsyncFunction<? super I, ? extends O> function;
    private ListenableFuture<? extends I> inputFuture;
    private final CountDownLatch outputCreated = new CountDownLatch(1);
    private volatile ListenableFuture<? extends O> outputFuture;
    
    private ChainingListenableFuture(AsyncFunction<? super I, ? extends O> paramAsyncFunction, ListenableFuture<? extends I> paramListenableFuture)
    {
      function = ((AsyncFunction)Preconditions.checkNotNull(paramAsyncFunction));
      inputFuture = ((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
    }
    
    private void cancel(@Nullable Future<?> paramFuture, boolean paramBoolean)
    {
      if (paramFuture != null) {
        paramFuture.cancel(paramBoolean);
      }
    }
    
    public boolean cancel(boolean paramBoolean)
    {
      if (super.cancel(paramBoolean))
      {
        cancel(inputFuture, paramBoolean);
        cancel(outputFuture, paramBoolean);
        return true;
      }
      return false;
    }
    
    public void run()
    {
      try
      {
        Object localObject1 = Uninterruptibles.getUninterruptibly(inputFuture);
        localObject1 = (ListenableFuture)Preconditions.checkNotNull(function.apply(localObject1), "AsyncFunction may not return null.");
        outputFuture = ((ListenableFuture)localObject1);
        if (isCancelled())
        {
          ((ListenableFuture)localObject1).cancel(wasInterrupted());
          outputFuture = null;
          return;
        }
      }
      catch (CancellationException localCancellationException)
      {
        cancel(false);
        return;
      }
      catch (ExecutionException localExecutionException)
      {
        setException(localExecutionException.getCause());
        return;
        localExecutionException.addListener(new Runnable()
        {
          public void run()
          {
            try
            {
              set(Uninterruptibles.getUninterruptibly(localExecutionException));
              return;
            }
            catch (CancellationException localCancellationException)
            {
              cancel(false);
              return;
            }
            catch (ExecutionException localExecutionException)
            {
              setException(localExecutionException.getCause());
              return;
            }
            finally
            {
              Futures.ChainingListenableFuture.access$302(Futures.ChainingListenableFuture.this, null);
            }
          }
        }, MoreExecutors.sameThreadExecutor());
        return;
      }
      catch (UndeclaredThrowableException localUndeclaredThrowableException)
      {
        setException(localUndeclaredThrowableException.getCause());
        return;
      }
      catch (Throwable localThrowable)
      {
        setException(localThrowable);
        return;
      }
      finally
      {
        function = null;
        inputFuture = null;
        outputCreated.countDown();
      }
    }
  }
  
  private static class CombinedFuture<V, C>
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
    
    CombinedFuture(ImmutableCollection<? extends ListenableFuture<? extends V>> paramImmutableCollection, boolean paramBoolean, Executor paramExecutor, Futures.FutureCombiner<V, C> paramFutureCombiner)
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
  
  private static class FallbackFuture<V>
    extends AbstractFuture<V>
  {
    private volatile ListenableFuture<? extends V> running;
    
    FallbackFuture(ListenableFuture<? extends V> paramListenableFuture, final FutureFallback<? extends V> paramFutureFallback, Executor paramExecutor)
    {
      running = paramListenableFuture;
      Futures.addCallback(running, new FutureCallback()
      {
        public void onFailure(Throwable paramAnonymousThrowable)
        {
          if (isCancelled()) {
            return;
          }
          try
          {
            Futures.FallbackFuture.access$102(Futures.FallbackFuture.this, paramFutureFallback.create(paramAnonymousThrowable));
            if (isCancelled())
            {
              running.cancel(wasInterrupted());
              return;
            }
          }
          catch (Throwable paramAnonymousThrowable)
          {
            setException(paramAnonymousThrowable);
            return;
          }
          Futures.addCallback(running, new FutureCallback()
          {
            public void onFailure(Throwable paramAnonymous2Throwable)
            {
              if (running.isCancelled())
              {
                cancel(false);
                return;
              }
              setException(paramAnonymous2Throwable);
            }
            
            public void onSuccess(V paramAnonymous2V)
            {
              set(paramAnonymous2V);
            }
          }, MoreExecutors.sameThreadExecutor());
        }
        
        public void onSuccess(V paramAnonymousV)
        {
          set(paramAnonymousV);
        }
      }, paramExecutor);
    }
    
    public boolean cancel(boolean paramBoolean)
    {
      if (super.cancel(paramBoolean))
      {
        running.cancel(paramBoolean);
        return true;
      }
      return false;
    }
  }
  
  private static abstract interface FutureCombiner<V, C>
  {
    public abstract C combine(List<Optional<V>> paramList);
  }
  
  private static class ImmediateCancelledFuture<V>
    extends Futures.ImmediateFuture<V>
  {
    private final CancellationException thrown = new CancellationException("Immediate cancelled future.");
    
    ImmediateCancelledFuture()
    {
      super();
    }
    
    public V get()
    {
      throw AbstractFuture.cancellationExceptionWithCause("Task was cancelled.", thrown);
    }
    
    public boolean isCancelled()
    {
      return true;
    }
  }
  
  private static class ImmediateFailedCheckedFuture<V, X extends Exception>
    extends Futures.ImmediateFuture<V>
    implements CheckedFuture<V, X>
  {
    private final X thrown;
    
    ImmediateFailedCheckedFuture(X paramX)
    {
      super();
      thrown = paramX;
    }
    
    public V checkedGet()
      throws Exception
    {
      throw thrown;
    }
    
    public V checkedGet(long paramLong, TimeUnit paramTimeUnit)
      throws Exception
    {
      Preconditions.checkNotNull(paramTimeUnit);
      throw thrown;
    }
    
    public V get()
      throws ExecutionException
    {
      throw new ExecutionException(thrown);
    }
  }
  
  private static class ImmediateFailedFuture<V>
    extends Futures.ImmediateFuture<V>
  {
    private final Throwable thrown;
    
    ImmediateFailedFuture(Throwable paramThrowable)
    {
      super();
      thrown = paramThrowable;
    }
    
    public V get()
      throws ExecutionException
    {
      throw new ExecutionException(thrown);
    }
  }
  
  private static abstract class ImmediateFuture<V>
    implements ListenableFuture<V>
  {
    private static final Logger log = Logger.getLogger(ImmediateFuture.class.getName());
    
    public void addListener(Runnable paramRunnable, Executor paramExecutor)
    {
      Preconditions.checkNotNull(paramRunnable, "Runnable was null.");
      Preconditions.checkNotNull(paramExecutor, "Executor was null.");
      try
      {
        paramExecutor.execute(paramRunnable);
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        log.log(Level.SEVERE, "RuntimeException while executing runnable " + paramRunnable + " with executor " + paramExecutor, localRuntimeException);
      }
    }
    
    public boolean cancel(boolean paramBoolean)
    {
      return false;
    }
    
    public abstract V get()
      throws ExecutionException;
    
    public V get(long paramLong, TimeUnit paramTimeUnit)
      throws ExecutionException
    {
      Preconditions.checkNotNull(paramTimeUnit);
      return (V)get();
    }
    
    public boolean isCancelled()
    {
      return false;
    }
    
    public boolean isDone()
    {
      return true;
    }
  }
  
  private static class ImmediateSuccessfulCheckedFuture<V, X extends Exception>
    extends Futures.ImmediateFuture<V>
    implements CheckedFuture<V, X>
  {
    @Nullable
    private final V value;
    
    ImmediateSuccessfulCheckedFuture(@Nullable V paramV)
    {
      super();
      value = paramV;
    }
    
    public V checkedGet()
    {
      return (V)value;
    }
    
    public V checkedGet(long paramLong, TimeUnit paramTimeUnit)
    {
      Preconditions.checkNotNull(paramTimeUnit);
      return (V)value;
    }
    
    public V get()
    {
      return (V)value;
    }
  }
  
  private static class ImmediateSuccessfulFuture<V>
    extends Futures.ImmediateFuture<V>
  {
    @Nullable
    private final V value;
    
    ImmediateSuccessfulFuture(@Nullable V paramV)
    {
      super();
      value = paramV;
    }
    
    public V get()
    {
      return (V)value;
    }
  }
  
  private static class MappingCheckedFuture<V, X extends Exception>
    extends AbstractCheckedFuture<V, X>
  {
    final Function<Exception, X> mapper;
    
    MappingCheckedFuture(ListenableFuture<V> paramListenableFuture, Function<Exception, X> paramFunction)
    {
      super();
      mapper = ((Function)Preconditions.checkNotNull(paramFunction));
    }
    
    protected X mapException(Exception paramException)
    {
      return (Exception)mapper.apply(paramException);
    }
  }
  
  private static class NonCancellationPropagatingFuture<V>
    extends AbstractFuture<V>
  {
    NonCancellationPropagatingFuture(final ListenableFuture<V> paramListenableFuture)
    {
      Preconditions.checkNotNull(paramListenableFuture);
      Futures.addCallback(paramListenableFuture, new FutureCallback()
      {
        public void onFailure(Throwable paramAnonymousThrowable)
        {
          if (paramListenableFuture.isCancelled())
          {
            cancel(false);
            return;
          }
          setException(paramAnonymousThrowable);
        }
        
        public void onSuccess(V paramAnonymousV)
        {
          set(paramAnonymousV);
        }
      }, MoreExecutors.sameThreadExecutor());
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */