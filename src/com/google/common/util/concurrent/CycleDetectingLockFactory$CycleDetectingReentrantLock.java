package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

final class CycleDetectingLockFactory$CycleDetectingReentrantLock
  extends ReentrantLock
  implements CycleDetectingLockFactory.CycleDetectingLock
{
  private final CycleDetectingLockFactory.LockGraphNode lockGraphNode;
  
  private CycleDetectingLockFactory$CycleDetectingReentrantLock(CycleDetectingLockFactory paramCycleDetectingLockFactory, CycleDetectingLockFactory.LockGraphNode paramLockGraphNode, boolean paramBoolean)
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
    return isHeldByCurrentThread();
  }
  
  public void lock()
  {
    CycleDetectingLockFactory.access$600(this$0, this);
    try
    {
      super.lock();
      return;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, this);
    }
  }
  
  public void lockInterruptibly()
    throws InterruptedException
  {
    CycleDetectingLockFactory.access$600(this$0, this);
    try
    {
      super.lockInterruptibly();
      return;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, this);
    }
  }
  
  public boolean tryLock()
  {
    CycleDetectingLockFactory.access$600(this$0, this);
    try
    {
      boolean bool = super.tryLock();
      return bool;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, this);
    }
  }
  
  public boolean tryLock(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    CycleDetectingLockFactory.access$600(this$0, this);
    try
    {
      boolean bool = super.tryLock(paramLong, paramTimeUnit);
      return bool;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, this);
    }
  }
  
  public void unlock()
  {
    try
    {
      super.unlock();
      return;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, this);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.CycleDetectingReentrantLock
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */