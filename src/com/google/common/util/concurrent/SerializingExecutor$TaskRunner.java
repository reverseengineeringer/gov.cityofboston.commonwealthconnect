package com.google.common.util.concurrent;

class SerializingExecutor$TaskRunner
  implements Runnable
{
  private SerializingExecutor$TaskRunner(SerializingExecutor paramSerializingExecutor) {}
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_3
    //   2: iconst_1
    //   3: istore_2
    //   4: iload_2
    //   5: istore_1
    //   6: aload_0
    //   7: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   10: invokestatic 29	com/google/common/util/concurrent/SerializingExecutor:access$100	(Lcom/google/common/util/concurrent/SerializingExecutor;)Z
    //   13: invokestatic 35	com/google/common/base/Preconditions:checkState	(Z)V
    //   16: iload_2
    //   17: istore_1
    //   18: aload_0
    //   19: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   22: invokestatic 39	com/google/common/util/concurrent/SerializingExecutor:access$200	(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
    //   25: astore 4
    //   27: iload_2
    //   28: istore_1
    //   29: aload 4
    //   31: monitorenter
    //   32: iload_3
    //   33: istore_1
    //   34: aload_0
    //   35: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   38: invokestatic 43	com/google/common/util/concurrent/SerializingExecutor:access$300	(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/util/Queue;
    //   41: invokeinterface 49 1 0
    //   46: checkcast 6	java/lang/Runnable
    //   49: astore 5
    //   51: aload 5
    //   53: ifnonnull +48 -> 101
    //   56: iload_3
    //   57: istore_1
    //   58: aload_0
    //   59: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   62: iconst_0
    //   63: invokestatic 53	com/google/common/util/concurrent/SerializingExecutor:access$102	(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
    //   66: pop
    //   67: iconst_0
    //   68: istore_1
    //   69: aload 4
    //   71: monitorexit
    //   72: iconst_0
    //   73: ifeq +27 -> 100
    //   76: aload_0
    //   77: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   80: invokestatic 39	com/google/common/util/concurrent/SerializingExecutor:access$200	(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
    //   83: astore 4
    //   85: aload 4
    //   87: monitorenter
    //   88: aload_0
    //   89: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   92: iconst_0
    //   93: invokestatic 53	com/google/common/util/concurrent/SerializingExecutor:access$102	(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
    //   96: pop
    //   97: aload 4
    //   99: monitorexit
    //   100: return
    //   101: iload_3
    //   102: istore_1
    //   103: aload 4
    //   105: monitorexit
    //   106: iload_2
    //   107: istore_1
    //   108: aload 5
    //   110: invokeinterface 55 1 0
    //   115: goto -111 -> 4
    //   118: astore 4
    //   120: iload_2
    //   121: istore_1
    //   122: invokestatic 59	com/google/common/util/concurrent/SerializingExecutor:access$400	()Ljava/util/logging/Logger;
    //   125: getstatic 65	java/util/logging/Level:SEVERE	Ljava/util/logging/Level;
    //   128: new 67	java/lang/StringBuilder
    //   131: dup
    //   132: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   135: ldc 70
    //   137: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: aload 5
    //   142: invokevirtual 77	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   145: invokevirtual 81	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   148: aload 4
    //   150: invokevirtual 87	java/util/logging/Logger:log	(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   153: goto -149 -> 4
    //   156: astore 5
    //   158: iload_1
    //   159: ifeq +27 -> 186
    //   162: aload_0
    //   163: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   166: invokestatic 39	com/google/common/util/concurrent/SerializingExecutor:access$200	(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
    //   169: astore 4
    //   171: aload 4
    //   173: monitorenter
    //   174: aload_0
    //   175: getfield 15	com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0	Lcom/google/common/util/concurrent/SerializingExecutor;
    //   178: iconst_0
    //   179: invokestatic 53	com/google/common/util/concurrent/SerializingExecutor:access$102	(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
    //   182: pop
    //   183: aload 4
    //   185: monitorexit
    //   186: aload 5
    //   188: athrow
    //   189: astore 5
    //   191: aload 4
    //   193: monitorexit
    //   194: aload 5
    //   196: athrow
    //   197: astore 5
    //   199: aload 4
    //   201: monitorexit
    //   202: aload 5
    //   204: athrow
    //   205: astore 5
    //   207: aload 4
    //   209: monitorexit
    //   210: aload 5
    //   212: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	213	0	this	TaskRunner
    //   5	154	1	i	int
    //   3	118	2	j	int
    //   1	101	3	k	int
    //   118	31	4	localRuntimeException	RuntimeException
    //   49	92	5	localRunnable	Runnable
    //   156	31	5	localObject3	Object
    //   189	6	5	localObject4	Object
    //   197	6	5	localObject5	Object
    //   205	6	5	localObject6	Object
    // Exception table:
    //   from	to	target	type
    //   108	115	118	java/lang/RuntimeException
    //   6	16	156	finally
    //   18	27	156	finally
    //   29	32	156	finally
    //   108	115	156	finally
    //   122	153	156	finally
    //   194	197	156	finally
    //   34	51	189	finally
    //   58	67	189	finally
    //   69	72	189	finally
    //   103	106	189	finally
    //   191	194	189	finally
    //   88	100	197	finally
    //   199	202	197	finally
    //   174	186	205	finally
    //   207	210	205	finally
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.SerializingExecutor.TaskRunner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */