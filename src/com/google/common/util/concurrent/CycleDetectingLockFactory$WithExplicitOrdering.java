package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

@Beta
public final class CycleDetectingLockFactory$WithExplicitOrdering<E extends Enum<E>>
  extends CycleDetectingLockFactory
{
  private final Map<E, CycleDetectingLockFactory.LockGraphNode> lockGraphNodes;
  
  @VisibleForTesting
  CycleDetectingLockFactory$WithExplicitOrdering(CycleDetectingLockFactory.Policy paramPolicy, Map<E, CycleDetectingLockFactory.LockGraphNode> paramMap)
  {
    super(paramPolicy, null);
    lockGraphNodes = paramMap;
  }
  
  public ReentrantLock newReentrantLock(E paramE)
  {
    return newReentrantLock(paramE, false);
  }
  
  public ReentrantLock newReentrantLock(E paramE, boolean paramBoolean)
  {
    if (policy == CycleDetectingLockFactory.Policies.DISABLED) {
      return new ReentrantLock(paramBoolean);
    }
    return new CycleDetectingLockFactory.CycleDetectingReentrantLock(this, (CycleDetectingLockFactory.LockGraphNode)lockGraphNodes.get(paramE), paramBoolean, null);
  }
  
  public ReentrantReadWriteLock newReentrantReadWriteLock(E paramE)
  {
    return newReentrantReadWriteLock(paramE, false);
  }
  
  public ReentrantReadWriteLock newReentrantReadWriteLock(E paramE, boolean paramBoolean)
  {
    if (policy == CycleDetectingLockFactory.Policies.DISABLED) {
      return new ReentrantReadWriteLock(paramBoolean);
    }
    return new CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock(this, (CycleDetectingLockFactory.LockGraphNode)lockGraphNodes.get(paramE), paramBoolean, null);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.WithExplicitOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */