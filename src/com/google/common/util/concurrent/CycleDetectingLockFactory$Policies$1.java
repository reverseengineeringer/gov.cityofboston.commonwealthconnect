package com.google.common.util.concurrent;

 enum CycleDetectingLockFactory$Policies$1
{
  CycleDetectingLockFactory$Policies$1()
  {
    super(paramString, paramInt, null);
  }
  
  public void handlePotentialDeadlock(CycleDetectingLockFactory.PotentialDeadlockException paramPotentialDeadlockException)
  {
    throw paramPotentialDeadlockException;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.Policies.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */