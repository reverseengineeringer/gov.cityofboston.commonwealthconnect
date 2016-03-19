package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import javax.annotation.concurrent.ThreadSafe;

@Beta
@ThreadSafe
public abstract interface CycleDetectingLockFactory$Policy
{
  public abstract void handlePotentialDeadlock(CycleDetectingLockFactory.PotentialDeadlockException paramPotentialDeadlockException);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.Policy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */