package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.concurrent.GuardedBy;

@Beta
public abstract class AbstractScheduledService$CustomScheduler
  extends AbstractScheduledService.Scheduler
{
  public AbstractScheduledService$CustomScheduler()
  {
    super(null);
  }
  
  protected abstract Schedule getNextSchedule()
    throws Exception;
  
  final Future<?> schedule(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable)
  {
    paramAbstractService = new ReschedulableCallable(paramAbstractService, paramScheduledExecutorService, paramRunnable);
    paramAbstractService.reschedule();
    return paramAbstractService;
  }
  
  private class ReschedulableCallable
    extends ForwardingFuture<Void>
    implements Callable<Void>
  {
    @GuardedBy("lock")
    private Future<Void> currentFuture;
    private final ScheduledExecutorService executor;
    private final ReentrantLock lock = new ReentrantLock();
    private final AbstractService service;
    private final Runnable wrappedRunnable;
    
    ReschedulableCallable(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable)
    {
      wrappedRunnable = paramRunnable;
      executor = paramScheduledExecutorService;
      service = paramAbstractService;
    }
    
    public Void call()
      throws Exception
    {
      wrappedRunnable.run();
      reschedule();
      return null;
    }
    
    public boolean cancel(boolean paramBoolean)
    {
      lock.lock();
      try
      {
        paramBoolean = currentFuture.cancel(paramBoolean);
        return paramBoolean;
      }
      finally
      {
        lock.unlock();
      }
    }
    
    protected Future<Void> delegate()
    {
      throw new UnsupportedOperationException("Only cancel is supported by this future");
    }
    
    public void reschedule()
    {
      lock.lock();
      try
      {
        if ((currentFuture == null) || (!currentFuture.isCancelled()))
        {
          AbstractScheduledService.CustomScheduler.Schedule localSchedule = getNextSchedule();
          currentFuture = executor.schedule(this, AbstractScheduledService.CustomScheduler.Schedule.access$700(localSchedule), AbstractScheduledService.CustomScheduler.Schedule.access$800(localSchedule));
        }
        return;
      }
      catch (Throwable localThrowable)
      {
        service.notifyFailed(localThrowable);
        return;
      }
      finally
      {
        lock.unlock();
      }
    }
  }
  
  @Beta
  protected static final class Schedule
  {
    private final long delay;
    private final TimeUnit unit;
    
    public Schedule(long paramLong, TimeUnit paramTimeUnit)
    {
      delay = paramLong;
      unit = ((TimeUnit)Preconditions.checkNotNull(paramTimeUnit));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.CustomScheduler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */