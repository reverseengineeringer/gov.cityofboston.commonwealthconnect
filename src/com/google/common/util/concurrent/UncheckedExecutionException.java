package com.google.common.util.concurrent;

import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@GwtCompatible
public class UncheckedExecutionException
  extends RuntimeException
{
  private static final long serialVersionUID = 0L;
  
  protected UncheckedExecutionException() {}
  
  protected UncheckedExecutionException(@Nullable String paramString)
  {
    super(paramString);
  }
  
  public UncheckedExecutionException(@Nullable String paramString, @Nullable Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public UncheckedExecutionException(@Nullable Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.UncheckedExecutionException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */