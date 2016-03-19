package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.concurrent.GuardedBy;

@Beta
public final class Monitor
{
  @GuardedBy("lock")
  private Guard activeGuards = null;
  private final boolean fair;
  private final ReentrantLock lock;
  
  public Monitor()
  {
    this(false);
  }
  
  public Monitor(boolean paramBoolean)
  {
    fair = paramBoolean;
    lock = new ReentrantLock(paramBoolean);
  }
  
  @GuardedBy("lock")
  private void await(Guard paramGuard, boolean paramBoolean)
    throws InterruptedException
  {
    if (paramBoolean) {
      signalNextWaiter();
    }
    beginWaitingFor(paramGuard);
    try
    {
      do
      {
        condition.await();
        paramBoolean = paramGuard.isSatisfied();
      } while (!paramBoolean);
      return;
    }
    finally
    {
      endWaitingFor(paramGuard);
    }
  }
  
  @GuardedBy("lock")
  private boolean awaitNanos(Guard paramGuard, long paramLong, boolean paramBoolean)
    throws InterruptedException
  {
    if (paramBoolean) {
      signalNextWaiter();
    }
    beginWaitingFor(paramGuard);
    for (;;)
    {
      if (paramLong < 0L)
      {
        endWaitingFor(paramGuard);
        return false;
      }
      try
      {
        paramLong = condition.awaitNanos(paramLong);
        paramBoolean = paramGuard.isSatisfied();
        if (!paramBoolean) {
          continue;
        }
        return true;
      }
      finally
      {
        endWaitingFor(paramGuard);
      }
    }
  }
  
  @GuardedBy("lock")
  private void awaitUninterruptibly(Guard paramGuard, boolean paramBoolean)
  {
    if (paramBoolean) {
      signalNextWaiter();
    }
    beginWaitingFor(paramGuard);
    try
    {
      do
      {
        condition.awaitUninterruptibly();
        paramBoolean = paramGuard.isSatisfied();
      } while (!paramBoolean);
      return;
    }
    finally
    {
      endWaitingFor(paramGuard);
    }
  }
  
  @GuardedBy("lock")
  private void beginWaitingFor(Guard paramGuard)
  {
    int i = waiterCount;
    waiterCount = (i + 1);
    if (i == 0)
    {
      next = activeGuards;
      activeGuards = paramGuard;
    }
  }
  
  @GuardedBy("lock")
  private void endWaitingFor(Guard paramGuard)
  {
    int i = waiterCount - 1;
    waiterCount = i;
    Guard localGuard1;
    Guard localGuard2;
    if (i == 0)
    {
      localGuard1 = activeGuards;
      localGuard2 = null;
    }
    for (;;)
    {
      if (localGuard1 == paramGuard)
      {
        if (localGuard2 == null) {
          activeGuards = next;
        }
        for (;;)
        {
          next = null;
          return;
          next = next;
        }
      }
      localGuard2 = localGuard1;
      localGuard1 = next;
    }
  }
  
  @GuardedBy("lock")
  private boolean isSatisfied(Guard paramGuard)
  {
    try
    {
      boolean bool = paramGuard.isSatisfied();
      return bool;
    }
    catch (Throwable paramGuard)
    {
      signalAllWaiters();
      throw Throwables.propagate(paramGuard);
    }
  }
  
  @GuardedBy("lock")
  private void signalAllWaiters()
  {
    for (Guard localGuard = activeGuards; localGuard != null; localGuard = next) {
      condition.signalAll();
    }
  }
  
  @GuardedBy("lock")
  private void signalNextWaiter()
  {
    for (Guard localGuard = activeGuards;; localGuard = next) {
      if (localGuard != null)
      {
        if (isSatisfied(localGuard)) {
          condition.signal();
        }
      }
      else {
        return;
      }
    }
  }
  
  public void enter()
  {
    lock.lock();
  }
  
  public boolean enter(long paramLong, TimeUnit paramTimeUnit)
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    paramTimeUnit = lock;
    boolean bool2;
    if ((!fair) && (paramTimeUnit.tryLock())) {
      bool2 = true;
    }
    for (;;)
    {
      return bool2;
      long l2 = System.nanoTime();
      boolean bool1 = Thread.interrupted();
      paramLong = l1;
      label45:
      bool2 = bool1;
      try
      {
        boolean bool3 = paramTimeUnit.tryLock(paramLong, TimeUnit.NANOSECONDS);
        bool2 = bool3;
        return bool3;
      }
      catch (InterruptedException localInterruptedException)
      {
        bool2 = true;
        bool1 = true;
        paramLong = System.nanoTime();
        paramLong = l2 + l1 - paramLong;
        break label45;
      }
      finally
      {
        if (bool2) {
          Thread.currentThread().interrupt();
        }
      }
    }
  }
  
  public boolean enterIf(Guard paramGuard)
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    ReentrantLock localReentrantLock = lock;
    localReentrantLock.lock();
    try
    {
      boolean bool = paramGuard.isSatisfied();
      if (!bool) {
        localReentrantLock.unlock();
      }
      return bool;
    }
    finally
    {
      if (0 == 0) {
        localReentrantLock.unlock();
      }
    }
  }
  
  public boolean enterIf(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    boolean bool1;
    if (!enter(paramLong, paramTimeUnit)) {
      bool1 = false;
    }
    for (;;)
    {
      return bool1;
      try
      {
        boolean bool2 = paramGuard.isSatisfied();
        bool1 = bool2;
        if (bool2) {
          continue;
        }
        lock.unlock();
        return bool2;
      }
      finally
      {
        if (0 == 0) {
          lock.unlock();
        }
      }
    }
  }
  
  public boolean enterIfInterruptibly(Guard paramGuard)
    throws InterruptedException
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    ReentrantLock localReentrantLock = lock;
    localReentrantLock.lockInterruptibly();
    try
    {
      boolean bool = paramGuard.isSatisfied();
      if (!bool) {
        localReentrantLock.unlock();
      }
      return bool;
    }
    finally
    {
      if (0 == 0) {
        localReentrantLock.unlock();
      }
    }
  }
  
  public boolean enterIfInterruptibly(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    ReentrantLock localReentrantLock = lock;
    boolean bool1;
    if (!localReentrantLock.tryLock(paramLong, paramTimeUnit)) {
      bool1 = false;
    }
    for (;;)
    {
      return bool1;
      try
      {
        boolean bool2 = paramGuard.isSatisfied();
        bool1 = bool2;
        if (bool2) {
          continue;
        }
        localReentrantLock.unlock();
        return bool2;
      }
      finally
      {
        if (0 == 0) {
          localReentrantLock.unlock();
        }
      }
    }
  }
  
  public void enterInterruptibly()
    throws InterruptedException
  {
    lock.lockInterruptibly();
  }
  
  public boolean enterInterruptibly(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return lock.tryLock(paramLong, paramTimeUnit);
  }
  
  public void enterWhen(Guard paramGuard)
    throws InterruptedException
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    ReentrantLock localReentrantLock = lock;
    boolean bool = localReentrantLock.isHeldByCurrentThread();
    localReentrantLock.lockInterruptibly();
    try
    {
      if (!paramGuard.isSatisfied()) {
        await(paramGuard, bool);
      }
      if (1 == 0) {
        leave();
      }
      return;
    }
    finally
    {
      if (0 == 0) {
        leave();
      }
    }
  }
  
  /* Error */
  public boolean enterWhen(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    // Byte code:
    //   0: aload 4
    //   2: lload_2
    //   3: invokevirtual 107	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   6: lstore 7
    //   8: aload_1
    //   9: getfield 139	com/google/common/util/concurrent/Monitor$Guard:monitor	Lcom/google/common/util/concurrent/Monitor;
    //   12: aload_0
    //   13: if_acmpeq +11 -> 24
    //   16: new 141	java/lang/IllegalMonitorStateException
    //   19: dup
    //   20: invokespecial 142	java/lang/IllegalMonitorStateException:<init>	()V
    //   23: athrow
    //   24: aload_0
    //   25: getfield 33	com/google/common/util/concurrent/Monitor:lock	Ljava/util/concurrent/locks/ReentrantLock;
    //   28: astore 12
    //   30: aload 12
    //   32: invokevirtual 157	java/util/concurrent/locks/ReentrantLock:isHeldByCurrentThread	()Z
    //   35: istore 11
    //   37: aload_0
    //   38: getfield 28	com/google/common/util/concurrent/Monitor:fair	Z
    //   41: ifne +15 -> 56
    //   44: lload 7
    //   46: lstore 5
    //   48: aload 12
    //   50: invokevirtual 110	java/util/concurrent/locks/ReentrantLock:tryLock	()Z
    //   53: ifne +36 -> 89
    //   56: invokestatic 116	java/lang/System:nanoTime	()J
    //   59: lstore 5
    //   61: aload 12
    //   63: lload_2
    //   64: aload 4
    //   66: invokevirtual 127	java/util/concurrent/locks/ReentrantLock:tryLock	(JLjava/util/concurrent/TimeUnit;)Z
    //   69: ifne +9 -> 78
    //   72: iconst_0
    //   73: istore 10
    //   75: iload 10
    //   77: ireturn
    //   78: lload 5
    //   80: lload 7
    //   82: ladd
    //   83: invokestatic 116	java/lang/System:nanoTime	()J
    //   86: lsub
    //   87: lstore 5
    //   89: aload_1
    //   90: invokevirtual 58	com/google/common/util/concurrent/Monitor$Guard:isSatisfied	()Z
    //   93: ifne +19 -> 112
    //   96: aload_0
    //   97: aload_1
    //   98: lload 5
    //   100: iload 11
    //   102: invokespecial 164	com/google/common/util/concurrent/Monitor:awaitNanos	(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z
    //   105: istore 9
    //   107: iload 9
    //   109: ifeq +36 -> 145
    //   112: iconst_1
    //   113: istore 9
    //   115: iload 9
    //   117: istore 10
    //   119: iload 9
    //   121: ifne -46 -> 75
    //   124: iconst_0
    //   125: ifeq +12 -> 137
    //   128: iload 11
    //   130: ifne +7 -> 137
    //   133: aload_0
    //   134: invokespecial 42	com/google/common/util/concurrent/Monitor:signalNextWaiter	()V
    //   137: aload 12
    //   139: invokevirtual 145	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   142: iload 9
    //   144: ireturn
    //   145: iconst_0
    //   146: istore 9
    //   148: goto -33 -> 115
    //   151: astore_1
    //   152: aload 12
    //   154: invokevirtual 145	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   157: aload_1
    //   158: athrow
    //   159: astore_1
    //   160: iconst_0
    //   161: ifne +21 -> 182
    //   164: iconst_1
    //   165: ifeq +12 -> 177
    //   168: iload 11
    //   170: ifne +7 -> 177
    //   173: aload_0
    //   174: invokespecial 42	com/google/common/util/concurrent/Monitor:signalNextWaiter	()V
    //   177: aload 12
    //   179: invokevirtual 145	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   182: aload_1
    //   183: athrow
    //   184: astore_1
    //   185: aload 12
    //   187: invokevirtual 145	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   190: aload_1
    //   191: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	192	0	this	Monitor
    //   0	192	1	paramGuard	Guard
    //   0	192	2	paramLong	long
    //   0	192	4	paramTimeUnit	TimeUnit
    //   46	53	5	l1	long
    //   6	75	7	l2	long
    //   105	42	9	bool1	boolean
    //   73	45	10	bool2	boolean
    //   35	134	11	bool3	boolean
    //   28	158	12	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   133	137	151	finally
    //   89	107	159	finally
    //   173	177	184	finally
  }
  
  public void enterWhenUninterruptibly(Guard paramGuard)
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    ReentrantLock localReentrantLock = lock;
    boolean bool = localReentrantLock.isHeldByCurrentThread();
    localReentrantLock.lock();
    try
    {
      if (!paramGuard.isSatisfied()) {
        awaitUninterruptibly(paramGuard, bool);
      }
      if (1 == 0) {
        leave();
      }
      return;
    }
    finally
    {
      if (0 == 0) {
        leave();
      }
    }
  }
  
  /* Error */
  public boolean enterWhenUninterruptibly(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload 4
    //   2: lload_2
    //   3: invokevirtual 107	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   6: lstore 5
    //   8: aload_1
    //   9: getfield 139	com/google/common/util/concurrent/Monitor$Guard:monitor	Lcom/google/common/util/concurrent/Monitor;
    //   12: aload_0
    //   13: if_acmpeq +11 -> 24
    //   16: new 141	java/lang/IllegalMonitorStateException
    //   19: dup
    //   20: invokespecial 142	java/lang/IllegalMonitorStateException:<init>	()V
    //   23: athrow
    //   24: aload_0
    //   25: getfield 33	com/google/common/util/concurrent/Monitor:lock	Ljava/util/concurrent/locks/ReentrantLock;
    //   28: astore 4
    //   30: invokestatic 116	java/lang/System:nanoTime	()J
    //   33: lload 5
    //   35: ladd
    //   36: lstore 7
    //   38: aload 4
    //   40: invokevirtual 157	java/util/concurrent/locks/ReentrantLock:isHeldByCurrentThread	()Z
    //   43: istore 14
    //   45: invokestatic 121	java/lang/Thread:interrupted	()Z
    //   48: istore 11
    //   50: iload 11
    //   52: istore 9
    //   54: aload_0
    //   55: getfield 28	com/google/common/util/concurrent/Monitor:fair	Z
    //   58: ifne +26 -> 84
    //   61: iload 11
    //   63: istore 9
    //   65: aload 4
    //   67: invokevirtual 110	java/util/concurrent/locks/ReentrantLock:tryLock	()Z
    //   70: istore 12
    //   72: iload 11
    //   74: istore 10
    //   76: lload 5
    //   78: lstore_2
    //   79: iload 12
    //   81: ifne +102 -> 183
    //   84: iconst_0
    //   85: istore 12
    //   87: iload 11
    //   89: istore 9
    //   91: aload 4
    //   93: lload 5
    //   95: getstatic 125	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   98: invokevirtual 127	java/util/concurrent/locks/ReentrantLock:tryLock	(JLjava/util/concurrent/TimeUnit;)Z
    //   101: istore 10
    //   103: iload 10
    //   105: istore 9
    //   107: iload 11
    //   109: istore 10
    //   111: iload 9
    //   113: istore 13
    //   115: iload 9
    //   117: ifne +37 -> 154
    //   120: iconst_0
    //   121: istore 10
    //   123: iload 10
    //   125: istore 9
    //   127: iload 11
    //   129: ifeq +13 -> 142
    //   132: invokestatic 131	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   135: invokevirtual 134	java/lang/Thread:interrupt	()V
    //   138: iload 10
    //   140: istore 9
    //   142: iload 9
    //   144: ireturn
    //   145: astore 15
    //   147: iconst_1
    //   148: istore 10
    //   150: iload 12
    //   152: istore 13
    //   154: iload 10
    //   156: istore 9
    //   158: invokestatic 116	java/lang/System:nanoTime	()J
    //   161: lstore_2
    //   162: lload 7
    //   164: lload_2
    //   165: lsub
    //   166: lstore_2
    //   167: iload 10
    //   169: istore 11
    //   171: iload 13
    //   173: istore 12
    //   175: lload_2
    //   176: lstore 5
    //   178: iload 13
    //   180: ifeq -93 -> 87
    //   183: iload 14
    //   185: istore 9
    //   187: iload 10
    //   189: istore 11
    //   191: aload_1
    //   192: invokevirtual 58	com/google/common/util/concurrent/Monitor$Guard:isSatisfied	()Z
    //   195: ifne +22 -> 217
    //   198: iload 10
    //   200: istore 11
    //   202: aload_0
    //   203: aload_1
    //   204: lload_2
    //   205: iload 9
    //   207: invokespecial 164	com/google/common/util/concurrent/Monitor:awaitNanos	(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z
    //   210: istore 9
    //   212: iload 9
    //   214: ifeq +38 -> 252
    //   217: iconst_1
    //   218: istore 11
    //   220: iload 11
    //   222: ifne +12 -> 234
    //   225: iload 10
    //   227: istore 9
    //   229: aload 4
    //   231: invokevirtual 145	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   234: iload 11
    //   236: istore 9
    //   238: iload 10
    //   240: ifeq -98 -> 142
    //   243: invokestatic 131	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   246: invokevirtual 134	java/lang/Thread:interrupt	()V
    //   249: iload 11
    //   251: ireturn
    //   252: iconst_0
    //   253: istore 11
    //   255: goto -35 -> 220
    //   258: astore 15
    //   260: iconst_1
    //   261: istore 11
    //   263: iconst_1
    //   264: istore 10
    //   266: iconst_0
    //   267: istore 9
    //   269: invokestatic 116	java/lang/System:nanoTime	()J
    //   272: lstore_2
    //   273: lload 7
    //   275: lload_2
    //   276: lsub
    //   277: lstore_2
    //   278: goto -91 -> 187
    //   281: astore_1
    //   282: iconst_0
    //   283: ifne +12 -> 295
    //   286: iload 11
    //   288: istore 9
    //   290: aload 4
    //   292: invokevirtual 145	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   295: iload 11
    //   297: istore 9
    //   299: aload_1
    //   300: athrow
    //   301: astore_1
    //   302: iload 9
    //   304: ifeq +9 -> 313
    //   307: invokestatic 131	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   310: invokevirtual 134	java/lang/Thread:interrupt	()V
    //   313: aload_1
    //   314: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	315	0	this	Monitor
    //   0	315	1	paramGuard	Guard
    //   0	315	2	paramLong	long
    //   0	315	4	paramTimeUnit	TimeUnit
    //   6	171	5	l1	long
    //   36	238	7	l2	long
    //   52	251	9	bool1	boolean
    //   74	191	10	bool2	boolean
    //   48	248	11	bool3	boolean
    //   70	104	12	bool4	boolean
    //   113	66	13	bool5	boolean
    //   43	141	14	bool6	boolean
    //   145	1	15	localInterruptedException1	InterruptedException
    //   258	1	15	localInterruptedException2	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   91	103	145	java/lang/InterruptedException
    //   191	198	258	java/lang/InterruptedException
    //   202	212	258	java/lang/InterruptedException
    //   191	198	281	finally
    //   202	212	281	finally
    //   269	273	281	finally
    //   54	61	301	finally
    //   65	72	301	finally
    //   91	103	301	finally
    //   158	162	301	finally
    //   229	234	301	finally
    //   290	295	301	finally
    //   299	301	301	finally
  }
  
  public int getOccupiedDepth()
  {
    return lock.getHoldCount();
  }
  
  public int getQueueLength()
  {
    return lock.getQueueLength();
  }
  
  public int getWaitQueueLength(Guard paramGuard)
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    lock.lock();
    try
    {
      int i = waiterCount;
      return i;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public boolean hasQueuedThread(Thread paramThread)
  {
    return lock.hasQueuedThread(paramThread);
  }
  
  public boolean hasQueuedThreads()
  {
    return lock.hasQueuedThreads();
  }
  
  public boolean hasWaiters(Guard paramGuard)
  {
    return getWaitQueueLength(paramGuard) > 0;
  }
  
  public boolean isFair()
  {
    return fair;
  }
  
  public boolean isOccupied()
  {
    return lock.isLocked();
  }
  
  public boolean isOccupiedByCurrentThread()
  {
    return lock.isHeldByCurrentThread();
  }
  
  public void leave()
  {
    ReentrantLock localReentrantLock = lock;
    try
    {
      if (localReentrantLock.getHoldCount() == 1) {
        signalNextWaiter();
      }
      return;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  public boolean tryEnter()
  {
    return lock.tryLock();
  }
  
  public boolean tryEnterIf(Guard paramGuard)
  {
    if (monitor != this) {
      throw new IllegalMonitorStateException();
    }
    ReentrantLock localReentrantLock = lock;
    boolean bool1;
    if (!localReentrantLock.tryLock()) {
      bool1 = false;
    }
    for (;;)
    {
      return bool1;
      try
      {
        boolean bool2 = paramGuard.isSatisfied();
        bool1 = bool2;
        if (bool2) {
          continue;
        }
        localReentrantLock.unlock();
        return bool2;
      }
      finally
      {
        if (0 == 0) {
          localReentrantLock.unlock();
        }
      }
    }
  }
  
  public void waitFor(Guard paramGuard)
    throws InterruptedException
  {
    if (monitor == this) {}
    for (int i = 1; (i & lock.isHeldByCurrentThread()) == 0; i = 0) {
      throw new IllegalMonitorStateException();
    }
    if (!paramGuard.isSatisfied()) {
      await(paramGuard, true);
    }
  }
  
  public boolean waitFor(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    boolean bool = false;
    paramLong = paramTimeUnit.toNanos(paramLong);
    if (monitor == this) {}
    for (int i = 1; (i & lock.isHeldByCurrentThread()) == 0; i = 0) {
      throw new IllegalMonitorStateException();
    }
    if ((paramGuard.isSatisfied()) || (awaitNanos(paramGuard, paramLong, true))) {
      bool = true;
    }
    return bool;
  }
  
  public void waitForUninterruptibly(Guard paramGuard)
  {
    if (monitor == this) {}
    for (int i = 1; (i & lock.isHeldByCurrentThread()) == 0; i = 0) {
      throw new IllegalMonitorStateException();
    }
    if (!paramGuard.isSatisfied()) {
      awaitUninterruptibly(paramGuard, true);
    }
  }
  
  public boolean waitForUninterruptibly(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    if (monitor == this) {}
    for (int i = 1; (i & lock.isHeldByCurrentThread()) == 0; i = 0) {
      throw new IllegalMonitorStateException();
    }
    boolean bool2;
    if (paramGuard.isSatisfied()) {
      bool2 = true;
    }
    for (;;)
    {
      return bool2;
      boolean bool3 = true;
      long l2 = System.nanoTime();
      boolean bool1 = Thread.interrupted();
      paramLong = l1;
      label75:
      bool2 = bool1;
      try
      {
        bool3 = awaitNanos(paramGuard, paramLong, bool3);
        bool2 = bool3;
        return bool3;
      }
      catch (InterruptedException paramTimeUnit)
      {
        boolean bool4 = true;
        bool1 = true;
        bool2 = bool4;
        bool3 = paramGuard.isSatisfied();
        if (bool3)
        {
          bool2 = true;
          if (1 == 0) {
            continue;
          }
          Thread.currentThread().interrupt();
          return true;
        }
        bool3 = false;
        bool2 = bool4;
        paramLong = System.nanoTime();
        paramLong = l2 + l1 - paramLong;
        break label75;
      }
      finally
      {
        if (bool2) {
          Thread.currentThread().interrupt();
        }
      }
    }
  }
  
  @Beta
  public static abstract class Guard
  {
    final Condition condition;
    final Monitor monitor;
    @GuardedBy("monitor.lock")
    Guard next;
    @GuardedBy("monitor.lock")
    int waiterCount = 0;
    
    protected Guard(Monitor paramMonitor)
    {
      monitor = ((Monitor)Preconditions.checkNotNull(paramMonitor, "monitor"));
      condition = lock.newCondition();
    }
    
    public abstract boolean isSatisfied();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Monitor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */