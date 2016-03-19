package com.google.common.util.concurrent;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;

class CycleDetectingLockFactory$CycleDetectingReentrantReadLock
  extends ReentrantReadWriteLock.ReadLock
{
  final CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock readWriteLock;
  
  CycleDetectingLockFactory$CycleDetectingReentrantReadLock(CycleDetectingLockFactory paramCycleDetectingLockFactory, CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock paramCycleDetectingReentrantReadWriteLock)
  {
    super(paramCycleDetectingReentrantReadWriteLock);
    readWriteLock = paramCycleDetectingReentrantReadWriteLock;
  }
  
  public void lock()
  {
    CycleDetectingLockFactory.access$600(this$0, readWriteLock);
    try
    {
      super.lock();
      return;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, readWriteLock);
    }
  }
  
  public void lockInterruptibly()
    throws InterruptedException
  {
    CycleDetectingLockFactory.access$600(this$0, readWriteLock);
    try
    {
      super.lockInterruptibly();
      return;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, readWriteLock);
    }
  }
  
  public boolean tryLock()
  {
    CycleDetectingLockFactory.access$600(this$0, readWriteLock);
    try
    {
      boolean bool = super.tryLock();
      return bool;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, readWriteLock);
    }
  }
  
  public boolean tryLock(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    CycleDetectingLockFactory.access$600(this$0, readWriteLock);
    try
    {
      boolean bool = super.tryLock(paramLong, paramTimeUnit);
      return bool;
    }
    finally
    {
      CycleDetectingLockFactory.access$700(this$0, readWriteLock);
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
      CycleDetectingLockFactory.access$700(this$0, readWriteLock);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.CycleDetectingReentrantReadLock
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */