package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import java.util.concurrent.Executor;

class AbstractExecutionThreadService$1
  extends AbstractService
{
  AbstractExecutionThreadService$1(AbstractExecutionThreadService paramAbstractExecutionThreadService) {}
  
  protected final void doStart()
  {
    MoreExecutors.renamingDecorator(this$0.executor(), new Supplier()
    {
      public String get()
      {
        return this$0.serviceName();
      }
    }).execute(new Runnable()
    {
      /* Error */
      public void run()
      {
        // Byte code:
        //   0: aload_0
        //   1: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   4: getfield 29	com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0	Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
        //   7: invokevirtual 34	com/google/common/util/concurrent/AbstractExecutionThreadService:startUp	()V
        //   10: aload_0
        //   11: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   14: invokevirtual 37	com/google/common/util/concurrent/AbstractExecutionThreadService$1:notifyStarted	()V
        //   17: aload_0
        //   18: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   21: invokevirtual 41	com/google/common/util/concurrent/AbstractExecutionThreadService$1:isRunning	()Z
        //   24: istore_1
        //   25: iload_1
        //   26: ifeq +13 -> 39
        //   29: aload_0
        //   30: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   33: getfield 29	com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0	Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
        //   36: invokevirtual 43	com/google/common/util/concurrent/AbstractExecutionThreadService:run	()V
        //   39: aload_0
        //   40: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   43: getfield 29	com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0	Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
        //   46: invokevirtual 46	com/google/common/util/concurrent/AbstractExecutionThreadService:shutDown	()V
        //   49: aload_0
        //   50: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   53: invokevirtual 49	com/google/common/util/concurrent/AbstractExecutionThreadService$1:notifyStopped	()V
        //   56: return
        //   57: astore_2
        //   58: aload_0
        //   59: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   62: getfield 29	com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0	Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
        //   65: invokevirtual 46	com/google/common/util/concurrent/AbstractExecutionThreadService:shutDown	()V
        //   68: aload_2
        //   69: athrow
        //   70: astore_2
        //   71: aload_0
        //   72: getfield 17	com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1	Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
        //   75: aload_2
        //   76: invokevirtual 53	com/google/common/util/concurrent/AbstractExecutionThreadService$1:notifyFailed	(Ljava/lang/Throwable;)V
        //   79: aload_2
        //   80: invokestatic 59	com/google/common/base/Throwables:propagate	(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
        //   83: athrow
        //   84: astore_3
        //   85: invokestatic 63	com/google/common/util/concurrent/AbstractExecutionThreadService:access$000	()Ljava/util/logging/Logger;
        //   88: getstatic 69	java/util/logging/Level:WARNING	Ljava/util/logging/Level;
        //   91: ldc 71
        //   93: aload_3
        //   94: invokevirtual 77	java/util/logging/Logger:log	(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
        //   97: goto -29 -> 68
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	100	0	this	2
        //   24	2	1	bool	boolean
        //   57	12	2	localThrowable1	Throwable
        //   70	10	2	localThrowable2	Throwable
        //   84	10	3	localException	Exception
        // Exception table:
        //   from	to	target	type
        //   29	39	57	java/lang/Throwable
        //   0	25	70	java/lang/Throwable
        //   39	56	70	java/lang/Throwable
        //   58	68	70	java/lang/Throwable
        //   68	70	70	java/lang/Throwable
        //   85	97	70	java/lang/Throwable
        //   58	68	84	java/lang/Exception
      }
    });
  }
  
  protected void doStop()
  {
    this$0.triggerShutdown();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractExecutionThreadService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */