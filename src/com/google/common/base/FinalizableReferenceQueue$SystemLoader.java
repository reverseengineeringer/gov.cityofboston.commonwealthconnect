package com.google.common.base;

import com.google.common.annotations.VisibleForTesting;

class FinalizableReferenceQueue$SystemLoader
  implements FinalizableReferenceQueue.FinalizerLoader
{
  @VisibleForTesting
  static boolean disabled;
  
  /* Error */
  public Class<?> loadFinalizer()
  {
    // Byte code:
    //   0: getstatic 25	com/google/common/base/FinalizableReferenceQueue$SystemLoader:disabled	Z
    //   3: ifeq +5 -> 8
    //   6: aconst_null
    //   7: areturn
    //   8: invokestatic 31	java/lang/ClassLoader:getSystemClassLoader	()Ljava/lang/ClassLoader;
    //   11: astore_1
    //   12: aload_1
    //   13: ifnull -7 -> 6
    //   16: aload_1
    //   17: ldc 33
    //   19: invokevirtual 37	java/lang/ClassLoader:loadClass	(Ljava/lang/String;)Ljava/lang/Class;
    //   22: astore_1
    //   23: aload_1
    //   24: areturn
    //   25: astore_1
    //   26: invokestatic 41	com/google/common/base/FinalizableReferenceQueue:access$000	()Ljava/util/logging/Logger;
    //   29: ldc 43
    //   31: invokevirtual 49	java/util/logging/Logger:info	(Ljava/lang/String;)V
    //   34: aconst_null
    //   35: areturn
    //   36: astore_1
    //   37: aconst_null
    //   38: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	39	0	this	SystemLoader
    //   11	13	1	localObject	Object
    //   25	1	1	localSecurityException	SecurityException
    //   36	1	1	localClassNotFoundException	ClassNotFoundException
    // Exception table:
    //   from	to	target	type
    //   8	12	25	java/lang/SecurityException
    //   16	23	36	java/lang/ClassNotFoundException
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.FinalizableReferenceQueue.SystemLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */