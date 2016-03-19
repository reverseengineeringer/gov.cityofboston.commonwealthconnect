package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

final class CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock
  extends ReentrantReadWriteLock
  implements CycleDetectingLockFactory.CycleDetectingLock
{
  private final CycleDetectingLockFactory.LockGraphNode lockGraphNode;
  private final CycleDetectingLockFactory.CycleDetectingReentrantReadLock readLock = new CycleDetectingLockFactory.CycleDetectingReentrantReadLock(paramCycleDetectingLockFactory, this);
  private final CycleDetectingLockFactory.CycleDetectingReentrantWriteLock writeLock = new CycleDetectingLockFactory.CycleDetectingReentrantWriteLock(paramCycleDetectingLockFactory, this);
  
  private CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock(CycleDetectingLockFactory paramCycleDetectingLockFactory, CycleDetectingLockFactory.LockGraphNode paramLockGraphNode, boolean paramBoolean)
  {
    super(paramBoolean);
    lockGraphNode = ((CycleDetectingLockFactory.LockGraphNode)Preconditions.checkNotNull(paramLockGraphNode));
  }
  
  public CycleDetectingLockFactory.LockGraphNode getLockGraphNode()
  {
    return lockGraphNode;
  }
  
  public boolean isAcquiredByCurrentThread()
  {
    return (isWriteLockedByCurrentThread()) || (getReadHoldCount() > 0);
  }
  
  public ReentrantReadWriteLock.ReadLock readLock()
  {
    return readLock;
  }
  
  public ReentrantReadWriteLock.WriteLock writeLock()
  {
    return writeLock;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */