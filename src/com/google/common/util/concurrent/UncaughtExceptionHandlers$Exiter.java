package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import java.io.PrintStream;
import java.util.logging.Level;
import java.util.logging.Logger;

@VisibleForTesting
final class UncaughtExceptionHandlers$Exiter
  implements Thread.UncaughtExceptionHandler
{
  private static final Logger logger = Logger.getLogger(Exiter.class.getName());
  private final Runtime runtime;
  
  UncaughtExceptionHandlers$Exiter(Runtime paramRuntime)
  {
    runtime = paramRuntime;
  }
  
  public void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    try
    {
      logger.log(Level.SEVERE, String.format("Caught an exception in %s.  Shutting down.", new Object[] { paramThread }), paramThrowable);
      return;
    }
    catch (Throwable paramThread)
    {
      System.err.println(paramThrowable.getMessage());
      System.err.println(paramThread.getMessage());
      return;
    }
    finally
    {
      runtime.exit(1);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.UncaughtExceptionHandlers.Exiter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */