package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.concurrent.GuardedBy;

@Beta
public abstract class Monitor$Guard
{
  final Condition condition;
  final Monitor monitor;
  @GuardedBy("monitor.lock")
  Guard next;
  @GuardedBy("monitor.lock")
  int waiterCount = 0;
  
  protected Monitor$Guard(Monitor paramMonitor)
  {
    monitor = ((Monitor)Preconditions.checkNotNull(paramMonitor, "monitor"));
    condition = Monitor.access$000(paramMonitor).newCondition();
  }
  
  public abstract boolean isSatisfied();
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Monitor.Guard
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */