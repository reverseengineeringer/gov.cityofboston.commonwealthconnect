package com.google.common.io;

import com.google.common.annotations.VisibleForTesting;
import java.io.Closeable;
import java.util.logging.Level;
import java.util.logging.Logger;

@VisibleForTesting
final class Closer$LoggingSuppressor
  implements Closer.Suppressor
{
  static final LoggingSuppressor INSTANCE = new LoggingSuppressor();
  
  public void suppress(Closeable paramCloseable, Throwable paramThrowable1, Throwable paramThrowable2)
  {
    Closeables.logger.log(Level.WARNING, "Suppressing exception thrown when closing " + paramCloseable, paramThrowable2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Closer.LoggingSuppressor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */