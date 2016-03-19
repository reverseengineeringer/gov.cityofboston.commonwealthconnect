package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.Immutable;

@Beta
public abstract class AbstractService
  implements Service
{
  private static final ListenerCallQueue.Callback<Service.Listener> RUNNING_CALLBACK;
  private static final ListenerCallQueue.Callback<Service.Listener> STARTING_CALLBACK = new ListenerCallQueue.Callback("starting()")
  {
    void call(Service.Listener paramAnonymousListener)
    {
      paramAnonymousListener.starting();
    }
  };
  private static final ListenerCallQueue.Callback<Service.Listener> STOPPING_FROM_RUNNING_CALLBACK = stoppingCallback(Service.State.RUNNING);
  private static final ListenerCallQueue.Callback<Service.Listener> STOPPING_FROM_STARTING_CALLBACK;
  private static final ListenerCallQueue.Callback<Service.Listener> TERMINATED_FROM_NEW_CALLBACK = terminatedCallback(Service.State.NEW);
  private static final ListenerCallQueue.Callback<Service.Listener> TERMINATED_FROM_RUNNING_CALLBACK = terminatedCallback(Service.State.RUNNING);
  private static final ListenerCallQueue.Callback<Service.Listener> TERMINATED_FROM_STOPPING_CALLBACK = terminatedCallback(Service.State.STOPPING);
  private final Monitor.Guard hasReachedRunning = new Monitor.Guard(monitor)
  {
    public boolean isSatisfied()
    {
      return state().compareTo(Service.State.RUNNING) >= 0;
    }
  };
  private final Monitor.Guard isStartable = new Monitor.Guard(monitor)
  {
    public boolean isSatisfied()
    {
      return state() == Service.State.NEW;
    }
  };
  private final Monitor.Guard isStoppable = new Monitor.Guard(monitor)
  {
    public boolean isSatisfied()
    {
      return state().compareTo(Service.State.RUNNING) <= 0;
    }
  };
  private final Monitor.Guard isStopped = new Monitor.Guard(monitor)
  {
    public boolean isSatisfied()
    {
      return state().isTerminal();
    }
  };
  @GuardedBy("monitor")
  private final List<ListenerCallQueue<Service.Listener>> listeners = Collections.synchronizedList(new ArrayList());
  private final Monitor monitor = new Monitor();
  @GuardedBy("monitor")
  private volatile StateSnapshot snapshot = new StateSnapshot(Service.State.NEW);
  
  static
  {
    RUNNING_CALLBACK = new ListenerCallQueue.Callback("running()")
    {
      void call(Service.Listener paramAnonymousListener)
      {
        paramAnonymousListener.running();
      }
    };
    STOPPING_FROM_STARTING_CALLBACK = stoppingCallback(Service.State.STARTING);
  }
  
  @GuardedBy("monitor")
  private void checkCurrentState(Service.State paramState)
  {
    Service.State localState = state();
    if (localState != paramState)
    {
      if (localState == Service.State.FAILED) {
        throw new IllegalStateException("Expected the service to be " + paramState + ", but the service has FAILED", failureCause());
      }
      throw new IllegalStateException("Expected the service to be " + paramState + ", but was " + localState);
    }
  }
  
  private void executeListeners()
  {
    if (!monitor.isOccupiedByCurrentThread())
    {
      int i = 0;
      while (i < listeners.size())
      {
        ((ListenerCallQueue)listeners.get(i)).execute();
        i += 1;
      }
    }
  }
  
  @GuardedBy("monitor")
  private void failed(final Service.State paramState, final Throwable paramThrowable)
  {
    new ListenerCallQueue.Callback("failed({from = " + paramState + ", cause = " + paramThrowable + "})")
    {
      void call(Service.Listener paramAnonymousListener)
      {
        paramAnonymousListener.failed(paramState, paramThrowable);
      }
    }.enqueueOn(listeners);
  }
  
  @GuardedBy("monitor")
  private void running()
  {
    RUNNING_CALLBACK.enqueueOn(listeners);
  }
  
  @GuardedBy("monitor")
  private void starting()
  {
    STARTING_CALLBACK.enqueueOn(listeners);
  }
  
  @GuardedBy("monitor")
  private void stopping(Service.State paramState)
  {
    if (paramState == Service.State.STARTING)
    {
      STOPPING_FROM_STARTING_CALLBACK.enqueueOn(listeners);
      return;
    }
    if (paramState == Service.State.RUNNING)
    {
      STOPPING_FROM_RUNNING_CALLBACK.enqueueOn(listeners);
      return;
    }
    throw new AssertionError();
  }
  
  private static ListenerCallQueue.Callback<Service.Listener> stoppingCallback(final Service.State paramState)
  {
    new ListenerCallQueue.Callback("stopping({from = " + paramState + "})")
    {
      void call(Service.Listener paramAnonymousListener)
      {
        paramAnonymousListener.stopping(paramState);
      }
    };
  }
  
  @GuardedBy("monitor")
  private void terminated(Service.State paramState)
  {
    switch (paramState)
    {
    case ???: 
    default: 
      throw new AssertionError();
    case ???: 
      TERMINATED_FROM_NEW_CALLBACK.enqueueOn(listeners);
      return;
    case ???: 
      TERMINATED_FROM_RUNNING_CALLBACK.enqueueOn(listeners);
      return;
    }
    TERMINATED_FROM_STOPPING_CALLBACK.enqueueOn(listeners);
  }
  
  private static ListenerCallQueue.Callback<Service.Listener> terminatedCallback(final Service.State paramState)
  {
    new ListenerCallQueue.Callback("terminated({from = " + paramState + "})")
    {
      void call(Service.Listener paramAnonymousListener)
      {
        paramAnonymousListener.terminated(paramState);
      }
    };
  }
  
  public final void addListener(Service.Listener paramListener, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramListener, "listener");
    Preconditions.checkNotNull(paramExecutor, "executor");
    monitor.enter();
    try
    {
      if (!state().isTerminal()) {
        listeners.add(new ListenerCallQueue(paramListener, paramExecutor));
      }
      return;
    }
    finally
    {
      monitor.leave();
    }
  }
  
  public final void awaitRunning()
  {
    monitor.enterWhenUninterruptibly(hasReachedRunning);
    try
    {
      checkCurrentState(Service.State.RUNNING);
      return;
    }
    finally
    {
      monitor.leave();
    }
  }
  
  public final void awaitRunning(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    if (monitor.enterWhenUninterruptibly(hasReachedRunning, paramLong, paramTimeUnit)) {
      try
      {
        checkCurrentState(Service.State.RUNNING);
        return;
      }
      finally
      {
        monitor.leave();
      }
    }
    throw new TimeoutException("Timed out waiting for " + this + " to reach the RUNNING state. " + "Current state: " + state());
  }
  
  public final void awaitTerminated()
  {
    monitor.enterWhenUninterruptibly(isStopped);
    try
    {
      checkCurrentState(Service.State.TERMINATED);
      return;
    }
    finally
    {
      monitor.leave();
    }
  }
  
  public final void awaitTerminated(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    if (monitor.enterWhenUninterruptibly(isStopped, paramLong, paramTimeUnit)) {
      try
      {
        checkCurrentState(Service.State.TERMINATED);
        return;
      }
      finally
      {
        monitor.leave();
      }
    }
    throw new TimeoutException("Timed out waiting for " + this + " to reach a terminal state. " + "Current state: " + state());
  }
  
  protected abstract void doStart();
  
  protected abstract void doStop();
  
  public final Throwable failureCause()
  {
    return snapshot.failureCause();
  }
  
  public final boolean isRunning()
  {
    return state() == Service.State.RUNNING;
  }
  
  protected final void notifyFailed(Throwable paramThrowable)
  {
    Preconditions.checkNotNull(paramThrowable);
    monitor.enter();
    try
    {
      localState = state();
      switch (localState)
      {
      case ???: 
        throw new AssertionError("Unexpected state: " + localState);
      }
    }
    finally
    {
      Service.State localState;
      monitor.leave();
      executeListeners();
      throw paramThrowable;
      throw new IllegalStateException("Failed while in state:" + localState, paramThrowable);
      snapshot = new StateSnapshot(Service.State.FAILED, false, paramThrowable);
      failed(localState, paramThrowable);
      monitor.leave();
      executeListeners();
    }
  }
  
  protected final void notifyStarted()
  {
    monitor.enter();
    try
    {
      if (snapshot.state != Service.State.STARTING)
      {
        IllegalStateException localIllegalStateException = new IllegalStateException("Cannot notifyStarted() when the service is " + snapshot.state);
        notifyFailed(localIllegalStateException);
        throw localIllegalStateException;
      }
    }
    finally
    {
      monitor.leave();
      executeListeners();
    }
    if (snapshot.shutdownWhenStartupFinishes)
    {
      snapshot = new StateSnapshot(Service.State.STOPPING);
      doStop();
    }
    for (;;)
    {
      monitor.leave();
      executeListeners();
      return;
      snapshot = new StateSnapshot(Service.State.RUNNING);
      running();
    }
  }
  
  protected final void notifyStopped()
  {
    monitor.enter();
    try
    {
      Object localObject = snapshot.state;
      if ((localObject != Service.State.STOPPING) && (localObject != Service.State.RUNNING))
      {
        localObject = new IllegalStateException("Cannot notifyStopped() when the service is " + localObject);
        notifyFailed((Throwable)localObject);
        throw ((Throwable)localObject);
      }
    }
    finally
    {
      monitor.leave();
      executeListeners();
    }
    snapshot = new StateSnapshot(Service.State.TERMINATED);
    terminated(localState);
    monitor.leave();
    executeListeners();
  }
  
  public final Service startAsync()
  {
    if (monitor.enterIf(isStartable)) {
      try
      {
        snapshot = new StateSnapshot(Service.State.STARTING);
        starting();
        doStart();
        return this;
      }
      catch (Throwable localThrowable)
      {
        notifyFailed(localThrowable);
        return this;
      }
      finally
      {
        monitor.leave();
        executeListeners();
      }
    }
    throw new IllegalStateException("Service " + this + " has already been started");
  }
  
  public final Service.State state()
  {
    return snapshot.externalState();
  }
  
  public final Service stopAsync()
  {
    if (monitor.enterIf(isStoppable)) {}
    try
    {
      Service.State localState = state();
      switch (localState)
      {
      case ???: 
        throw new AssertionError("Unexpected state: " + localState);
      }
    }
    catch (Throwable localThrowable)
    {
      notifyFailed(localThrowable);
      monitor.leave();
      executeListeners();
      return this;
      snapshot = new StateSnapshot(Service.State.TERMINATED);
      terminated(Service.State.NEW);
      monitor.leave();
      executeListeners();
      return this;
      snapshot = new StateSnapshot(Service.State.STARTING, true, null);
      stopping(Service.State.STARTING);
    }
    finally
    {
      for (;;)
      {
        monitor.leave();
        executeListeners();
        throw ((Throwable)localObject);
        snapshot = new StateSnapshot(Service.State.STOPPING);
        stopping(Service.State.RUNNING);
        doStop();
      }
    }
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + " [" + state() + "]";
  }
  
  @Immutable
  private static final class StateSnapshot
  {
    @Nullable
    final Throwable failure;
    final boolean shutdownWhenStartupFinishes;
    final Service.State state;
    
    StateSnapshot(Service.State paramState)
    {
      this(paramState, false, null);
    }
    
    StateSnapshot(Service.State paramState, boolean paramBoolean, @Nullable Throwable paramThrowable)
    {
      int i;
      label40:
      int j;
      if ((!paramBoolean) || (paramState == Service.State.STARTING))
      {
        bool = true;
        Preconditions.checkArgument(bool, "shudownWhenStartupFinishes can only be set if state is STARTING. Got %s instead.", new Object[] { paramState });
        if (paramThrowable == null) {
          break label102;
        }
        i = 1;
        if (paramState != Service.State.FAILED) {
          break label108;
        }
        j = 1;
        label50:
        if ((i ^ j) != 0) {
          break label114;
        }
      }
      label102:
      label108:
      label114:
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "A failure cause should be set if and only if the state is failed.  Got %s and %s instead.", new Object[] { paramState, paramThrowable });
        state = paramState;
        shutdownWhenStartupFinishes = paramBoolean;
        failure = paramThrowable;
        return;
        bool = false;
        break;
        i = 0;
        break label40;
        j = 0;
        break label50;
      }
    }
    
    Service.State externalState()
    {
      if ((shutdownWhenStartupFinishes) && (state == Service.State.STARTING)) {
        return Service.State.STOPPING;
      }
      return state;
    }
    
    Throwable failureCause()
    {
      if (state == Service.State.FAILED) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkState(bool, "failureCause() is only valid if the service has failed, service is %s", new Object[] { state });
        return failure;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */