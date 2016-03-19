package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Beta
public abstract class AbstractIdleService
  implements Service
{
  private final Service delegate = new AbstractService()
  {
    protected final void doStart()
    {
      MoreExecutors.renamingDecorator(executor(), threadNameSupplier).execute(new Runnable()
      {
        public void run()
        {
          try
          {
            startUp();
            notifyStarted();
            return;
          }
          catch (Throwable localThrowable)
          {
            notifyFailed(localThrowable);
            throw Throwables.propagate(localThrowable);
          }
        }
      });
    }
    
    protected final void doStop()
    {
      MoreExecutors.renamingDecorator(executor(), threadNameSupplier).execute(new Runnable()
      {
        public void run()
        {
          try
          {
            shutDown();
            notifyStopped();
            return;
          }
          catch (Throwable localThrowable)
          {
            notifyFailed(localThrowable);
            throw Throwables.propagate(localThrowable);
          }
        }
      });
    }
  };
  private final Supplier<String> threadNameSupplier = new Supplier()
  {
    public String get()
    {
      return serviceName() + " " + state();
    }
  };
  
  public final void addListener(Service.Listener paramListener, Executor paramExecutor)
  {
    delegate.addListener(paramListener, paramExecutor);
  }
  
  public final void awaitRunning()
  {
    delegate.awaitRunning();
  }
  
  public final void awaitRunning(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    delegate.awaitRunning(paramLong, paramTimeUnit);
  }
  
  public final void awaitTerminated()
  {
    delegate.awaitTerminated();
  }
  
  public final void awaitTerminated(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    delegate.awaitTerminated(paramLong, paramTimeUnit);
  }
  
  protected Executor executor()
  {
    new Executor()
    {
      public void execute(Runnable paramAnonymousRunnable)
      {
        MoreExecutors.newThread((String)threadNameSupplier.get(), paramAnonymousRunnable).start();
      }
    };
  }
  
  public final Throwable failureCause()
  {
    return delegate.failureCause();
  }
  
  public final boolean isRunning()
  {
    return delegate.isRunning();
  }
  
  protected String serviceName()
  {
    return getClass().getSimpleName();
  }
  
  protected abstract void shutDown()
    throws Exception;
  
  public final Service startAsync()
  {
    delegate.startAsync();
    return this;
  }
  
  protected abstract void startUp()
    throws Exception;
  
  public final Service.State state()
  {
    return delegate.state();
  }
  
  public final Service stopAsync()
  {
    delegate.stopAsync();
    return this;
  }
  
  public String toString()
  {
    return serviceName() + " [" + state() + "]";
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractIdleService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */