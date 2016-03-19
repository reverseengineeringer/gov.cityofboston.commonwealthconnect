package com.google.common.io;

import com.google.common.annotations.VisibleForTesting;
import java.io.Closeable;
import java.lang.reflect.Method;

@VisibleForTesting
final class Closer$SuppressingSuppressor
  implements Closer.Suppressor
{
  static final SuppressingSuppressor INSTANCE = new SuppressingSuppressor();
  static final Method addSuppressed = getAddSuppressed();
  
  private static Method getAddSuppressed()
  {
    try
    {
      Method localMethod = Throwable.class.getMethod("addSuppressed", new Class[] { Throwable.class });
      return localMethod;
    }
    catch (Throwable localThrowable) {}
    return null;
  }
  
  static boolean isAvailable()
  {
    return addSuppressed != null;
  }
  
  public void suppress(Closeable paramCloseable, Throwable paramThrowable1, Throwable paramThrowable2)
  {
    if (paramThrowable1 == paramThrowable2) {
      return;
    }
    try
    {
      addSuppressed.invoke(paramThrowable1, new Object[] { paramThrowable2 });
      return;
    }
    catch (Throwable localThrowable)
    {
      Closer.LoggingSuppressor.INSTANCE.suppress(paramCloseable, paramThrowable1, paramThrowable2);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Closer.SuppressingSuppressor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */