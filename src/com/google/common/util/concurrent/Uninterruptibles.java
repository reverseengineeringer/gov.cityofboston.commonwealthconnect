package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@Beta
public final class Uninterruptibles
{
  public static void awaitUninterruptibly(CountDownLatch paramCountDownLatch)
  {
    int i = 0;
    try
    {
      paramCountDownLatch.await();
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException = localInterruptedException;
        i = 1;
      }
    }
    finally
    {
      paramCountDownLatch = finally;
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      throw paramCountDownLatch;
    }
  }
  
  /* Error */
  public static boolean awaitUninterruptibly(CountDownLatch paramCountDownLatch, long paramLong, java.util.concurrent.TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 6
    //   3: iconst_0
    //   4: istore 5
    //   6: iload 6
    //   8: istore 4
    //   10: aload_3
    //   11: lload_1
    //   12: invokevirtual 35	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   15: lstore 7
    //   17: iload 6
    //   19: istore 4
    //   21: invokestatic 41	java/lang/System:nanoTime	()J
    //   24: lstore 9
    //   26: lload 7
    //   28: lstore_1
    //   29: iload 5
    //   31: istore 4
    //   33: aload_0
    //   34: lload_1
    //   35: getstatic 45	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   38: invokevirtual 48	java/util/concurrent/CountDownLatch:await	(JLjava/util/concurrent/TimeUnit;)Z
    //   41: istore 11
    //   43: iload 5
    //   45: ifeq +9 -> 54
    //   48: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   51: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   54: iload 11
    //   56: ireturn
    //   57: astore_3
    //   58: iconst_1
    //   59: istore 4
    //   61: iconst_1
    //   62: istore 5
    //   64: invokestatic 41	java/lang/System:nanoTime	()J
    //   67: lstore_1
    //   68: lload 9
    //   70: lload 7
    //   72: ladd
    //   73: lload_1
    //   74: lsub
    //   75: lstore_1
    //   76: goto -47 -> 29
    //   79: astore_0
    //   80: iload 4
    //   82: ifeq +9 -> 91
    //   85: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   88: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   91: aload_0
    //   92: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	93	0	paramCountDownLatch	CountDownLatch
    //   0	93	1	paramLong	long
    //   0	93	3	paramTimeUnit	java.util.concurrent.TimeUnit
    //   8	73	4	i	int
    //   4	59	5	j	int
    //   1	17	6	k	int
    //   15	56	7	l1	long
    //   24	45	9	l2	long
    //   41	14	11	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   33	43	57	java/lang/InterruptedException
    //   10	17	79	finally
    //   21	26	79	finally
    //   33	43	79	finally
    //   64	68	79	finally
  }
  
  public static <V> V getUninterruptibly(Future<V> paramFuture)
    throws ExecutionException
  {
    int i = 0;
    try
    {
      Object localObject = paramFuture.get();
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      return (V)localObject;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException = localInterruptedException;
        i = 1;
      }
    }
    finally
    {
      paramFuture = finally;
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      throw paramFuture;
    }
  }
  
  /* Error */
  public static <V> V getUninterruptibly(Future<V> paramFuture, long paramLong, java.util.concurrent.TimeUnit paramTimeUnit)
    throws ExecutionException, java.util.concurrent.TimeoutException
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 6
    //   3: iconst_0
    //   4: istore 5
    //   6: iload 6
    //   8: istore 4
    //   10: aload_3
    //   11: lload_1
    //   12: invokevirtual 35	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   15: lstore 7
    //   17: iload 6
    //   19: istore 4
    //   21: invokestatic 41	java/lang/System:nanoTime	()J
    //   24: lstore 9
    //   26: lload 7
    //   28: lstore_1
    //   29: iload 5
    //   31: istore 4
    //   33: aload_0
    //   34: lload_1
    //   35: getstatic 45	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   38: invokeinterface 67 4 0
    //   43: astore_3
    //   44: iload 5
    //   46: ifeq +9 -> 55
    //   49: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   52: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   55: aload_3
    //   56: areturn
    //   57: astore_3
    //   58: iconst_1
    //   59: istore 4
    //   61: iconst_1
    //   62: istore 5
    //   64: invokestatic 41	java/lang/System:nanoTime	()J
    //   67: lstore_1
    //   68: lload 9
    //   70: lload 7
    //   72: ladd
    //   73: lload_1
    //   74: lsub
    //   75: lstore_1
    //   76: goto -47 -> 29
    //   79: astore_0
    //   80: iload 4
    //   82: ifeq +9 -> 91
    //   85: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   88: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   91: aload_0
    //   92: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	93	0	paramFuture	Future<V>
    //   0	93	1	paramLong	long
    //   0	93	3	paramTimeUnit	java.util.concurrent.TimeUnit
    //   8	73	4	i	int
    //   4	59	5	j	int
    //   1	17	6	k	int
    //   15	56	7	l1	long
    //   24	45	9	l2	long
    // Exception table:
    //   from	to	target	type
    //   33	44	57	java/lang/InterruptedException
    //   10	17	79	finally
    //   21	26	79	finally
    //   33	44	79	finally
    //   64	68	79	finally
  }
  
  public static void joinUninterruptibly(Thread paramThread)
  {
    int i = 0;
    try
    {
      paramThread.join();
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException = localInterruptedException;
        i = 1;
      }
    }
    finally
    {
      paramThread = finally;
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      throw paramThread;
    }
  }
  
  /* Error */
  public static void joinUninterruptibly(Thread paramThread, long paramLong, java.util.concurrent.TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 80	com/google/common/base/Preconditions:checkNotNull	(Ljava/lang/Object;)Ljava/lang/Object;
    //   4: pop
    //   5: iconst_0
    //   6: istore 6
    //   8: iconst_0
    //   9: istore 5
    //   11: iload 6
    //   13: istore 4
    //   15: aload_3
    //   16: lload_1
    //   17: invokevirtual 35	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   20: lstore 7
    //   22: iload 6
    //   24: istore 4
    //   26: invokestatic 41	java/lang/System:nanoTime	()J
    //   29: lstore 9
    //   31: lload 7
    //   33: lstore_1
    //   34: iload 5
    //   36: istore 4
    //   38: getstatic 45	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   41: aload_0
    //   42: lload_1
    //   43: invokevirtual 84	java/util/concurrent/TimeUnit:timedJoin	(Ljava/lang/Thread;J)V
    //   46: iload 5
    //   48: ifeq +9 -> 57
    //   51: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   54: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   57: return
    //   58: astore_3
    //   59: iconst_1
    //   60: istore 4
    //   62: iconst_1
    //   63: istore 5
    //   65: invokestatic 41	java/lang/System:nanoTime	()J
    //   68: lstore_1
    //   69: lload 9
    //   71: lload 7
    //   73: ladd
    //   74: lload_1
    //   75: lsub
    //   76: lstore_1
    //   77: goto -43 -> 34
    //   80: astore_0
    //   81: iload 4
    //   83: ifeq +9 -> 92
    //   86: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   89: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   92: aload_0
    //   93: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	94	0	paramThread	Thread
    //   0	94	1	paramLong	long
    //   0	94	3	paramTimeUnit	java.util.concurrent.TimeUnit
    //   13	69	4	i	int
    //   9	55	5	j	int
    //   6	17	6	k	int
    //   20	52	7	l1	long
    //   29	41	9	l2	long
    // Exception table:
    //   from	to	target	type
    //   38	46	58	java/lang/InterruptedException
    //   15	22	80	finally
    //   26	31	80	finally
    //   38	46	80	finally
    //   65	69	80	finally
  }
  
  public static <E> void putUninterruptibly(BlockingQueue<E> paramBlockingQueue, E paramE)
  {
    int i = 0;
    try
    {
      paramBlockingQueue.put(paramE);
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException = localInterruptedException;
        i = 1;
      }
    }
    finally
    {
      paramBlockingQueue = finally;
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      throw paramBlockingQueue;
    }
  }
  
  /* Error */
  public static void sleepUninterruptibly(long paramLong, java.util.concurrent.TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 5
    //   3: iconst_0
    //   4: istore 4
    //   6: iload 5
    //   8: istore_3
    //   9: aload_2
    //   10: lload_0
    //   11: invokevirtual 35	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   14: lstore 6
    //   16: iload 5
    //   18: istore_3
    //   19: invokestatic 41	java/lang/System:nanoTime	()J
    //   22: lstore 8
    //   24: lload 6
    //   26: lstore_0
    //   27: iload 4
    //   29: istore_3
    //   30: getstatic 45	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   33: lload_0
    //   34: invokevirtual 99	java/util/concurrent/TimeUnit:sleep	(J)V
    //   37: iload 4
    //   39: ifeq +9 -> 48
    //   42: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   45: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   48: return
    //   49: astore_2
    //   50: iconst_1
    //   51: istore_3
    //   52: iconst_1
    //   53: istore 4
    //   55: invokestatic 41	java/lang/System:nanoTime	()J
    //   58: lstore_0
    //   59: lload 8
    //   61: lload 6
    //   63: ladd
    //   64: lload_0
    //   65: lsub
    //   66: lstore_0
    //   67: goto -40 -> 27
    //   70: astore_2
    //   71: iload_3
    //   72: ifeq +9 -> 81
    //   75: invokestatic 25	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   78: invokevirtual 28	java/lang/Thread:interrupt	()V
    //   81: aload_2
    //   82: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	83	0	paramLong	long
    //   0	83	2	paramTimeUnit	java.util.concurrent.TimeUnit
    //   8	64	3	i	int
    //   4	50	4	j	int
    //   1	16	5	k	int
    //   14	48	6	l1	long
    //   22	38	8	l2	long
    // Exception table:
    //   from	to	target	type
    //   30	37	49	java/lang/InterruptedException
    //   9	16	70	finally
    //   19	24	70	finally
    //   30	37	70	finally
    //   55	59	70	finally
  }
  
  public static <E> E takeUninterruptibly(BlockingQueue<E> paramBlockingQueue)
  {
    int i = 0;
    try
    {
      Object localObject = paramBlockingQueue.take();
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      return (E)localObject;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException = localInterruptedException;
        i = 1;
      }
    }
    finally
    {
      paramBlockingQueue = finally;
      if (i != 0) {
        Thread.currentThread().interrupt();
      }
      throw paramBlockingQueue;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Uninterruptibles
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */