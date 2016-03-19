package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import javax.annotation.Nullable;

class Futures$ChainingListenableFuture<I, O>
  extends AbstractFuture<O>
  implements Runnable
{
  private AsyncFunction<? super I, ? extends O> function;
  private ListenableFuture<? extends I> inputFuture;
  private final CountDownLatch outputCreated = new CountDownLatch(1);
  private volatile ListenableFuture<? extends O> outputFuture;
  
  private Futures$ChainingListenableFuture(AsyncFunction<? super I, ? extends O> paramAsyncFunction, ListenableFuture<? extends I> paramListenableFuture)
  {
    function = ((AsyncFunction)Preconditions.checkNotNull(paramAsyncFunction));
    inputFuture = ((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
  }
  
  private void cancel(@Nullable Future<?> paramFuture, boolean paramBoolean)
  {
    if (paramFuture != null) {
      paramFuture.cancel(paramBoolean);
    }
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    if (super.cancel(paramBoolean))
    {
      cancel(inputFuture, paramBoolean);
      cancel(outputFuture, paramBoolean);
      return true;
    }
    return false;
  }
  
  public void run()
  {
    try
    {
      Object localObject1 = Uninterruptibles.getUninterruptibly(inputFuture);
      localObject1 = (ListenableFuture)Preconditions.checkNotNull(function.apply(localObject1), "AsyncFunction may not return null.");
      outputFuture = ((ListenableFuture)localObject1);
      if (isCancelled())
      {
        ((ListenableFuture)localObject1).cancel(wasInterrupted());
        outputFuture = null;
        return;
      }
    }
    catch (CancellationException localCancellationException)
    {
      cancel(false);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      setException(localExecutionException.getCause());
      return;
      localExecutionException.addListener(new Runnable()
      {
        public void run()
        {
          try
          {
            set(Uninterruptibles.getUninterruptibly(localExecutionException));
            return;
          }
          catch (CancellationException localCancellationException)
          {
            cancel(false);
            return;
          }
          catch (ExecutionException localExecutionException)
          {
            setException(localExecutionException.getCause());
            return;
          }
          finally
          {
            Futures.ChainingListenableFuture.access$302(Futures.ChainingListenableFuture.this, null);
          }
        }
      }, MoreExecutors.sameThreadExecutor());
      return;
    }
    catch (UndeclaredThrowableException localUndeclaredThrowableException)
    {
      setException(localUndeclaredThrowableException.getCause());
      return;
    }
    catch (Throwable localThrowable)
    {
      setException(localThrowable);
      return;
    }
    finally
    {
      function = null;
      inputFuture = null;
      outputCreated.countDown();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ChainingListenableFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */