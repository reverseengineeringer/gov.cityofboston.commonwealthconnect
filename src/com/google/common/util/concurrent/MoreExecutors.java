package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Delayed;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public final class MoreExecutors
{
  @Beta
  public static void addDelayedShutdownHook(ExecutorService paramExecutorService, long paramLong, TimeUnit paramTimeUnit)
  {
    new Application().addDelayedShutdownHook(paramExecutorService, paramLong, paramTimeUnit);
  }
  
  @Beta
  public static ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor)
  {
    return new Application().getExitingExecutorService(paramThreadPoolExecutor);
  }
  
  @Beta
  public static ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    return new Application().getExitingExecutorService(paramThreadPoolExecutor, paramLong, paramTimeUnit);
  }
  
  @Beta
  public static ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
  {
    return new Application().getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor);
  }
  
  @Beta
  public static ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    return new Application().getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor, paramLong, paramTimeUnit);
  }
  
  /* Error */
  static <T> T invokeAnyImpl(ListeningExecutorService paramListeningExecutorService, java.util.Collection<? extends Callable<T>> paramCollection, boolean paramBoolean, long paramLong)
    throws InterruptedException, java.util.concurrent.ExecutionException, java.util.concurrent.TimeoutException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 79	com/google/common/base/Preconditions:checkNotNull	(Ljava/lang/Object;)Ljava/lang/Object;
    //   4: pop
    //   5: aload_1
    //   6: invokeinterface 85 1 0
    //   11: istore 5
    //   13: iload 5
    //   15: ifle +218 -> 233
    //   18: iconst_1
    //   19: istore 9
    //   21: iload 9
    //   23: invokestatic 89	com/google/common/base/Preconditions:checkArgument	(Z)V
    //   26: iload 5
    //   28: invokestatic 95	com/google/common/collect/Lists:newArrayListWithCapacity	(I)Ljava/util/ArrayList;
    //   31: astore 18
    //   33: invokestatic 101	com/google/common/collect/Queues:newLinkedBlockingQueue	()Ljava/util/concurrent/LinkedBlockingQueue;
    //   36: astore 19
    //   38: iload_2
    //   39: ifeq +200 -> 239
    //   42: invokestatic 107	java/lang/System:nanoTime	()J
    //   45: lstore 10
    //   47: aload_1
    //   48: invokeinterface 111 1 0
    //   53: astore 20
    //   55: aload 18
    //   57: aload_0
    //   58: aload 20
    //   60: invokeinterface 117 1 0
    //   65: checkcast 119	java/util/concurrent/Callable
    //   68: aload 19
    //   70: invokestatic 123	com/google/common/util/concurrent/MoreExecutors:submitAndAddQueueListener	(Lcom/google/common/util/concurrent/ListeningExecutorService;Ljava/util/concurrent/Callable;Ljava/util/concurrent/BlockingQueue;)Lcom/google/common/util/concurrent/ListenableFuture;
    //   73: invokeinterface 129 2 0
    //   78: pop
    //   79: iload 5
    //   81: iconst_1
    //   82: isub
    //   83: istore 8
    //   85: iconst_1
    //   86: istore 5
    //   88: aconst_null
    //   89: astore_1
    //   90: aload 19
    //   92: invokeinterface 134 1 0
    //   97: checkcast 136	java/util/concurrent/Future
    //   100: astore 17
    //   102: iload 5
    //   104: istore 6
    //   106: aload 17
    //   108: astore 16
    //   110: iload 8
    //   112: istore 7
    //   114: lload 10
    //   116: lstore 12
    //   118: lload_3
    //   119: lstore 14
    //   121: aload 17
    //   123: ifnonnull +55 -> 178
    //   126: iload 8
    //   128: ifle +117 -> 245
    //   131: iload 8
    //   133: iconst_1
    //   134: isub
    //   135: istore 7
    //   137: aload 18
    //   139: aload_0
    //   140: aload 20
    //   142: invokeinterface 117 1 0
    //   147: checkcast 119	java/util/concurrent/Callable
    //   150: aload 19
    //   152: invokestatic 123	com/google/common/util/concurrent/MoreExecutors:submitAndAddQueueListener	(Lcom/google/common/util/concurrent/ListeningExecutorService;Ljava/util/concurrent/Callable;Ljava/util/concurrent/BlockingQueue;)Lcom/google/common/util/concurrent/ListenableFuture;
    //   155: invokeinterface 129 2 0
    //   160: pop
    //   161: iload 5
    //   163: iconst_1
    //   164: iadd
    //   165: istore 6
    //   167: lload_3
    //   168: lstore 14
    //   170: lload 10
    //   172: lstore 12
    //   174: aload 17
    //   176: astore 16
    //   178: aload 16
    //   180: ifnull +232 -> 412
    //   183: iload 6
    //   185: iconst_1
    //   186: isub
    //   187: istore 5
    //   189: aload 16
    //   191: invokeinterface 139 1 0
    //   196: astore_1
    //   197: aload 18
    //   199: invokeinterface 140 1 0
    //   204: astore_0
    //   205: aload_0
    //   206: invokeinterface 144 1 0
    //   211: ifeq +194 -> 405
    //   214: aload_0
    //   215: invokeinterface 117 1 0
    //   220: checkcast 136	java/util/concurrent/Future
    //   223: iconst_1
    //   224: invokeinterface 148 2 0
    //   229: pop
    //   230: goto -25 -> 205
    //   233: iconst_0
    //   234: istore 9
    //   236: goto -215 -> 21
    //   239: lconst_0
    //   240: lstore 10
    //   242: goto -195 -> 47
    //   245: iload 5
    //   247: ifne +55 -> 302
    //   250: aload_1
    //   251: ifnonnull +156 -> 407
    //   254: new 69	java/util/concurrent/ExecutionException
    //   257: dup
    //   258: aconst_null
    //   259: invokespecial 151	java/util/concurrent/ExecutionException:<init>	(Ljava/lang/Throwable;)V
    //   262: astore_0
    //   263: aload_0
    //   264: athrow
    //   265: astore_0
    //   266: aload 18
    //   268: invokeinterface 140 1 0
    //   273: astore_1
    //   274: aload_1
    //   275: invokeinterface 144 1 0
    //   280: ifeq +123 -> 403
    //   283: aload_1
    //   284: invokeinterface 117 1 0
    //   289: checkcast 136	java/util/concurrent/Future
    //   292: iconst_1
    //   293: invokeinterface 148 2 0
    //   298: pop
    //   299: goto -25 -> 274
    //   302: iload_2
    //   303: ifeq +57 -> 360
    //   306: aload 19
    //   308: lload_3
    //   309: getstatic 157	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   312: invokeinterface 160 4 0
    //   317: checkcast 136	java/util/concurrent/Future
    //   320: astore 16
    //   322: aload 16
    //   324: ifnonnull +11 -> 335
    //   327: new 71	java/util/concurrent/TimeoutException
    //   330: dup
    //   331: invokespecial 161	java/util/concurrent/TimeoutException:<init>	()V
    //   334: athrow
    //   335: invokestatic 107	java/lang/System:nanoTime	()J
    //   338: lstore 12
    //   340: lload_3
    //   341: lload 12
    //   343: lload 10
    //   345: lsub
    //   346: lsub
    //   347: lstore 14
    //   349: iload 5
    //   351: istore 6
    //   353: iload 8
    //   355: istore 7
    //   357: goto -179 -> 178
    //   360: aload 19
    //   362: invokeinterface 164 1 0
    //   367: checkcast 136	java/util/concurrent/Future
    //   370: astore 16
    //   372: iload 5
    //   374: istore 6
    //   376: iload 8
    //   378: istore 7
    //   380: lload 10
    //   382: lstore 12
    //   384: lload_3
    //   385: lstore 14
    //   387: goto -209 -> 178
    //   390: astore_1
    //   391: new 69	java/util/concurrent/ExecutionException
    //   394: dup
    //   395: aload_1
    //   396: invokespecial 151	java/util/concurrent/ExecutionException:<init>	(Ljava/lang/Throwable;)V
    //   399: astore_1
    //   400: goto +24 -> 424
    //   403: aload_0
    //   404: athrow
    //   405: aload_1
    //   406: areturn
    //   407: aload_1
    //   408: astore_0
    //   409: goto -146 -> 263
    //   412: iload 6
    //   414: istore 5
    //   416: goto +8 -> 424
    //   419: astore_0
    //   420: goto -154 -> 266
    //   423: astore_1
    //   424: iload 7
    //   426: istore 8
    //   428: lload 12
    //   430: lstore 10
    //   432: lload 14
    //   434: lstore_3
    //   435: goto -345 -> 90
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	438	0	paramListeningExecutorService	ListeningExecutorService
    //   0	438	1	paramCollection	java.util.Collection<? extends Callable<T>>
    //   0	438	2	paramBoolean	boolean
    //   0	438	3	paramLong	long
    //   11	404	5	i	int
    //   104	309	6	j	int
    //   112	313	7	k	int
    //   83	344	8	m	int
    //   19	216	9	bool	boolean
    //   45	386	10	l1	long
    //   116	313	12	l2	long
    //   119	314	14	l3	long
    //   108	263	16	localFuture1	Future
    //   100	75	17	localFuture2	Future
    //   31	236	18	localArrayList	java.util.ArrayList
    //   36	325	19	localLinkedBlockingQueue	java.util.concurrent.LinkedBlockingQueue
    //   53	88	20	localIterator	java.util.Iterator
    // Exception table:
    //   from	to	target	type
    //   42	47	265	finally
    //   47	79	265	finally
    //   263	265	265	finally
    //   189	197	390	java/lang/RuntimeException
    //   90	102	419	finally
    //   137	161	419	finally
    //   189	197	419	finally
    //   254	263	419	finally
    //   306	322	419	finally
    //   327	335	419	finally
    //   335	340	419	finally
    //   360	372	419	finally
    //   391	400	419	finally
    //   189	197	423	java/util/concurrent/ExecutionException
  }
  
  private static boolean isAppEngine()
  {
    if (System.getProperty("com.google.appengine.runtime.environment") == null) {}
    for (;;)
    {
      return false;
      try
      {
        Object localObject = Class.forName("com.google.apphosting.api.ApiProxy").getMethod("getCurrentEnvironment", new Class[0]).invoke(null, new Object[0]);
        if (localObject != null) {
          return true;
        }
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        return false;
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        return false;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        return false;
      }
      catch (NoSuchMethodException localNoSuchMethodException) {}
    }
    return false;
  }
  
  public static ListeningExecutorService listeningDecorator(ExecutorService paramExecutorService)
  {
    if ((paramExecutorService instanceof ListeningExecutorService)) {
      return (ListeningExecutorService)paramExecutorService;
    }
    if ((paramExecutorService instanceof ScheduledExecutorService)) {
      return new ScheduledListeningDecorator((ScheduledExecutorService)paramExecutorService);
    }
    return new ListeningDecorator(paramExecutorService);
  }
  
  public static ListeningScheduledExecutorService listeningDecorator(ScheduledExecutorService paramScheduledExecutorService)
  {
    if ((paramScheduledExecutorService instanceof ListeningScheduledExecutorService)) {
      return (ListeningScheduledExecutorService)paramScheduledExecutorService;
    }
    return new ScheduledListeningDecorator(paramScheduledExecutorService);
  }
  
  static Thread newThread(String paramString, Runnable paramRunnable)
  {
    Preconditions.checkNotNull(paramString);
    Preconditions.checkNotNull(paramRunnable);
    paramRunnable = platformThreadFactory().newThread(paramRunnable);
    try
    {
      paramRunnable.setName(paramString);
      return paramRunnable;
    }
    catch (SecurityException paramString) {}
    return paramRunnable;
  }
  
  @Beta
  public static ThreadFactory platformThreadFactory()
  {
    if (!isAppEngine()) {
      return Executors.defaultThreadFactory();
    }
    try
    {
      ThreadFactory localThreadFactory = (ThreadFactory)Class.forName("com.google.appengine.api.ThreadManager").getMethod("currentRequestThreadFactory", new Class[0]).invoke(null, new Object[0]);
      return localThreadFactory;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new RuntimeException("Couldn't invoke ThreadManager.currentRequestThreadFactory", localIllegalAccessException);
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new RuntimeException("Couldn't invoke ThreadManager.currentRequestThreadFactory", localClassNotFoundException);
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new RuntimeException("Couldn't invoke ThreadManager.currentRequestThreadFactory", localNoSuchMethodException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw Throwables.propagate(localInvocationTargetException.getCause());
    }
  }
  
  static Executor renamingDecorator(Executor paramExecutor, final Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramExecutor);
    Preconditions.checkNotNull(paramSupplier);
    if (isAppEngine()) {
      return paramExecutor;
    }
    new Executor()
    {
      public void execute(Runnable paramAnonymousRunnable)
      {
        val$executor.execute(Callables.threadRenaming(paramAnonymousRunnable, paramSupplier));
      }
    };
  }
  
  static ExecutorService renamingDecorator(ExecutorService paramExecutorService, final Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramExecutorService);
    Preconditions.checkNotNull(paramSupplier);
    if (isAppEngine()) {
      return paramExecutorService;
    }
    new WrappingExecutorService(paramExecutorService)
    {
      protected Runnable wrapTask(Runnable paramAnonymousRunnable)
      {
        return Callables.threadRenaming(paramAnonymousRunnable, paramSupplier);
      }
      
      protected <T> Callable<T> wrapTask(Callable<T> paramAnonymousCallable)
      {
        return Callables.threadRenaming(paramAnonymousCallable, paramSupplier);
      }
    };
  }
  
  static ScheduledExecutorService renamingDecorator(ScheduledExecutorService paramScheduledExecutorService, final Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramScheduledExecutorService);
    Preconditions.checkNotNull(paramSupplier);
    if (isAppEngine()) {
      return paramScheduledExecutorService;
    }
    new WrappingScheduledExecutorService(paramScheduledExecutorService)
    {
      protected Runnable wrapTask(Runnable paramAnonymousRunnable)
      {
        return Callables.threadRenaming(paramAnonymousRunnable, paramSupplier);
      }
      
      protected <T> Callable<T> wrapTask(Callable<T> paramAnonymousCallable)
      {
        return Callables.threadRenaming(paramAnonymousCallable, paramSupplier);
      }
    };
  }
  
  public static ListeningExecutorService sameThreadExecutor()
  {
    return new SameThreadExecutorService(null);
  }
  
  @Beta
  public static boolean shutdownAndAwaitTermination(ExecutorService paramExecutorService, long paramLong, TimeUnit paramTimeUnit)
  {
    Preconditions.checkNotNull(paramTimeUnit);
    paramExecutorService.shutdown();
    try
    {
      paramLong = TimeUnit.NANOSECONDS.convert(paramLong, paramTimeUnit) / 2L;
      if (!paramExecutorService.awaitTermination(paramLong, TimeUnit.NANOSECONDS))
      {
        paramExecutorService.shutdownNow();
        paramExecutorService.awaitTermination(paramLong, TimeUnit.NANOSECONDS);
      }
      return paramExecutorService.isTerminated();
    }
    catch (InterruptedException paramTimeUnit)
    {
      for (;;)
      {
        Thread.currentThread().interrupt();
        paramExecutorService.shutdownNow();
      }
    }
  }
  
  private static <T> ListenableFuture<T> submitAndAddQueueListener(final ListeningExecutorService paramListeningExecutorService, Callable<T> paramCallable, BlockingQueue<Future<T>> paramBlockingQueue)
  {
    paramListeningExecutorService = paramListeningExecutorService.submit(paramCallable);
    paramListeningExecutorService.addListener(new Runnable()
    {
      public void run()
      {
        val$queue.add(paramListeningExecutorService);
      }
    }, sameThreadExecutor());
    return paramListeningExecutorService;
  }
  
  private static void useDaemonThreadFactory(ThreadPoolExecutor paramThreadPoolExecutor)
  {
    paramThreadPoolExecutor.setThreadFactory(new ThreadFactoryBuilder().setDaemon(true).setThreadFactory(paramThreadPoolExecutor.getThreadFactory()).build());
  }
  
  @VisibleForTesting
  static class Application
  {
    final void addDelayedShutdownHook(final ExecutorService paramExecutorService, final long paramLong, TimeUnit paramTimeUnit)
    {
      Preconditions.checkNotNull(paramExecutorService);
      Preconditions.checkNotNull(paramTimeUnit);
      addShutdownHook(MoreExecutors.newThread("DelayedShutdownHook-for-" + paramExecutorService, new Runnable()
      {
        public void run()
        {
          try
          {
            paramExecutorService.shutdown();
            paramExecutorService.awaitTermination(paramLong, val$timeUnit);
            return;
          }
          catch (InterruptedException localInterruptedException) {}
        }
      }));
    }
    
    @VisibleForTesting
    void addShutdownHook(Thread paramThread)
    {
      Runtime.getRuntime().addShutdownHook(paramThread);
    }
    
    final ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor)
    {
      return getExitingExecutorService(paramThreadPoolExecutor, 120L, TimeUnit.SECONDS);
    }
    
    final ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
    {
      MoreExecutors.useDaemonThreadFactory(paramThreadPoolExecutor);
      paramThreadPoolExecutor = Executors.unconfigurableExecutorService(paramThreadPoolExecutor);
      addDelayedShutdownHook(paramThreadPoolExecutor, paramLong, paramTimeUnit);
      return paramThreadPoolExecutor;
    }
    
    final ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
    {
      return getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor, 120L, TimeUnit.SECONDS);
    }
    
    final ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
    {
      MoreExecutors.useDaemonThreadFactory(paramScheduledThreadPoolExecutor);
      paramScheduledThreadPoolExecutor = Executors.unconfigurableScheduledExecutorService(paramScheduledThreadPoolExecutor);
      addDelayedShutdownHook(paramScheduledThreadPoolExecutor, paramLong, paramTimeUnit);
      return paramScheduledThreadPoolExecutor;
    }
  }
  
  private static class ListeningDecorator
    extends AbstractListeningExecutorService
  {
    private final ExecutorService delegate;
    
    ListeningDecorator(ExecutorService paramExecutorService)
    {
      delegate = ((ExecutorService)Preconditions.checkNotNull(paramExecutorService));
    }
    
    public boolean awaitTermination(long paramLong, TimeUnit paramTimeUnit)
      throws InterruptedException
    {
      return delegate.awaitTermination(paramLong, paramTimeUnit);
    }
    
    public void execute(Runnable paramRunnable)
    {
      delegate.execute(paramRunnable);
    }
    
    public boolean isShutdown()
    {
      return delegate.isShutdown();
    }
    
    public boolean isTerminated()
    {
      return delegate.isTerminated();
    }
    
    public void shutdown()
    {
      delegate.shutdown();
    }
    
    public List<Runnable> shutdownNow()
    {
      return delegate.shutdownNow();
    }
  }
  
  private static class SameThreadExecutorService
    extends AbstractListeningExecutorService
  {
    private final Lock lock = new ReentrantLock();
    private int runningTasks = 0;
    private boolean shutdown = false;
    private final Condition termination = lock.newCondition();
    
    private void endTask()
    {
      lock.lock();
      try
      {
        runningTasks -= 1;
        if (isTerminated()) {
          termination.signalAll();
        }
        return;
      }
      finally
      {
        lock.unlock();
      }
    }
    
    private void startTask()
    {
      lock.lock();
      try
      {
        if (isShutdown()) {
          throw new RejectedExecutionException("Executor already shutdown");
        }
      }
      finally
      {
        lock.unlock();
      }
      runningTasks += 1;
      lock.unlock();
    }
    
    /* Error */
    public boolean awaitTermination(long paramLong, TimeUnit paramTimeUnit)
      throws InterruptedException
    {
      // Byte code:
      //   0: aload_3
      //   1: lload_1
      //   2: invokevirtual 75	java/util/concurrent/TimeUnit:toNanos	(J)J
      //   5: lstore_1
      //   6: aload_0
      //   7: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   10: invokeinterface 42 1 0
      //   15: aload_0
      //   16: invokevirtual 46	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:isTerminated	()Z
      //   19: istore 4
      //   21: iload 4
      //   23: ifeq +14 -> 37
      //   26: aload_0
      //   27: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   30: invokeinterface 54 1 0
      //   35: iconst_1
      //   36: ireturn
      //   37: lload_1
      //   38: lconst_0
      //   39: lcmp
      //   40: ifgt +14 -> 54
      //   43: aload_0
      //   44: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   47: invokeinterface 54 1 0
      //   52: iconst_0
      //   53: ireturn
      //   54: aload_0
      //   55: getfield 32	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:termination	Ljava/util/concurrent/locks/Condition;
      //   58: lload_1
      //   59: invokeinterface 78 3 0
      //   64: lstore_1
      //   65: goto -50 -> 15
      //   68: astore_3
      //   69: aload_0
      //   70: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   73: invokeinterface 54 1 0
      //   78: aload_3
      //   79: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	80	0	this	SameThreadExecutorService
      //   0	80	1	paramLong	long
      //   0	80	3	paramTimeUnit	TimeUnit
      //   19	3	4	bool	boolean
      // Exception table:
      //   from	to	target	type
      //   15	21	68	finally
      //   54	65	68	finally
    }
    
    public void execute(Runnable paramRunnable)
    {
      startTask();
      try
      {
        paramRunnable.run();
        return;
      }
      finally
      {
        endTask();
      }
    }
    
    public boolean isShutdown()
    {
      lock.lock();
      try
      {
        boolean bool = shutdown;
        return bool;
      }
      finally
      {
        lock.unlock();
      }
    }
    
    /* Error */
    public boolean isTerminated()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   4: invokeinterface 42 1 0
      //   9: aload_0
      //   10: getfield 36	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:shutdown	Z
      //   13: ifeq +25 -> 38
      //   16: aload_0
      //   17: getfield 34	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:runningTasks	I
      //   20: istore_1
      //   21: iload_1
      //   22: ifne +16 -> 38
      //   25: iconst_1
      //   26: istore_2
      //   27: aload_0
      //   28: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   31: invokeinterface 54 1 0
      //   36: iload_2
      //   37: ireturn
      //   38: iconst_0
      //   39: istore_2
      //   40: goto -13 -> 27
      //   43: astore_3
      //   44: aload_0
      //   45: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
      //   48: invokeinterface 54 1 0
      //   53: aload_3
      //   54: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	55	0	this	SameThreadExecutorService
      //   20	2	1	i	int
      //   26	14	2	bool	boolean
      //   43	11	3	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   9	21	43	finally
    }
    
    public void shutdown()
    {
      lock.lock();
      try
      {
        shutdown = true;
        return;
      }
      finally
      {
        lock.unlock();
      }
    }
    
    public List<Runnable> shutdownNow()
    {
      shutdown();
      return Collections.emptyList();
    }
  }
  
  private static class ScheduledListeningDecorator
    extends MoreExecutors.ListeningDecorator
    implements ListeningScheduledExecutorService
  {
    final ScheduledExecutorService delegate;
    
    ScheduledListeningDecorator(ScheduledExecutorService paramScheduledExecutorService)
    {
      super();
      delegate = ((ScheduledExecutorService)Preconditions.checkNotNull(paramScheduledExecutorService));
    }
    
    public ListenableScheduledFuture<?> schedule(Runnable paramRunnable, long paramLong, TimeUnit paramTimeUnit)
    {
      paramRunnable = ListenableFutureTask.create(paramRunnable, null);
      return new ListenableScheduledTask(paramRunnable, delegate.schedule(paramRunnable, paramLong, paramTimeUnit));
    }
    
    public <V> ListenableScheduledFuture<V> schedule(Callable<V> paramCallable, long paramLong, TimeUnit paramTimeUnit)
    {
      paramCallable = ListenableFutureTask.create(paramCallable);
      return new ListenableScheduledTask(paramCallable, delegate.schedule(paramCallable, paramLong, paramTimeUnit));
    }
    
    public ListenableScheduledFuture<?> scheduleAtFixedRate(Runnable paramRunnable, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      paramRunnable = new NeverSuccessfulListenableFutureTask(paramRunnable);
      return new ListenableScheduledTask(paramRunnable, delegate.scheduleAtFixedRate(paramRunnable, paramLong1, paramLong2, paramTimeUnit));
    }
    
    public ListenableScheduledFuture<?> scheduleWithFixedDelay(Runnable paramRunnable, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      paramRunnable = new NeverSuccessfulListenableFutureTask(paramRunnable);
      return new ListenableScheduledTask(paramRunnable, delegate.scheduleWithFixedDelay(paramRunnable, paramLong1, paramLong2, paramTimeUnit));
    }
    
    private static final class ListenableScheduledTask<V>
      extends ForwardingListenableFuture.SimpleForwardingListenableFuture<V>
      implements ListenableScheduledFuture<V>
    {
      private final ScheduledFuture<?> scheduledDelegate;
      
      public ListenableScheduledTask(ListenableFuture<V> paramListenableFuture, ScheduledFuture<?> paramScheduledFuture)
      {
        super();
        scheduledDelegate = paramScheduledFuture;
      }
      
      public boolean cancel(boolean paramBoolean)
      {
        boolean bool = super.cancel(paramBoolean);
        if (bool) {
          scheduledDelegate.cancel(paramBoolean);
        }
        return bool;
      }
      
      public int compareTo(Delayed paramDelayed)
      {
        return scheduledDelegate.compareTo(paramDelayed);
      }
      
      public long getDelay(TimeUnit paramTimeUnit)
      {
        return scheduledDelegate.getDelay(paramTimeUnit);
      }
    }
    
    private static final class NeverSuccessfulListenableFutureTask
      extends AbstractFuture<Void>
      implements Runnable
    {
      private final Runnable delegate;
      
      public NeverSuccessfulListenableFutureTask(Runnable paramRunnable)
      {
        delegate = ((Runnable)Preconditions.checkNotNull(paramRunnable));
      }
      
      public void run()
      {
        try
        {
          delegate.run();
          return;
        }
        catch (Throwable localThrowable)
        {
          setException(localThrowable);
          throw Throwables.propagate(localThrowable);
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */