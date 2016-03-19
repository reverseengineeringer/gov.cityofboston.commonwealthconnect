package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;

@Beta
public final class CycleDetectingLockFactory$PotentialDeadlockException
  extends CycleDetectingLockFactory.ExampleStackTrace
{
  private final CycleDetectingLockFactory.ExampleStackTrace conflictingStackTrace;
  
  private CycleDetectingLockFactory$PotentialDeadlockException(CycleDetectingLockFactory.LockGraphNode paramLockGraphNode1, CycleDetectingLockFactory.LockGraphNode paramLockGraphNode2, CycleDetectingLockFactory.ExampleStackTrace paramExampleStackTrace)
  {
    super(paramLockGraphNode1, paramLockGraphNode2);
    conflictingStackTrace = paramExampleStackTrace;
    initCause(paramExampleStackTrace);
  }
  
  public CycleDetectingLockFactory.ExampleStackTrace getConflictingStackTrace()
  {
    return conflictingStackTrace;
  }
  
  public String getMessage()
  {
    StringBuilder localStringBuilder = new StringBuilder(super.getMessage());
    for (Object localObject = conflictingStackTrace; localObject != null; localObject = ((Throwable)localObject).getCause()) {
      localStringBuilder.append(", ").append(((Throwable)localObject).getMessage());
    }
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.PotentialDeadlockException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */