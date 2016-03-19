package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;

@Beta
public abstract class AbstractScheduledService
  implements Service
{
  private static final Logger logger = Logger.getLogger(AbstractScheduledService.class.getName());
  private final AbstractService delegate = new AbstractService()
  {
    private volatile ScheduledExecutorService executorService;
    private final ReentrantLock lock = new ReentrantLock();
    private volatile Future<?> runningTask;
    private final Runnable task = new Runnable()
    {
      /* Error */
      public void run()
      {
        // Byte code:
        //   0: aload_0
        //   1: getfield 14	com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   4: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
        //   7: invokevirtual 32	java/util/concurrent/locks/ReentrantLock:lock	()V
        //   10: aload_0
        //   11: getfield 14	com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   14: getfield 36	com/google/common/util/concurrent/AbstractScheduledService$1:this$0	Lcom/google/common/util/concurrent/AbstractScheduledService;
        //   17: invokevirtual 41	com/google/common/util/concurrent/AbstractScheduledService:runOneIteration	()V
        //   20: aload_0
        //   21: getfield 14	com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   24: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
        //   27: invokevirtual 44	java/util/concurrent/locks/ReentrantLock:unlock	()V
        //   30: return
        //   31: astore_1
        //   32: aload_0
        //   33: getfield 14	com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   36: getfield 36	com/google/common/util/concurrent/AbstractScheduledService$1:this$0	Lcom/google/common/util/concurrent/AbstractScheduledService;
        //   39: invokevirtual 47	com/google/common/util/concurrent/AbstractScheduledService:shutDown	()V
        //   42: aload_0
        //   43: getfield 14	com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   46: aload_1
        //   47: invokevirtual 51	com/google/common/util/concurrent/AbstractScheduledService$1:notifyFailed	(Ljava/lang/Throwable;)V
        //   50: aload_1
        //   51: invokestatic 57	com/google/common/base/Throwables:propagate	(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
        //   54: athrow
        //   55: astore_1
        //   56: aload_0
        //   57: getfield 14	com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   60: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
        //   63: invokevirtual 44	java/util/concurrent/locks/ReentrantLock:unlock	()V
        //   66: aload_1
        //   67: athrow
        //   68: astore_2
        //   69: invokestatic 61	com/google/common/util/concurrent/AbstractScheduledService:access$200	()Ljava/util/logging/Logger;
        //   72: getstatic 67	java/util/logging/Level:WARNING	Ljava/util/logging/Level;
        //   75: ldc 69
        //   77: aload_2
        //   78: invokevirtual 75	java/util/logging/Logger:log	(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
        //   81: goto -39 -> 42
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	84	0	this	1
        //   31	20	1	localThrowable	Throwable
        //   55	12	1	localObject	Object
        //   68	10	2	localException	Exception
        // Exception table:
        //   from	to	target	type
        //   10	20	31	java/lang/Throwable
        //   10	20	55	finally
        //   32	42	55	finally
        //   42	55	55	finally
        //   69	81	55	finally
        //   32	42	68	java/lang/Exception
      }
    };
    
    protected final void doStart()
    {
      executorService = MoreExecutors.renamingDecorator(executor(), new Supplier()
      {
        public String get()
        {
          return serviceName() + " " + state();
        }
      });
      executorService.execute(new Runnable()
      {
        public void run()
        {
          lock.lock();
          try
          {
            startUp();
            AbstractScheduledService.1.access$302(AbstractScheduledService.1.this, scheduler().schedule(delegate, executorService, task));
            notifyStarted();
            return;
          }
          catch (Throwable localThrowable)
          {
            notifyFailed(localThrowable);
            throw Throwables.propagate(localThrowable);
          }
          finally
          {
            lock.unlock();
          }
        }
      });
    }
    
    protected final void doStop()
    {
      runningTask.cancel(false);
      executorService.execute(new Runnable()
      {
        /* Error */
        public void run()
        {
          // Byte code:
          //   0: aload_0
          //   1: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   4: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   7: invokevirtual 32	java/util/concurrent/locks/ReentrantLock:lock	()V
          //   10: aload_0
          //   11: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   14: invokevirtual 36	com/google/common/util/concurrent/AbstractScheduledService$1:state	()Lcom/google/common/util/concurrent/Service$State;
          //   17: astore_1
          //   18: getstatic 42	com/google/common/util/concurrent/Service$State:STOPPING	Lcom/google/common/util/concurrent/Service$State;
          //   21: astore_2
          //   22: aload_1
          //   23: aload_2
          //   24: if_acmpeq +14 -> 38
          //   27: aload_0
          //   28: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   31: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   34: invokevirtual 45	java/util/concurrent/locks/ReentrantLock:unlock	()V
          //   37: return
          //   38: aload_0
          //   39: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   42: getfield 49	com/google/common/util/concurrent/AbstractScheduledService$1:this$0	Lcom/google/common/util/concurrent/AbstractScheduledService;
          //   45: invokevirtual 54	com/google/common/util/concurrent/AbstractScheduledService:shutDown	()V
          //   48: aload_0
          //   49: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   52: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   55: invokevirtual 45	java/util/concurrent/locks/ReentrantLock:unlock	()V
          //   58: aload_0
          //   59: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   62: invokevirtual 57	com/google/common/util/concurrent/AbstractScheduledService$1:notifyStopped	()V
          //   65: return
          //   66: astore_1
          //   67: aload_0
          //   68: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   71: aload_1
          //   72: invokevirtual 61	com/google/common/util/concurrent/AbstractScheduledService$1:notifyFailed	(Ljava/lang/Throwable;)V
          //   75: aload_1
          //   76: invokestatic 67	com/google/common/base/Throwables:propagate	(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
          //   79: athrow
          //   80: astore_1
          //   81: aload_0
          //   82: getfield 17	com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1	Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   85: invokestatic 27	com/google/common/util/concurrent/AbstractScheduledService$1:access$100	(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   88: invokevirtual 45	java/util/concurrent/locks/ReentrantLock:unlock	()V
          //   91: aload_1
          //   92: athrow
          // Local variable table:
          //   start	length	slot	name	signature
          //   0	93	0	this	4
          //   17	6	1	localState1	Service.State
          //   66	10	1	localThrowable	Throwable
          //   80	12	1	localObject	Object
          //   21	3	2	localState2	Service.State
          // Exception table:
          //   from	to	target	type
          //   0	10	66	java/lang/Throwable
          //   27	37	66	java/lang/Throwable
          //   48	65	66	java/lang/Throwable
          //   81	93	66	java/lang/Throwable
          //   10	22	80	finally
          //   38	48	80	finally
        }
      });
    }
  };
  
  public final void addListener(Service.Listener paramListener, Executor paramExecutor)
  {
    delegate.addListener(paramListener, paramExecutor);
  }
  
  public final void awaitRunning()
  {
    delegate.awaitRunning();
  }
  
  public final void awaitRunning(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    delegate.awaitRunning(paramLong, paramTimeUnit);
  }
  
  public final void awaitTerminated()
  {
    delegate.awaitTerminated();
  }
  
  public final void awaitTerminated(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    delegate.awaitTerminated(paramLong, paramTimeUnit);
  }
  
  protected ScheduledExecutorService executor()
  {
    final ScheduledExecutorService localScheduledExecutorService = Executors.newSingleThreadScheduledExecutor(new ThreadFactory()
    {
      public Thread newThread(Runnable paramAnonymousRunnable)
      {
        return MoreExecutors.newThread(serviceName(), paramAnonymousRunnable);
      }
    });
    addListener(new Service.Listener()
    {
      public void failed(Service.State paramAnonymousState, Throwable paramAnonymousThrowable)
      {
        localScheduledExecutorService.shutdown();
      }
      
      public void terminated(Service.State paramAnonymousState)
      {
        localScheduledExecutorService.shutdown();
      }
    }, MoreExecutors.sameThreadExecutor());
    return localScheduledExecutorService;
  }
  
  public final Throwable failureCause()
  {
    return delegate.failureCause();
  }
  
  public final boolean isRunning()
  {
    return delegate.isRunning();
  }
  
  protected abstract void runOneIteration()
    throws Exception;
  
  protected abstract Scheduler scheduler();
  
  protected String serviceName()
  {
    return getClass().getSimpleName();
  }
  
  protected void shutDown()
    throws Exception
  {}
  
  public final Service startAsync()
  {
    delegate.startAsync();
    return this;
  }
  
  protected void startUp()
    throws Exception
  {}
  
  public final Service.State state()
  {
    return delegate.state();
  }
  
  public final Service stopAsync()
  {
    delegate.stopAsync();
    return this;
  }
  
  public String toString()
  {
    return serviceName() + " [" + state() + "]";
  }
  
  @Beta
  public static abstract class CustomScheduler
    extends AbstractScheduledService.Scheduler
  {
    public CustomScheduler()
    {
      super();
    }
    
    protected abstract Schedule getNextSchedule()
      throws Exception;
    
    final Future<?> schedule(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable)
    {
      paramAbstractService = new ReschedulableCallable(paramAbstractService, paramScheduledExecutorService, paramRunnable);
      paramAbstractService.reschedule();
      return paramAbstractService;
    }
    
    private class ReschedulableCallable
      extends ForwardingFuture<Void>
      implements Callable<Void>
    {
      @GuardedBy("lock")
      private Future<Void> currentFuture;
      private final ScheduledExecutorService executor;
      private final ReentrantLock lock = new ReentrantLock();
      private final AbstractService service;
      private final Runnable wrappedRunnable;
      
      ReschedulableCallable(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable)
      {
        wrappedRunnable = paramRunnable;
        executor = paramScheduledExecutorService;
        service = paramAbstractService;
      }
      
      public Void call()
        throws Exception
      {
        wrappedRunnable.run();
        reschedule();
        return null;
      }
      
      public boolean cancel(boolean paramBoolean)
      {
        lock.lock();
        try
        {
          paramBoolean = currentFuture.cancel(paramBoolean);
          return paramBoolean;
        }
        finally
        {
          lock.unlock();
        }
      }
      
      protected Future<Void> delegate()
      {
        throw new UnsupportedOperationException("Only cancel is supported by this future");
      }
      
      public void reschedule()
      {
        lock.lock();
        try
        {
          if ((currentFuture == null) || (!currentFuture.isCancelled()))
          {
            AbstractScheduledService.CustomScheduler.Schedule localSchedule = getNextSchedule();
            currentFuture = executor.schedule(this, AbstractScheduledService.CustomScheduler.Schedule.access$700(localSchedule), AbstractScheduledService.CustomScheduler.Schedule.access$800(localSchedule));
          }
          return;
        }
        catch (Throwable localThrowable)
        {
          service.notifyFailed(localThrowable);
          return;
        }
        finally
        {
          lock.unlock();
        }
      }
    }
    
    @Beta
    protected static final class Schedule
    {
      private final long delay;
      private final TimeUnit unit;
      
      public Schedule(long paramLong, TimeUnit paramTimeUnit)
      {
        delay = paramLong;
        unit = ((TimeUnit)Preconditions.checkNotNull(paramTimeUnit));
      }
    }
  }
  
  public static abstract class Scheduler
  {
    public static Scheduler newFixedDelaySchedule(long paramLong1, long paramLong2, final TimeUnit paramTimeUnit)
    {
      new Scheduler(paramLong1)
      {
        public Future<?> schedule(AbstractService paramAnonymousAbstractService, ScheduledExecutorService paramAnonymousScheduledExecutorService, Runnable paramAnonymousRunnable)
        {
          return paramAnonymousScheduledExecutorService.scheduleWithFixedDelay(paramAnonymousRunnable, val$initialDelay, paramTimeUnit, val$unit);
        }
      };
    }
    
    public static Scheduler newFixedRateSchedule(long paramLong1, long paramLong2, final TimeUnit paramTimeUnit)
    {
      new Scheduler(paramLong1)
      {
        public Future<?> schedule(AbstractService paramAnonymousAbstractService, ScheduledExecutorService paramAnonymousScheduledExecutorService, Runnable paramAnonymousRunnable)
        {
          return paramAnonymousScheduledExecutorService.scheduleAtFixedRate(paramAnonymousRunnable, val$initialDelay, paramTimeUnit, val$unit);
        }
      };
    }
    
    abstract Future<?> schedule(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */