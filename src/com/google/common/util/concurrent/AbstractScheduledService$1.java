package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.locks.ReentrantLock;

class AbstractScheduledService$1
  extends AbstractService
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
  
  AbstractScheduledService$1(AbstractScheduledService paramAbstractScheduledService) {}
  
  protected final void doStart()
  {
    executorService = MoreExecutors.renamingDecorator(this$0.executor(), new Supplier()
    {
      public String get()
      {
        return this$0.serviceName() + " " + state();
      }
    });
    executorService.execute(new Runnable()
    {
      public void run()
      {
        lock.lock();
        try
        {
          this$0.startUp();
          AbstractScheduledService.1.access$302(AbstractScheduledService.1.this, this$0.scheduler().schedule(AbstractScheduledService.access$400(this$0), executorService, task));
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
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */